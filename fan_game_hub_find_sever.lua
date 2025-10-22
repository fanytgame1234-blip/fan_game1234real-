repeat task.wait() until game:IsLoaded()
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- 🧱 GUI chính
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FanGameMiniHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = plr:WaitForChild("PlayerGui")

-- 🟥 Icon nhỏ (logo)
local IconButton = Instance.new("ImageButton")
IconButton.Name = "HubIcon"
IconButton.Size = UDim2.new(0, 60, 0, 60)
IconButton.Position = UDim2.new(0.05, 0, 0.4, 0)
IconButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
IconButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
IconButton.BorderSizePixel = 2
IconButton.Active = true
IconButton.Draggable = true -- ✅ Kéo icon được
-- 🧷 Thay icon này bằng icon thật của bạn nha
IconButton.Image = "rbxthumb://type=Asset&id=97428005191166&w=150&h=150"
IconButton.Parent = ScreenGui

-- 📦 Menu chính (ẩn ban đầu)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 240, 0, 160)
Frame.Position = UDim2.new(0.5, -120, 0.4, -80)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 2
Frame.Visible = false
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "fan_game hub - server empty"
Title.Size = UDim2.new(1, -10, 0, 25)
Title.Position = UDim2.new(0, 5, 0, 5)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1
Title.TextScaled = true
Title.Font = Enum.Font.Code
Title.Parent = Frame

-- ⚙️ Tạo nút
local function makeButton(text, yPos, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, yPos)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(45, 0, 0)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Code
	btn.TextScaled = true
	btn.AutoButtonColor = false
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(45, 0, 0)
	end)
	btn.MouseButton1Click:Connect(callback)
	btn.Parent = Frame
end

-- 🧠 Nút gọi script
makeButton("Tìm server <3", 40, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/find_sever_empty.lua"))()
end)

makeButton("Tìm server <5", 80, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/refs/heads/main/empty.lua"))()
end)

makeButton("Tìm server <8", 120, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/refs/heads/main/empty8.lua"))()
end)

-- 🎛 Toggle menu khi ấn icon
local open = false
IconButton.MouseButton1Click:Connect(function()
	open = not open
	Frame.Visible = open
end)