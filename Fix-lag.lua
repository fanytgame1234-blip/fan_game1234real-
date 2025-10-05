-- Script Fix Lag By @fan_game1234 (Y-T)
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local placeId = game.PlaceId

-- Bảng PlaceId -> URL file con
local scripts = {
    -- Blox Fruits
    [2753915549] = "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Blox.lua",
    [4442272183] = "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Blox.lua",
    [7449423635] = "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Blox.lua",

    -- Hunty Zombie
    [86076978383613] = "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Hunty.lua",

    -- Grow a Garden
    [126884695634066] = "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Gag.lua", 

    -- Build a plane    
    [137925884276740] = "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/refs/heads/main/Main-Fix-Lag-Build-A-Plane.lua", 

    -- Dead rails 
    [70876832253163] = "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/Main-Fix-Lag_Dead-Rails.lua", 
    --Plant vs thúi não 
    [127742093697776] = "--"
}

-- Kiểm tra và chạy script con
local url = scripts[placeId]
if url then
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if ok then
        StarterGui:SetCore("SendNotification", {
            Title = "Fix Lag",
            Text = "✅ Script đã load!",
            Duration = 5,
            Icon = "rbxassetid://97428005191166"  
        })
    else
        StarterGui:SetCore("SendNotification", { 
            Title = "Fix Lag",
            Text = "Tải không được! :(",
            Duration = 5,
            Icon = "rbxassetid://97428005191166"
        })
    end
else
    StarterGui:SetCore("SendNotification", { 
        Title = "Fix Lag",
        Text = "Đợi cập nhật đi! 💀",
        Duration = 5,
        Icon = "rbxassetid://97428005191166"
    })
end













































