local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 30, 0, 10)      -- chữ nhỏ như hạt gạo
textLabel.Position = UDim2.new(0, 5, 1, -15)   -- góc trái dưới
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1,1,1)       -- màu trắng
textLabel.TextStrokeColor3 = Color3.new(0,0,0) -- viền đen
textLabel.TextStrokeTransparency = 0           -- viền hiện
textLabel.TextSize = 8                          -- cỡ siêu nhỏ
textLabel.Text = "@fan_game1234"
textLabel.Font = Enum.Font.Code                 -- font code

textLabel.Parent = screenGui
