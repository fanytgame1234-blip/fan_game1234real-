-- Giảm lag cực mạnh, chỉ giữ lại player + quái + collider map
getgenv().LagMode = true  -- true = bật giảm lag, false = tắt

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

function SetLagMode(state)
    for _, obj in ipairs(Workspace:GetChildren()) do
        -- Giữ lại Player + Quái
        if obj:IsA("Model") then
            if Players:FindFirstChild(obj.Name) then
                continue -- giữ lại người chơi
            elseif obj:FindFirstChild("Humanoid") then
                continue -- giữ lại NPC/quái
            end
        end
        
        -- Nếu là Part/Mesh của map
        if obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("UnionOperation") then
            if obj.CanCollide then
                obj.Transparency = state and 1 or 0 -- làm vô hình nhưng vẫn giữ collision
                if obj:FindFirstChildOfClass("Texture") then
                    obj:FindFirstChildOfClass("Texture").Transparency = state and 1 or 0
                end
            else
                obj.LocalTransparencyModifier = state and 1 or 0
            end
        elseif obj:IsA("Folder") or obj:IsA("Model") then
            -- đệ quy duyệt map con
            for _, part in ipairs(obj:GetDescendants()) do
                if part:IsA("BasePart") then
                    if part.CanCollide then
                        part.Transparency = state and 1 or 0
                    else
                        part.LocalTransparencyModifier = state and 1 or 0
                    end
                end
            end
        end
    end
    
    -- Xoá bầu trời
    if state and Workspace:FindFirstChildOfClass("Sky") then
        Workspace:FindFirstChildOfClass("Sky"):Destroy()
    end
end

-- Auto bật khi chạy
SetLagMode(getgenv().LagMode)

-- Lệnh toggle
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.L then -- ấn L để bật/tắt
        getgenv().LagMode = not getgenv().LagMode
        SetLagMode(getgenv().LagMode)
        print("LagMode:", getgenv().LagMode)
    end
end)