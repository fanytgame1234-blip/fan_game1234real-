-- Fix lag cho Grow a Garden
local gagUrls = {  
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/main/Fix-Lag-Hub-Ui.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/delete_texture_player-npc_gag.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/delete_lightning_gag.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_fx_gag.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/delete_all_sounds_Gag.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/delete_animation_Gag.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_model_plantgag.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/main/hide_other_player.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/delete_model/refs/heads/main/lowui_.lua"
}
for i, url in ipairs(gagUrls) do
    task.wait(1 * (i - 1))
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)

end







