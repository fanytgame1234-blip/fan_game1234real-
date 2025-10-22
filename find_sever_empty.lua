repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- fan_game Hub | Auto Find Empty Server
-- by @fan_game1234 (YT)

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local placeId = game.PlaceId
local maxPlayers = 3
local checkDelay = 30
local checkedServers = 0

local function notify(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = "rbxassetid://97428005191166",
        Duration = 5
    })
end

local function findServer()
    local cursor = ""
    local bestServer = nil
    local startTime = tick()

    repeat
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or "")
        local success, response = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)

        if success and response and response.data then
            for _, server in pairs(response.data) do
                checkedServers += 1
                if server.playing < maxPlayers then
                    bestServer = server
                    break
                end
            end
            cursor = response.nextPageCursor or ""
        else
            notify("fan_game Hub", "Không thể tải dữ liệu server 😭")
            return nil
        end

        if tick() - startTime > checkDelay then
            notify("fan_game Hub", "Không có server trống 😭")
            notify("fan_game Hub", "Tổng đã tìm " .. tostring(checkedServers) .. " server!")
            return nil
        end

        task.wait(0.2)
    until bestServer or cursor == ""

    notify("fan_game Hub", "Tổng đã tìm " .. tostring(checkedServers) .. " server!")
    return bestServer
end

local function autoJoinIfFull()
    while task.wait(5) do
        if #Players:GetPlayers() > maxPlayers then
            notify("fan_game Hub", "Có người vô rồi 💀 | Đang tìm server mới...")
            local server = findServer()
            if server then
                notify("fan_game Hub", "Đang teleport tới server ít người 🧠")
                TeleportService:TeleportToPlaceInstance(placeId, server.id, LocalPlayer)
            end
        end
    end
end

task.spawn(autoJoinIfFull)
notify("fan_game Hub", "Script đã khởi động 🔥 | Đang kiểm tra server ít người...")