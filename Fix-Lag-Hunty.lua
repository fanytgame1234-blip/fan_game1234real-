-- Fix lag cho Hunty Zombie
local huntyUrls = { 
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/fan_game1234.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_texture_player_hunty_zombie.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/delete_model_school_hunty_zombie.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_model_sewers_hunty_zombie.lua"
}

for i, url in ipairs(huntyUrls) do
    task.wait(10 * (i - 1))
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end