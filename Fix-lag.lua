-- Script Fix Lag By @fan_game1234 (Y-T)
-- Đợi game load xong
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local placeId = game.PlaceId

-- Bảng PlaceId -> URL file con
local scripts = {
    -- Blox Fruits
    [27539155
















































