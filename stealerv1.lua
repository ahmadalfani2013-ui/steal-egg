-- ========================================================
-- ADVANCED EGG STEALER V2 BY AI (MANUAL FROM 0)
-- ========================================================

-- 1. Anti-Duplikat Panel
if game.CoreGui:FindFirstChild("EggStealerV2") then
    game.CoreGui.EggStealerV2:Destroy()
end

-- 2. Setup GUI Panel Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EggStealerV2"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 240, 0, 340)
MainFrame.Position = UDim2.new(0.15, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Panel bisa digeser
MainFrame.Parent = ScreenGui

-- Efek Pojok Membulat & Border Glow
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 60, 60)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Judul Panel
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "EGG STEALER V2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

-- Container untuk Tombol agar Rapi
local ButtonLayout = Instance.new("UIListLayout")
ButtonLayout.Parent = MainFrame
ButtonLayout.Padding = UDim.new(0, 8)
ButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Spacer di bawah judul agar tidak menempel
local Spacer = Instance.new("Frame")
Spacer.Size = UDim2.new(1, 0, 0, 45)
Spacer.BackgroundTransparency = 1
Spacer.LayoutOrder = 0
Spacer.Parent = MainFrame

-- 3. State/Variabel Fitur (_G global)
_G.InstanGrab = false
_G.InstanSteal = false
_G.AntiTrap = false
_G.SpeedBoost = false

-- 4. Fungsi Pembuat Tombol Custom
local function createToggle(text, order, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 210, 0, 40)
    Button.Text = text .. ": OFF"
    Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 15
    Button.LayoutOrder = order
    Button.Parent = MainFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button

    local state = false
    Button.MouseButton1Click:Connect(function()
        state = not state
        if state then
            Button.Text = text .. ": ON"
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        else
            Button.Text = text .. ": OFF"
            Button.TextColor3 = Color3.fromRGB(200, 200, 200)
            Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        end
        callback(state)
    end)
end

-- 5. Inisialisasi Tombol ke Panel
createToggle("Instan Grab Egg", 1, function(val) _G.InstanGrab = val end)
createToggle("Instan Steal Base", 2, function(val) _G.InstanSteal = val end)
createToggle("Anti Trap (Jebakan)", 3, function(val) _G.AntiTrap = val end)
createToggle("Speed Boost (Lari)", 4, function(val) _G.SpeedBoost = val end)

-- Tombol Khusus: Teleport Sekali Tekan (Instant Action)
local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Size = UDim2.new(0, 210, 0, 40)
TeleportBtn.Text = "⚡ Teleport Ke Telur"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
TeleportBtn.Font = Enum.Font.SourceSansBold
TeleportBtn.TextSize = 15
TeleportBtn.LayoutOrder = 5
TeleportBtn.Parent = MainFrame
local TeleportCorner = Instance.new("UICorner")
TeleportCorner.CornerRadius = UDim.new(0, 6)
TeleportCorner.Parent = TeleportBtn

-- 6. LOGIKA INTI SCRIPT (Running in Background Threads)

local Player = game.Players.LocalPlayer

-- Fungsi Teleport Ke Telur Terdekat di Map
TeleportBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name:lower():find("egg") or obj.Parent.Name:lower():find("egg")) then
                -- Memastikan itu bukan telur di markas sendiri atau dekorasi luar map
                if obj.Parent:FindFirstChildOfClass("ProximityPrompt") or obj:FindFirstChildOfClass("ProximityPrompt") then
                    root.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                    break -- Teleport ke satu telur pertama yang ditemukan
                end
            end
        end
    end)
end)

-- Loop Utama: Instan Grab & Instan Steal
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end

            -- FITUR 1: Instan Grab (Ambil Telur Sekitar Tanpa Animasi/Jarak)
            if _G.InstanGrab then
                for _, prompt in pairs(workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") and (prompt.Name:lower():find("egg") or prompt.Parent.Name:lower():find("egg")) then
                        -- Bypass jarak agar prompt bisa ditekan otomatis dari mana saja
                        prompt.HoldDuration = 0
                        prompt.MaxActivationDistance = 9999
                        fireproximityprompt(prompt)
                    end
                end
            end

            -- FITUR 2: Instan Steal (Mencuri dari Base Musuh / Taruh Instan)
            if _G.InstanSteal then
                for _, prompt in pairs(workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") and (prompt.Name:lower():find("steal") or prompt.Parent.Name:lower():find("base") or prompt.Name:lower():find("deliver")) then
                        prompt.HoldDuration = 0
                        prompt.MaxActivationDistance = 9999
                        fireproximityprompt(prompt)
                    end
                end
            end
        end)
    end
end)

-- Loop Fitur Pendukung: Anti Trap & Speed Boost
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local char = Player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            
            -- FITUR 3: Speed Boost
            if hum then
                if _G.SpeedBoost then
                    hum.WalkSpeed = 75
                else
                    if hum.WalkSpeed == 75 then hum.WalkSpeed = 16 end
                end
            end

            -- FITUR 4: Anti Trap (Menghapus/Menonaktifkan Jebakan di dekat Karakter)
            if _G.AntiTrap and char then
                for _, trap in pairs(workspace:GetDescendants()) do
                    if trap:IsA("BasePart") and (trap.Name:lower():find("trap") or trap.Name:lower():find("mine") or trap.Name:lower():find("spike")) then
                        if Player:DistanceFromCharacter(trap.Position) < 20 then
                            -- Membuat jebakan tidak bisa menyentuh karakter kamu
                            trap.CanTouch = false
                            trap.Transparency = 0.7 -- Transparan sebagai penanda jebakan mati
                        end
                    end
                end
            end
        end)
    end
end)
