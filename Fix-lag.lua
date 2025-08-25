-- Giảm lag cực mạnh
--local validPlaceIds = {2753915549, 4442272183, 7449423635}
--local currentPlaceId = game.PlaceId

--local isValid = false
--for _, id in ipairs(validPlaceIds) do
  --  if currentPlaceId == id then
   --     isValid = true
    --    break
   -- end
--end

--if not isValid then return end  -- Không đúng place id → không chạy gì

-- Giảm lag cực mạnh, chỉ giữ lại player + quái + collider map
--local urls = { 
    --"https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/fan_game1234.lua", 
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_sky.lua",
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_lightning.lua",
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_models.lua", 
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_texture_player-mob.lua", 
--    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_animation.lua", 
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_other_sounds.lua",  
  --  "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_player_sounds.lua"
--}

--for i, url in ipairs(urls) do
 --   task.spawn(function()
   --     task.wait((i - 1) * 5) -- chờ 0s, 5s, 10s, ...
     --   pcall(function()
 --        loadstring(game:HttpGet(url))()
       -- end)
--    end)
--end 


--Hunty zombie 
-- Hunty Zombie
--local huntyPlaceIds = {86076978383613} -- PlaceId hợp lệ
--local currentPlaceId = game.PlaceId

--local isValid = false
--for _, id in ipairs(huntyPlaceIds) do
    --if currentPlaceId == id then
      --  isValid = true
      --  break
  --  end
--end

--if isValid then
   -- local huntyUrls = { 
    --    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
    --    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/fan_game1234.lua", 
   --     "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_texture_player_hunty_zombie.lua", 
     --   "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_model_school_hunty_zombie.lua", 
     --   "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_model_sewers_hunty_zombie.lua"
--    }

 --   for i, url in ipairs(huntyUrls) do
      --  task.spawn(function()
          --  task.wait((i - 1) * 5) -- chờ 0s, 5s, 10s,...
         --   pcall(function()
        --        loadstring(game:HttpGet(url))()
         --   end)
      --  end)
  -- Giảm lag cực mạnh (Blox Fruits)
local validPlaceIdsBF = {2753915549, 4442272183, 7449423635}
local currentPlaceIdBF = game.PlaceId

local isValidBF = false
for _, id in ipairs(validPlaceIdsBF) do
    if currentPlaceIdBF == id then
        isValidBF = true
        break
    end
end

if isValidBF then
    local urlsBF = { 
        "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/fan_game1234.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_sky.lua",
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_lightning.lua",
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_models.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_texture_player-mob.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_animation.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_other_sounds.lua",  
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_player_sounds.lua"
    }

    for i, url in ipairs(urlsBF) do
        task.spawn(function()
            task.wait((i - 1) * 5)
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end
end


-- Hunty Zombie
local huntyPlaceIds = {86076978383613}
local currentPlaceIdHunty = game.PlaceId

local isValidHunty = false
for _, id in ipairs(huntyPlaceIds) do
    if currentPlaceIdHunty == id then
        isValidHunty = true
        break
    end
end

if isValidHunty then
    local huntyUrls = { 
        "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/fan_game1234.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_texture_player_hunty_zombie.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_model_school_hunty_zombie.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_model_sewers_hunty_zombie.lua"
    }

    for i, url in ipairs(huntyUrls) do
        task.spawn(function()
            task.wait((i - 1) * 5)
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end
end


-- Grow a Garden
local gagPlaceIds = {126884695634066}
local currentPlaceIdGag = game.PlaceId

local isValidGag = false
for _, id in ipairs(gagPlaceIds) do
    if currentPlaceIdGag == id then
        isValidGag = true
        break
    end
end

if isValidGag then
    local gagUrls = {  
        "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
        "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_model_plantgag.lua"
    }

    for i, url in ipairs(gagUrls) do
        task.spawn(function()
            task.wait((i - 1) * 5)
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end
                        





















