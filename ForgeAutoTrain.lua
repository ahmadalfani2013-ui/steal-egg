-- ==========================================
-- ⚔️ FORGE AUTO-TRAIN (FAST SWING) ⚔️
-- Script khusus buat nambang/ayun pedang cepet
-- 100% Keyless & Standalone
-- ==========================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local isAutoTrain = false
local isAntiAfk = true
local clickSpeed = 0.01 -- 10ms (Sangat cepat)

-- ==========================================
-- UI SETUP (Tema Forge: Hitam & Emas)
-- ==========================================
local oldGui = game.CoreGui:FindFirstChild("ForgeAutoTrainUI") or LocalPlayer.PlayerGui:FindFirstChild("ForgeAutoTrainUI")
if oldGui then oldGui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ForgeAutoTrainUI"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(250, 160)
Main.Position = UDim2.new(0.5, -125, 0.5, -80)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255, 180, 0) -- Emas
Stroke.Thickness = 2

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(30, 25, 15)
Title.Text = "⚔️ FORGE AUTO-TRAIN"
Title.TextColor3 = Color3.fromRGB(255, 180, 0)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 14
Title.Parent = Main
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

-- Tombol Auto Train
local TrainBtn = Instance.new("TextButton")
TrainBtn.Size = UDim2.new(1, -20, 0, 45)
TrainBtn.Position = UDim2.fromOffset(10, 45)
TrainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
TrainBtn.Text = "AUTO TRAIN : OFF"
TrainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TrainBtn.Font = Enum.Font.GothamBold
TrainBtn.TextSize = 13
TrainBtn.Parent = Main
Instance.new("UICorner", TrainBtn).CornerRadius = UDim.new(0, 8)

-- Tombol Anti AFK
local AfkBtn = Instance.new("TextButton")
AfkBtn.Size = UDim2.new(1, -20, 0, 35)
AfkBtn.Position = UDim2.fromOffset(10, 100)
AfkBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100) -- Default ON
AfkBtn.Text = "ANTI AFK : ON"
AfkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AfkBtn.Font = Enum.Font.GothamBold
AfkBtn.TextSize = 11
AfkBtn.Parent = Main
Instance.new("UICorner", AfkBtn).CornerRadius = UDim.new(0, 8)

-- ==========================================
-- LOGIKA AUTO TRAIN (SPAM KLIK M1)
-- ==========================================
TrainBtn.MouseButton1Click:Connect(function()
    isAutoTrain = not isAutoTrain
    if isAutoTrain then
        TrainBtn.Text = "AUTO TRAIN : ON"
        TrainBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
        TrainBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    else
        TrainBtn.Text = "AUTO TRAIN : OFF"
        TrainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        TrainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

AfkBtn.MouseButton1Click:Connect(function()
    isAntiAfk = not isAntiAfk
    if isAntiAfk then
        AfkBtn.Text = "ANTI AFK : ON"
        AfkBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    else
        AfkBtn.Text = "ANTI AFK : OFF"
        AfkBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    end
end)

-- Loop Spam Klik
task.spawn(function()
    while task.wait(clickSpeed) do
        if isAutoTrain then
            -- Nge-spam klik kiri (M1) tanpa ngerusak chat
            pcall(function()
                VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                VirtualUser:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
end)

-- Anti AFK
LocalPlayer.Idled:Connect(function()
    if isAntiAfk then
        pcall(function()
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
end)

-- Fitur Drag
local dragging, dragInput, dragStart, startPos
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)
Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("[FORGE AUTO-TRAIN] Loaded! Silakan nyalain Auto Train.")
