-- =========================================================================
-- 🌶️ CHILLI HUB V5 X RONNEI (BYPASS EDITION) + INSTANT TRAVEL 🥚
-- Digabung utuh, tanpa key, dengan fungsi custom PivotTo
-- =========================================================================

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local TargetScriptUrl = "https://luauforge-antiraw.netlify.app/raw/b2GaCbtITNxIA6Qayyauq1a"

-- =========================================================================
-- 🔥 KUSTOMISASI LU: FUNGSI INSTANT TRAVEL
-- =========================================================================
local function InstantEggTravel(egg)
    if not egg or not egg:IsDescendantOf(workspace) then return false end
    local character = LocalPlayer.Character
    if not character then return false end
    
    local targetPart
    if egg:IsA("BasePart") then targetPart = egg
    elseif egg:IsA("Model") then targetPart = egg.PrimaryPart or egg:FindFirstChildWhichIsA("BasePart", true) end
    if not targetPart then return false end

    local targetPosition = targetPart.Position + Vector3.new(0, 4, 0)
    character:PivotTo(CFrame.new(targetPosition))
    return true
end

-- =========================================================================
-- UI SETUP (MIRIP ASLINYA)
-- =========================================================================
if CoreGui:FindFirstChild("ChilliV5_CustomUI") then CoreGui.ChilliV5_CustomUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChilliV5_CustomUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = CoreGui end)

local MainFrame = Instance.new("Frame")
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 440, 0, 300)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 18)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromRGB(38, 43, 54)

-- Header
local HeaderBar = Instance.new("Frame")
HeaderBar.Size = UDim2.new(1, -28, 0, 40)
HeaderBar.Position = UDim2.new(0, 14, 0, 12)
HeaderBar.BackgroundTransparency = 1
HeaderBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 20)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "CHILLI V5 x INSTANT TRAVEL"
TitleLabel.TextColor3 = Color3.fromRGB(241, 245, 249)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = HeaderBar

local SubTitleLabel = Instance.new("TextLabel")
SubTitleLabel.Size = UDim2.new(1, 0, 0, 14)
SubTitleLabel.Position = UDim2.new(0, 0, 0, 22)
SubTitleLabel.BackgroundTransparency = 1
SubTitleLabel.Text = "Bypass Key + Custom PivotTo"
SubTitleLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
SubTitleLabel.Font = Enum.Font.GothamMedium
SubTitleLabel.TextSize = 10
SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubTitleLabel.Parent = HeaderBar

-- Tombol Utama
local function CreateBtn(text, y, color, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -28, 0, 40)
    b.Position = UDim2.new(0, 14, 0, y)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.Parent = MainFrame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(callback)
end

-- 1. Tombol Instant Travel (Pake Fungsi Lu)
CreateBtn("⚡ INSTANT TRAVEL KE TELUR", 65, Color3.fromRGB(225, 29, 72), function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name:lower():find("telur") or obj.Name:lower():find("egg")) then
            InstantEggTravel(obj)
            break
        end
    end
end)

-- 2. Tombol Load Chilli Asli
CreateBtn("🌶️ LOAD CHILLI HUB V5 (ASLI)", 115, Color3.fromRGB(40, 40, 50), function()
    MainFrame:Destroy() -- Tutup UI ini dulu
    task.spawn(function()
        pcall(function()
            -- Nembak langsung ke script inti Chilli (Bypass Key)
            loadstring(game:HttpGet(TargetScriptUrl))()
        end)
    end)
end)

-- 3. Tombol Close
CreateBtn("❌ CLOSE", 165, Color3.fromRGB(200, 50, 50), function()
    ScreenGui:Destroy()
end)

-- Fitur Drag
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
