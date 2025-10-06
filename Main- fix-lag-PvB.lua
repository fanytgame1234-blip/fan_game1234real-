-- ⚡ Fix lag cho Plant vs Brainrot 
-- Đợi game load xong
repeat task.wait() until game:IsLoaded()

local Pvburl = {
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Hub-Ui.lua", 
   -- "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/hide_other_player.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/delete_lightning_gag.lua", -- dùng lại của Gag vì tui hơi lười:) 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/hide_model_plant_vs_brainrot.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model//main/delete_sky.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/delete_all_sound_all_game.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/fan_game1234.lua"
}
for i, url in ipairs(Pvburl) do
    task.wait(1 * (i - 1))
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)

end   






