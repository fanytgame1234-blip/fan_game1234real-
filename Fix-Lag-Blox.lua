-- Fix lag cho Blox Fruits
local urlsBF = { 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Hub-Ui.lua", 
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
    task.wait(10 * (i - 1))
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)

end
