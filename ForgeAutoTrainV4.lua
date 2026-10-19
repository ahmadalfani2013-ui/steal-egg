-- ==========================================
-- ⚔️ FORGE V4 (SMART REMOTE SPAMMER) ⚔️
-- Nembak RemoteEvent Combat secara spesifik
-- ==========================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local isActive = false
local spamSpeed = 0.05 -- Default 50ms. Ubah ke 0.01 buat super brutal

-- UI SETUP
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ForgeV4UI"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(250, 150)
Main.Position = UDim2.new(0.5, -125, 0.5, -75)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(30, 25, 15)
Title.Text = "⚔️ FORGE V4 (SMART REMOTE)"
Title.TextColor3 = Color3.fromRGB(255, 100, 100)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 13
Title.Parent = Main
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(1, -20, 0, 45)
Btn.Position = UDim2.fromOffset(10, 45)
Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Btn.Text = "SMART REMOTE : OFF"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 13
Btn.Parent = Main
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -20, 0, 20)
Status.Position = UDim2.fromOffset(10, 95)
Status.BackgroundTransparency = 1
Status.Text = "Status: Menunggu..."
Status.TextColor3 = Color3.fromRGB(150, 150, 160)
Status.Font = Enum.Font.Gotham
Status.TextSize = 10
Status.Parent = Main

Btn.MouseButton1Click:Connect(function()
    isActive = not isActive
    Btn.Text = isActive and "SMART REMOTE : ON" or "SMART REMOTE : OFF"
    Btn.BackgroundColor3 = isActive and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(40, 40, 50)
    Status.Text = isActive and "Status: Mencari Remote..." or "Status: Menunggu..."
end)

-- LOGIKA UTAMA
task.spawn(function()
    while task.wait(spamSpeed) do
        if isActive then
            local found = 0
            for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
                if obj:IsA("RemoteEvent") then
                    local name = obj.Name:lower()
                    -- Cari nama remote yang spesifik buat combat
                    if name == "combat" or name == "attack" or name == "hit" or name == "swing" or name == "m1" then
                        pcall(function()
                            obj:FireServer()
                            found = found + 1
                        end)
                    end
                end
            end
            
            if found > 0 then
                Status.Text = "Status: Nembak " .. found .. " Remote!"
                Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            else
                Status.Text = "Status: Gak ada Remote Combat (pake V2)"
                Status.TextColor3 = Color3.fromRGB(255, 100, 100)
            end
        end
    end
end)
