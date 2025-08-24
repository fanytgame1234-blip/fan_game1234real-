-- Giảm lag cực mạnh
local validPlaceIds = {2753915549, 4442272183, 7449423635}
local currentPlaceId = game.PlaceId

local isValid = false
for _, id in ipairs(validPlaceIds) do
    if currentPlaceId == id then
        isValid = true
        break
    end
end

if not isValid then return end  -- Không đúng place id → không chạy gì

-- Giảm lag cực mạnh, chỉ giữ lại player + quái + collider map
local urls = {
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_sky.lua",
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_lightning.lua",
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_models.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_texture_player-mob.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_animation.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_other_sounds.lua",  
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_player_sounds.lua"
}

for i, url in ipairs(urls) do
    task.spawn(function()
        task.wait((i - 1) * 5) -- chờ 0s, 5s, 10s, ...
        pcall(function()
            loadstring(game:HttpGet(url))()
        end)
    end)
end 


--Hunty zombie 
-- Danh sách các PlaceId hợp lệ
local validPlaceIds = {
    86076978383613, -- PlaceId
    
}

-- Kiểm tra xem PlaceId hiện tại có hợp lệ không
local isValidPlace = false
for _, id in ipairs(validPlaceIds) do
    if game.PlaceId == id then
        isValidPlace = true
        break
    end
end

-- Nếu PlaceId hợp lệ, tải và chạy script từ URL
if isValidPlace then
    local url = { "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_texture_player_hunty_zombie.lua", 
    }
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end

















