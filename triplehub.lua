-- =========================================================================
-- 🌟 TRIPLE HUB: PULSE x CHILLI x SENA (FULL KEYLESS) 🌟
-- Menyatukan 3 Script Steal An Egg dalam 1 Execute
-- =========================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- LINK SCRIPT (SEMUA KEYLESS)
local PulseURL = "https://api.luarmor.net/files/v4/loaders/9eaf6021130040db2646aa9b094427ef.lua" -- Pulse Loader
local ChilliURL = "https://luauforge-antiraw.netlify.app/raw/b2GaCbtITNxIA6Qayyauq1a" -- Chilli Bypass (Tanpa Key)
local SenaURL = "https://senahub.xyz/senav6" -- Sena Hub v6 (Keyless)

-- ============================================
-- 1. NOTIFIKASI LOADING
-- ============================================
local notifGui = Instance.new("ScreenGui")
notifGui.Name = "TripleLoadingNotif"
notifGui.ResetOnSpawn = false
notifGui.Parent = CoreGui

local bg = Instance.new("Frame")
bg.Size = UDim2.fromOffset(320, 50)
bg.Position = UDim2.new(0.5, -160, 0.1, 0)
bg.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
bg.BorderSizePixel = 0
bg.Parent = notifGui
Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 8)

local txt = Instance.new("TextLabel")
txt.Size = UDim2.new(1, 0, 1, 0)
txt.BackgroundTransparency = 1
txt.Text = "⏳ Menyiapkan Pulse, Chilli, & Sena..."
txt.TextColor3 = Color3.fromRGB(255, 255, 255)
txt.Font = Enum.Font.GothamBold
txt.TextSize = 12
txt.Parent = bg

-- ============================================
-- 2. LOAD PULSE HUB
-- ============================================
task.spawn(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet(PulseURL))()
    end)
    if not success then warn("Pulse Hub gagal: " .. tostring(err)) end
end)

-- ============================================
-- 3. LOAD CHILLI HUB (Jeda 2 Detik)
-- ============================================
task.spawn(function()
    task.wait(2)
    txt.Text = "⏳ Menyiapkan Chilli Hub..."
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(ChilliURL))()
    end)
    if not success then warn("Chilli Hub gagal: " .. tostring(err)) end
end)

-- ============================================
-- 4. LOAD SENA HUB (Jeda 4 Detik)
-- ============================================
task.spawn(function()
    task.wait(4)
    txt.Text = "⏳ Menyiapkan Sena Hub..."
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(SenaURL))()
    end)
    
    if success then
        task.wait(1)
        notifGui:Destroy() -- Hapus notif kalau semua udah jalan
    else
        txt.Text = "❌ Sena Hub gagal dimuat."
        txt.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)
