-- Giảm lag cực mạnh, chỉ giữ lại player + quái + collider map
--getgenv().LagMode = true  -- true = bật giảm lag, false = tắt

--local Players = game:GetService("Players")
--local LocalPlayer = Players.LocalPlayer
--local Workspace = game:GetService("Workspace")

--function SetLagMode(state)
   -- for _, obj in ipairs(Workspace:GetChildren()) do
        -- Giữ lại Player + Quái
       -- if obj:IsA("Model") then
          --  if Players:FindFirstChild(obj.Name) then
              --  continue -- giữ lại người chơi
          --  elseif obj:FindFirstChild("Humanoid") then
               -- continue -- giữ lại NPC/quái
          --  end
       -- end
        


local urls = {
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_sky.lua",
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_lightning.lua",
    "https://raw.githubusercontent.com/fanytgame1234-blip/fan_game1234real-/refs/heads/main/delete_models.lua"
}

for i, url in ipairs(urls) do
    task.spawn(function()
        task.wait((i - 1) * 10) -- chờ 0s, 10s, 20s theo thứ tự
        local ok, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if ok then
            warn("✅ Loaded:", url)
        else
            warn("❌ Error loading:", url, err)
        end
    end)
end


