--// Fix Lag Hub UI by fan_game1234 

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Stats = game:GetService("Stats")

-- UI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false

local headerHeight = 30
local fullSize = UDim2.new(0,280,0,160)
local minimizedSize = UDim2.new(0,280,0,headerHeight)
local tweenTime = 0.5

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = fullSize
MainFrame.Position = UDim2.new(0,20,0,20)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Header
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1,0,0,headerHeight)
Header.BackgroundColor3 = Color3.fromRGB(45,45,45)
Header.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-70,1,0)
Title.Position = UDim2.new(0,5,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Fix lag Hub - fan_game1234"
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(200,200,200)
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeButton = Instance.new("TextButton", Header)
MinimizeButton.Size = UDim2.new(0,30,1,0)
MinimizeButton.Position = UDim2.new(1,-65,0,0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "-"
MinimizeButton.Font = Enum.Font.Code
MinimizeButton.TextSize = 20
MinimizeButton.TextColor3 = Color3.fromRGB(255,255,255)

local CloseButton = Instance.new("TextButton", Header)
CloseButton.Size = UDim2.new(0,30,1,0)
CloseButton.Position = UDim2.new(1,-30,0,0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.Code
CloseButton.TextSize = 20
CloseButton.TextColor3 = Color3.fromRGB(255,255,255)

local Separator = Instance.new("Frame", MainFrame)
Separator.Size = UDim2.new(1,0,0,2)
Separator.Position = UDim2.new(0,0,0,headerHeight)
Separator.BackgroundColor3 = Color3.fromRGB(100,100,100)
Separator.BorderSizePixel = 0

local Content = Instance.new("Frame", MainFrame)
Content.Size = UDim2.new(1,0,1,-headerHeight-2)
Content.Position = UDim2.new(0,0,0,headerHeight+2)
Content.BackgroundTransparency = 1
Content.ClipsDescendants = true

-- Labels
local function MakeLabel(parent, yPos, size)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = size or UDim2.new(1,-10,0,20)
    lbl.Position = UDim2.new(0,5,0,yPos)
    lbl.BackgroundTransparency = 1
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 14
    lbl.TextColor3 = Color3.fromRGB(255,255,255)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local FpsLabel = MakeLabel(Content,5)
local PingLabel = MakeLabel(Content,30)
local TimeLabel = MakeLabel(Content,55, UDim2.new(1,-10,0,22))
TimeLabel.TextSize = 16
local MessageLabel = MakeLabel(Content,85)
MessageLabel.Text = "[Chúc chơi vui vẻ!]"
MessageLabel.TextColor3 = Color3.fromRGB(0,255,0)

-- Logic FPS/Ping
local frames, lastUpdate, elapsedTime = 0, tick(), 0
local isOpen = true

RunService.RenderStepped:Connect(function()
    frames += 1
    local now = tick()
    if now - lastUpdate >= 1 then
        local fps = frames / (now - lastUpdate)
        frames = 0
        lastUpdate = now
        -- FPS màu
        if fps < 10 then
            FpsLabel.TextColor3 = Color3.fromRGB(255,0,0)
        elseif fps < 20 then
            FpsLabel.TextColor3 = Color3.fromRGB(255,255,0)
        else
            FpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
        end
        FpsLabel.Text = "FPS: "..math.floor(fps)
    end

    local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    PingLabel.Text = "Ping(ms): "..ping
    PingLabel.TextColor3 = (ping <= 150) and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
end)

-- Thời gian chơi + lời nhắc
spawn(function()
    while true do
        wait(1)
        elapsedTime += 1
        local h = math.floor(elapsedTime/3600)
        local m = math.floor((elapsedTime%3600)/60)
        local s = elapsedTime%60
        TimeLabel.Text = string.format("Client: %02dh %02dm %02ds", h,m,s)

        if elapsedTime < 180*60 then
            MessageLabel.Text = "[Chúc chơi vui vẻ!]"
            MessageLabel.TextColor3 = Color3.fromRGB(0,255,0)
        else
            MessageLabel.Text = "[Nghỉ ngơi giữ sức đi!]"
            MessageLabel.TextColor3 = Color3.fromRGB(255,0,0)
        end
    end
end)

-- Toggle thu nhỏ/mở
local function ToggleFrame()
    isOpen = not isOpen
    TweenService:Create(MainFrame, TweenInfo.new(tweenTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Size = isOpen and fullSize or minimizedSize
    }):Play()
    TweenService:Create(Content, TweenInfo.new(tweenTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Size = isOpen and UDim2.new(1,0,1,-headerHeight-2) or UDim2.new(1,0,0,0)
    }):Play()
end

MinimizeButton.MouseButton1Click:Connect(ToggleFrame)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)