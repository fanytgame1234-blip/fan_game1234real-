--// Fix Lag Hub UI by fan_game1234 

-- Fix Lag Hub UI nâng cấp - Thu nhỏ/mở + FPS/Ping/ClientTime/CPU/GPU

-- Services
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local UIS = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- GUI chính
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "FixLagHubUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0,360,0,220)
frame.Position = UDim2.new(0,20,0,20)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Top bar
local topBar = Instance.new("Frame", frame)
topBar.Size = UDim2.new(1,0,0,30)
topBar.Position = UDim2.new(0,0,0,0)
topBar.BackgroundColor3 = Color3.fromRGB(40,40,40)

local title = Instance.new("TextLabel", topBar)
title.Text = "Fix Lag Hub - fan_game1234"
title.Size = UDim2.new(0.7,0,1,0)
title.Position = UDim2.new(0,10,0,0)
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.Code
title.TextSize = 18

local minimizeBtn = Instance.new("TextButton", topBar)
minimizeBtn.Text = "-"
minimizeBtn.Size = UDim2.new(0,25,1,0)
minimizeBtn.Position = UDim2.new(0.75,0,0,0)
minimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
minimizeBtn.Font = Enum.Font.Code
minimizeBtn.TextSize = 20

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0,25,1,0)
closeBtn.Position = UDim2.new(0.85,0,0,0)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 20

local separator = Instance.new("Frame", frame)
separator.Size = UDim2.new(1,-10,0,2)
separator.Position = UDim2.new(0,5,0,30)
separator.BackgroundColor3 = Color3.fromRGB(80,80,80)

-- Container chứa tất cả label
local container = Instance.new("Frame", frame)
container.Size = UDim2.new(1,0,1,-30)
container.Position = UDim2.new(0,0,0,30)
container.BackgroundTransparency = 1

-- Tạo label trong container
local function createLabel(yPos)
    local lbl = Instance.new("TextLabel", container)
    lbl.Position = UDim2.new(0,10,0,yPos)
    lbl.Size = UDim2.new(1,-20,0,25)
    lbl.BackgroundTransparency = 1
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 18
    lbl.TextColor3 = Color3.fromRGB(0,255,0)
    return lbl
end

local fpsLabel = createLabel(5)
local pingLabel = createLabel(35)
local clientTimeLabel = createLabel(65)
local cpuLabel = createLabel(95)
local gpuLabel = createLabel(125)
local msgLabel = createLabel(155)

-- Thu nhỏ/Mở
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local goal = {}
    if minimized then
        goal.Size = UDim2.new(0,360,0,30)
        container.Visible = false
    else
        goal.Size = UDim2.new(0,360,0,220)
        container.Visible = true
    end
    UIS:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- FPS/Ping/ClientTime/CPU/GPU update
local lastTime = tick()
local frameCount = 0
local FPS = 0
local startTime = tick() -- Client time
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    if tick() - lastTime >= 1 then
        FPS = frameCount / (tick() - lastTime)
        frameCount = 0
        lastTime = tick()
    end

    -- FPS
    local fpsColor = Color3.fromRGB(0,255,0)
    if FPS < 10 then fpsColor = Color3.fromRGB(255,0,0)
    elseif FPS < 20 then fpsColor = Color3.fromRGB(255,255,0) end
    fpsLabel.Text = string.format("FPS: %d", FPS)
    fpsLabel.TextColor3 = fpsColor

    -- Ping
    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local pingColor = Color3.fromRGB(0,255,0)
    if ping > 150 then pingColor = Color3.fromRGB(255,0,0) end
    pingLabel.Text = string.format("Ping(ms): %d", ping)
    pingLabel.TextColor3 = pingColor

    -- ClientTime
    local elapsed = tick() - startTime
    local h = math.floor(elapsed/3600)
    local m = math.floor((elapsed%3600)/60)
    local s = math.floor(elapsed%60)
    clientTimeLabel.Text = string.format("Client: %02dh %02dm %02ds", h,m,s)
    clientTimeLabel.TextColor3 = (elapsed>180*60) and Color3.fromRGB(255,0,0) or Color3.fromRGB(0,255,0)

    -- Lời nhắc
    msgLabel.Text = (elapsed>180*60) and "[Nghỉ ngơi giữ sức đi!]" or "[Chúc chơi vui vẻ!]"
    msgLabel.TextColor3 = (elapsed>180*60) and Color3.fromRGB(255,0,0) or Color3.fromRGB(0,255,0)

    -- CPU Load ước lượng
    local mem = Stats:GetTotalMemoryUsageMb()
    local cpuColor = Color3.fromRGB(0,255,0)
    local cpuLoad = "Low"
    if mem > 800 then cpuColor = Color3.fromRGB(255,0,0); cpuLoad="High"
    elseif mem>400 then cpuColor = Color3.fromRGB(255,255,0); cpuLoad="Medium" end
    cpuLabel.Text = string.format("CPU Load(≈): %s", cpuLoad)
    cpuLabel.TextColor3 = cpuColor

    -- GPU Load ước lượng
    local gpuColor = Color3.fromRGB(0,255,0)
    local gpuLoad = "Low"
    if FPS < 15 then gpuColor = Color3.fromRGB(255,0,0); gpuLoad="High"
    elseif FPS < 25 then gpuColor = Color3.fromRGB(255,255,0); gpuLoad="Medium" end
    gpuLabel.Text = string.format("GPU Load(≈): %s", gpuLoad)
    gpuLabel.TextColor3 = gpuColor
end)
