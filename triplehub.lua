-- =========================================================================
-- 🌶️ CHILLI V5 STYLE LOADER (TANPA KEY)
-- UI Persis Chilli V5, Tapi Bisa Load Chilli, Pulse, & Sena
-- =========================================================================

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local ChilliAvatarId = "rbxassetid://92622270383869"

-- LINK SCRIPT (SEMUA KEYLESS)
local ChilliURL = "https://luauforge-antiraw.netlify.app/raw/b2GaCbtITNxIA6Qayyauq1a"
local PulseURL = "https://api.luarmor.net/files/v4/loaders/9eaf6021130040db2646aa9b094427ef.lua"
local SenaURL = "https://raw.githubusercontent.com/sabscrip-arch/srver/refs/heads/main/Stealanegg"

if CoreGui:FindFirstChild("ChilliV5_GetKeyUI") then CoreGui.ChilliV5_GetKeyUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChilliV5_GetKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 440, 0, 420)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 30
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 18)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 1
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Color = Color3.fromRGB(38, 43, 54)

-- HEADER
local HeaderBar = Instance.new("Frame")
HeaderBar.Size = UDim2.new(1, -28, 0, 40)
HeaderBar.Position = UDim2.new(0, 14, 0, 12)
HeaderBar.BackgroundTransparency = 1
HeaderBar.ZIndex = 31
HeaderBar.Parent = MainFrame

local MiniLogo = Instance.new("Frame")
MiniLogo.Size = UDim2.new(0, 28, 0, 28)
MiniLogo.Position = UDim2.new(0, 0, 0.5, -14)
MiniLogo.BackgroundColor3 = Color3.fromRGB(24, 27, 36)
MiniLogo.ClipsDescendants = true
MiniLogo.ZIndex = 32
MiniLogo.Parent = HeaderBar
Instance.new("UICorner", MiniLogo).CornerRadius = UDim.new(1, 0)
local MiniLogoStroke = Instance.new("UIStroke", MiniLogo)
MiniLogoStroke.Color = Color3.fromRGB(225, 29, 72)
MiniLogoStroke.Thickness = 1

local MiniLogoImg = Instance.new("ImageLabel")
MiniLogoImg.Size = UDim2.new(1, 0, 1, 0)
MiniLogoImg.BackgroundTransparency = 1
MiniLogoImg.Image = ChilliAvatarId
MiniLogoImg.ScaleType = Enum.ScaleType.Fit
MiniLogoImg.ZIndex = 33
MiniLogoImg.Parent = MiniLogo

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -100, 0, 18)
TitleLabel.Position = UDim2.new(0, 36, 0, 2)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "CHILLI HUB V5 (KEYLESS MODE)"
TitleLabel.TextColor3 = Color3.fromRGB(241, 245, 249)
TitleLabel.TextSize = 11.5
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 32
TitleLabel.Parent = HeaderBar

local SubTitleLabel = Instance.new("TextLabel")
SubTitleLabel.Size = UDim2.new(1, -100, 0, 14)
SubTitleLabel.Position = UDim2.new(0, 36, 0, 20)
SubTitleLabel.BackgroundTransparency = 1
SubTitleLabel.Text = "Select Script to Inject (No Key Required)"
SubTitleLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
SubTitleLabel.TextSize = 9.5
SubTitleLabel.Font = Enum.Font.GothamMedium
SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubTitleLabel.ZIndex = 32
SubTitleLabel.Parent = HeaderBar -- INI BAGIAN YANG KEPOTONG TADI

-- BANNER & CENTER TITLE
local Banner = Instance.new("Frame")
Banner.Size = UDim2.new(1, -28, 0, 70)
Banner.Position = UDim2.new(0, 14, 0, 65)
Banner.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
Banner.BorderSizePixel = 0
Banner.ZIndex = 31
Banner.Parent = MainFrame
Instance.new("UICorner", Banner).CornerRadius = UDim.new(0, 10)
local BannerStroke = Instance.new("UIStroke", Banner)
BannerStroke.Thickness = 1
BannerStroke.Color = Color3.fromRGB(225, 29, 72)
BannerStroke.Transparency = 0.5

local CenterTitle = Instance.new("TextLabel")
CenterTitle.Size = UDim2.new(1, 0, 0, 25)
CenterTitle.Position = UDim2.new(0, 0, 0.5, -18)
CenterTitle.BackgroundTransparency = 1
CenterTitle.Text = "CHILLI HUB V5 × RAEL"
CenterTitle.TextColor3 = Color3.fromRGB(225, 29, 72)
CenterTitle.Font = Enum.Font.GothamBlack
CenterTitle.TextSize = 20
CenterTitle.ZIndex = 32
CenterTitle.Parent = Banner

local CenterSub = Instance.new("TextLabel")
CenterSub.Size = UDim2.new(1, 0, 0, 15)
CenterSub.Position = UDim2.new(0, 0, 0.5, 7)
CenterSub.BackgroundTransparency = 1
CenterSub.Text = "Steal An Egg 🥚 Edition"
CenterSub.TextColor3 = Color3.fromRGB(148, 163, 184)
CenterSub.Font = Enum.Font.GothamMedium
CenterSub.TextSize = 12
CenterSub.ZIndex = 32
CenterSub.Parent = Banner

-- FUNGSI LOAD SCRIPT
local function LoadScript(url, name)
    -- Animasi Loading
    local LoadingNotif = Instance.new("TextLabel")
    LoadingNotif.Size = UDim2.new(1, -28, 0, 40)
    LoadingNotif.Position = UDim2.new(0, 14, 0, 150)
    LoadingNotif.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
    LoadingNotif.Text = "⏳ Loading " .. name .. "..."
    LoadingNotif.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadingNotif.Font = Enum.Font.GothamBold
    LoadingNotif.TextSize = 14
    LoadingNotif.ZIndex = 35
    LoadingNotif.Parent = MainFrame
    Instance.new("UICorner", LoadingNotif).CornerRadius = UDim.new(0, 8)

    task.spawn(function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if ok then
            task.wait(1)
            ScreenGui:Destroy() -- Hapus UI kalau script sukses
        else
            LoadingNotif.Text = "❌ Gagal Load! Coba lagi."
            LoadingNotif.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)
end

-- TOMBOL 1: CHILLI
local BtnChilli = Instance.new("TextButton")
BtnChilli.Size = UDim2.new(1, -28, 0, 40)
BtnChilli.Position = UDim2.new(0, 14, 0, 150)
BtnChilli.BackgroundColor3 = Color3.fromRGB(225, 29, 72)
BtnChilli.Text = "🌶️ INJECT CHILLI HUB"
BtnChilli.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnChilli.Font = Enum.Font.GothamBold
BtnChilli.TextSize = 13
BtnChilli.ZIndex = 32
BtnChilli.Parent = MainFrame
Instance.new("UICorner", BtnChilli).CornerRadius = UDim.new(0, 8)
BtnChilli.MouseButton1Click:Connect(function() LoadScript(ChilliURL, "Chilli Hub") end)

-- TOMBOL 2: SENA
local BtnSena = Instance.new("TextButton")
BtnSena.Size = UDim2.new(1, -28, 0, 40)
BtnSena.Position = UDim2.new(0, 14, 0, 200)
BtnSena.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
BtnSena.Text = "🍃 INJECT SENA HUB"
BtnSena.TextColor3 = Color3.fromRGB(0, 0, 0)
BtnSena.Font = Enum.Font.GothamBold
BtnSena.TextSize = 13
BtnSena.ZIndex = 32
BtnSena.Parent = MainFrame
Instance.new("UICorner", BtnSena).CornerRadius = UDim.new(0, 8)
BtnSena.MouseButton1Click:Connect(function() LoadScript(SenaURL, "Sena Hub") end)

-- TOMBOL 3: PULSE
local BtnPulse = Instance.new("TextButton")
BtnPulse.Size = UDim2.new(1, -28, 0, 40)
BtnPulse.Position = UDim2.new(0, 14, 0, 250)
BtnPulse.BackgroundColor3 = Color3.fromRGB(226, 168, 62)
BtnPulse.Text = "💠 INJECT PULSE HUB"
BtnPulse.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnPulse.Font = Enum.Font.GothamBold
BtnPulse.TextSize = 13
BtnPulse.ZIndex = 32
BtnPulse.Parent = MainFrame
Instance.new("UICorner", BtnPulse).CornerRadius = UDim.new(0, 8)
BtnPulse.MouseButton1Click:Connect(function() LoadScript(PulseURL, "Pulse Hub") end)

-- NOTICE BAWAH
local Notice = Instance.new("TextLabel")
Notice.Size = UDim2.new(1, -28, 0, 40)
Notice.Position = UDim2.new(0, 14, 1, -60)
Notice.BackgroundTransparency = 1
Notice.Text = "📌 Pilih salah satu script di atas untuk dimuat.\nSemua script sudah Keyless (Tanpa Key)."
Notice.TextColor3 = Color3.fromRGB(148, 163, 184)
Notice.Font = Enum.Font.GothamMedium
Notice.TextSize = 11
Notice.TextWrapped = true
Notice.ZIndex = 32
Notice.Parent = MainFrame

-- TOMBOL CLOSE (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -38, 0, 12)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 34, 45)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(241, 245, 249)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.ZIndex = 34
CloseBtn.Parent = HeaderBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- FITUR DRAG UI
local dragging, dragInput, dragStart, startPos
HeaderBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
HeaderBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
