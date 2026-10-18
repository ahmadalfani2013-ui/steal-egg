-- ============================================
-- TRIPLE HUB WRAPPER (PULSE x CHILLI x SENA)
-- 1 GUI Bersih, Kontrol 3 Script
-- ============================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local CoreGui = game:GetService("CoreGui")

-- LINK SCRIPT (SEMUA KEYLESS)
local PulseURL = "https://api.luarmor.net/files/v4/loaders/9eaf6021130040db2646aa9b094427ef.lua"
local ChilliURL = "https://luauforge-antiraw.netlify.app/raw/b2GaCbtITNxIA6Qayyauq1a"
-- Link Sena Hub yang beneran Keyless:
local SenaURL = "https://raw.githubusercontent.com/sabscrip-arch/srver/refs/heads/main/Stealanegg"

-- Hapus GUI Wrapper lama
local old = PlayerGui:FindFirstChild("TripleWrapper")
if old then old:Destroy() end

-- ============================================
-- 1. BIKIN GUI MASTER (Tampilan Bersih)
-- ============================================
local masterGui = Instance.new("ScreenGui")
masterGui.Name = "TripleWrapper"
masterGui.ResetOnSpawn = false
masterGui.Parent = PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(200, 200)
main.Position = UDim2.new(0, 20, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = masterGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
title.Text = "⚡ TRIPLE WRAPPER"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = main
Instance.new("UICorner", title).CornerRadius = UDim.new(0, 10)

-- Tombol Buka/Tutup Chilli
local btnChilli = Instance.new("TextButton")
btnChilli.Size = UDim2.new(1, -20, 0, 35)
btnChilli.Position = UDim2.fromOffset(10, 45)
btnChilli.BackgroundColor3 = Color3.fromRGB(225, 29, 72)
btnChilli.Text = "Buka Chilli Hub"
btnChilli.TextColor3 = Color3.fromRGB(255, 255, 255)
btnChilli.Font = Enum.Font.GothamBold
btnChilli.TextSize = 11
btnChilli.Parent = main
Instance.new("UICorner", btnChilli).CornerRadius = UDim.new(0, 6)

-- Tombol Buka/Tutup Sena
local btnSena = Instance.new("TextButton")
btnSena.Size = UDim2.new(1, -20, 0, 35)
btnSena.Position = UDim2.fromOffset(10, 90)
btnSena.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
btnSena.Text = "Buka Sena Hub"
btnSena.TextColor3 = Color3.fromRGB(0, 0, 0)
btnSena.Font = Enum.Font.GothamBold
btnSena.TextSize = 11
btnSena.Parent = main
Instance.new("UICorner", btnSena).CornerRadius = UDim.new(0, 6)

-- Tombol Buka/Tutup Pulse
local btnPulse = Instance.new("TextButton")
btnPulse.Size = UDim2.new(1, -20, 0, 35)
btnPulse.Position = UDim2.fromOffset(10, 135)
btnPulse.BackgroundColor3 = Color3.fromRGB(226, 168, 62)
btnPulse.Text = "Buka Pulse Hub"
btnPulse.TextColor3 = Color3.fromRGB(255, 255, 255)
btnPulse.Font = Enum.Font.GothamBold
btnPulse.TextSize = 11
btnPulse.Parent = main
Instance.new("UICorner", btnPulse).CornerRadius = UDim.new(0, 6)

-- ============================================
-- 2. LOAD SCRIPT & SEMBUNYIIN GUI ASLINYA
-- ============================================
local chilliGui, senaGui, pulseGui

local function hideOriginalGuis()
    for _, gui in ipairs(CoreGui:GetDescendants()) do
        if gui:IsA("ScreenGui") then
            local name = gui.Name:lower()
            if name:find("chilli") then
                if not chilliGui then chilliGui = gui end
                gui.Enabled = false
            elseif name:find("sena") then
                if not senaGui then senaGui = gui end
                gui.Enabled = false
            elseif name:find("pulse") or name:find("slate") then
                if not pulseGui then pulseGui = gui end
                gui.Enabled = false
            end
        end
    end
end

-- Load Pulse
task.spawn(function() pcall(function() loadstring(game:HttpGet(PulseURL))() end) end)

-- Load Chilli
task.spawn(function()
    task.wait(1.5)
    pcall(function() loadstring(game:HttpGet(ChilliURL))() end)
end)

-- Load Sena
task.spawn(function()
    task.wait(3)
    pcall(function() loadstring(game:HttpGet(SenaURL))() end)
end)

-- Pantau kalau GUI baru muncul, langsung sembunyiin
CoreGui.DescendantAdded:Connect(function()
    task.wait(0.5)
    hideOriginalGuis()
end)

task.wait(4)
hideOriginalGuis()

-- ============================================
-- 3. LOGIKA TOMBOL BUKA/TUTUP
-- ============================================
local chilliOpen = false
btnChilli.MouseButton1Click:Connect(function()
    if chilliGui and chilliGui.Parent then
        chilliOpen = not chilliOpen
        chilliGui.Enabled = chilliOpen
        btnChilli.Text = chilliOpen and "Tutup Chilli Hub" or "Buka Chilli Hub"
    else
        btnChilli.Text = "Chilli Loading..."
        task.wait(2)
        hideOriginalGuis()
        btnChilli.Text = "Buka Chilli Hub"
    end
end)

local senaOpen = false
btnSena.MouseButton1Click:Connect(function()
    if senaGui and senaGui.Parent then
        senaOpen = not senaOpen
        senaGui.Enabled = senaOpen
        btnSena.Text = senaOpen and "Tutup Sena Hub" or "Buka Sena Hub"
    else
        btnSena.Text = "Sena Loading..."
        task.wait(2)
        hideOriginalGuis()
        btnSena.Text = "Buka Sena Hub"
    end
end)

local pulseOpen = false
btnPulse.MouseButton1Click:Connect(function()
    if pulseGui and pulseGui.Parent then
        pulseOpen = not pulseOpen
        pulseGui.Enabled = pulseOpen
        btnPulse.Text = pulseOpen and "Tutup Pulse Hub" or "Buka Pulse Hub"
    else
        btnPulse.Text = "Pulse Loading..."
        task.wait(2)
        hideOriginalGuis()
        btnPulse.Text = "Buka Pulse Hub"
    end
end)
