-- ==========================================
-- ⚔️ FORGE AUTO-TRAIN V2 (TOOL SPAMMER) ⚔️
-- Maksa Tool (Pedang) buat terus aktif tanpa henti
-- ==========================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local isAutoTrain = false
local spamSpeed = 0.01

-- UI (Sama kayak sebelumnya)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ForgeV2UI"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(250, 120)
Main.Position = UDim2.new(0.5, -125, 0.5, -60)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(30, 25, 15)
Title.Text = "⚔️ FORGE V2 (TOOL SPAM)"
Title.TextColor3 = Color3.fromRGB(255, 180, 0)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 13
Title.Parent = Main
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(1, -20, 0, 45)
Btn.Position = UDim2.fromOffset(10, 45)
Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Btn.Text = "SPAM TOOL : OFF"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 13
Btn.Parent = Main
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

Btn.MouseButton1Click:Connect(function()
    isAutoTrain = not isAutoTrain
    Btn.Text = isAutoTrain and "SPAM TOOL : ON" or "SPAM TOOL : OFF"
    Btn.BackgroundColor3 = isAutoTrain and Color3.fromRGB(255, 180, 0) or Color3.fromRGB(40, 40, 50)
    Btn.TextColor3 = isAutoTrain and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
end)

-- LOGIKA UTAMA: Maksa Tool buat "Activated"
task.spawn(function()
    while task.wait(spamSpeed) do
        if isAutoTrain then
            local char = LocalPlayer.Character
            if char then
                -- Cari Tool (Pedang) yang lagi di-equip
                local tool = char:FindFirstChildWhichIsA("Tool")
                if tool then
                    -- Paksa tool buat aktif (nembak RemoteEvent internal tool-nya)
                    pcall(function()
                        tool:Activate()
                    end)
                end
            end
        end
    end
end)
