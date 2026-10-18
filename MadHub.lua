-- =========================================================================
-- 👑 MADS HUB (SENA + INSTANT TRAVEL) 👑
-- Script Lua Asli, Bukan JSON
-- =========================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 1. Fungsi Instant Travel
local function InstantPivotToEgg(egg)
    if not egg or not egg:IsDescendantOf(workspace) then return end
    local character = LocalPlayer.Character
    if not character then return end
    
    local targetPart
    if egg:IsA("BasePart") then targetPart = egg
    elseif egg:IsA("Model") then targetPart = egg.PrimaryPart or egg:FindFirstChildWhichIsA("BasePart", true) end
    if not targetPart then return end

    character:PivotTo(CFrame.new(targetPart.Position + Vector3.new(0, 4, 0)))
end

-- 2. Load Sena Hub
local SenaURL = "https://raw.githubusercontent.com/sabscrip-arch/srver/refs/heads/main/Stealanegg"
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet(SenaURL))()
    end)
end)

-- 3. Auto Instant Steal Loop (Nempel di background)
task.spawn(function()
    task.wait(3) -- Tunggu Sena Hub selesai loading
    while task.wait(0.15) do
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name:lower():find("telur") or obj.Name:lower():find("egg")) then
                    if not obj.Name:lower():find("treadmill") and not obj.Name:lower():find("base") then
                        local dist = (obj.Position - char.HumanoidRootPart.Position).Magnitude
                        -- Kalau jarak telur di bawah 20, langsung pivot instan!
                        if dist < 20 then
                            InstantPivotToEgg(obj)
                            break
                        end
                    end
                end
            end
        end
    end
end)
