-- Giảm lag cực mạnh, chỉ giữ lại player + quái + collider map
--local urls = {
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_sky.lua",
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_lightning.lua",
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_models.lua", 
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_texture_player-mob.lua", 
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_animation.lua", 
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_other_sounds.lua",  
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_player_sounds.lua"
    
--}

--for i, url in ipairs(urls) do
   -- task.spawn(function()
      --  task.wait((i - 1) * 5) -- chờ 0s, 10s, 20s theo 
            
            
            
        



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













