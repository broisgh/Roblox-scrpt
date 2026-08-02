-- ========================================================
-- MEDRIT HUB (AYUWOKI EDITION) v2.0 — ELITE DESIGN
-- ========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Чистим старый UI
if CoreGui:FindFirstChild("MedritHubElite") then
    CoreGui.MedritHubElite:Destroy()
end

-- --------------------------------------------------------
-- 1. ЭЛИТНЫЙ ИНТЕРФЕЙС (UI SETUP)
-- --------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MedritHubElite"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Кнопка открытия (Неоновая плашка сверху)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenButton"
OpenBtn.Parent = ScreenGui
OpenBtn.Position = UDim2.new(0.5, -75, 0, 12)
OpenBtn.Size = UDim2.new(0, 150, 0, 32)
OpenBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
OpenBtn.Text = "⚡ MEDRIT HUB"
OpenBtn.TextColor3 = Color3.fromRGB(255, 60, 60)
OpenBtn.TextSize = 13
OpenBtn.Font = Enum.Font.GothamBold

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 8)
OpenCorner.Parent = OpenBtn

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Color3.fromRGB(220, 30, 30)
OpenStroke.Thickness = 1.5
OpenStroke.Parent = OpenBtn

-- Главное окно
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.5, -135, 0.5, -180)
MainFrame.Size = UDim2.new(0, 270, 0, 360)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(220, 30, 30)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Шапка окна (Drag Area)
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

-- Чтобы углы сверху не были квадратными
local FixTop = Instance.new("Frame")
FixTop.Parent = TopBar
FixTop.Position = UDim2.new(0, 0, 0.5, 0)
FixTop.Size = UDim2.new(1, 0, 0.5, 0)
FixTop.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
FixTop.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -50, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "MEDRIT HUB v2.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Крутая кнопка закрытия [X]
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Position = UDim2.new(1, -35, 0.5, -12)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Контейнер для тугглов
local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.Position = UDim2.new(0, 10, 0, 50)
Container.Size = UDim2.new(1, -20, 1, -60)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.CanvasSize = UDim2.new(0, 0, 0, 310)
Container.ScrollBarThickness = 3
Container.ScrollBarImageColor3 = Color3.fromRGB(200, 30, 30)

local UIList = Instance.new("UIListLayout")
UIList.Parent = Container
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)

-- --------------------------------------------------------
-- 2. МЕХАНИКА ПЕРЕТАСКИВАНИЯ (DRAGGABLE)
-- --------------------------------------------------------
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- --------------------------------------------------------
-- 3. КРАСИВЫЕ КНОПКИ-ПЕРЕКЛЮЧАТЕЛИ (TOGGLES)
-- --------------------------------------------------------
local function CreateToggle(name, callback)
    local state = false
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = Container
    ToggleBtn.Size = UDim2.new(1, 0, 0, 42)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    ToggleBtn.AutoButtonColor = false
    ToggleBtn.Text = ""

    local TCorner = Instance.new("UICorner")
    TCorner.CornerRadius = UDim.new(0, 8)
    TCorner.Parent = ToggleBtn

    local TStroke = Instance.new("UIStroke")
    TStroke.Color = Color3.fromRGB(40, 40, 50)
    TStroke.Thickness = 1
    TStroke.Parent = ToggleBtn

    local Label = Instance.new("TextLabel")
    Label.Parent = ToggleBtn
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left

    -- Статус бэдж (ON / OFF)
    local StatusBadge = Instance.new("Frame")
    StatusBadge.Parent = ToggleBtn
    StatusBadge.Position = UDim2.new(1, -55, 0.5, -12)
    StatusBadge.Size = UDim2.new(0, 42, 0, 24)
    StatusBadge.BackgroundColor3 = Color3.fromRGB(30, 30, 38)

    local SCorner = Instance.new("UICorner")
    SCorner.CornerRadius = UDim.new(0, 6)
    SCorner.Parent = StatusBadge

    local StatusText = Instance.new("TextLabel")
    StatusText.Parent = StatusBadge
    StatusText.Size = UDim2.new(1, 0, 1, 0)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "OFF"
    StatusText.TextColor3 = Color3.fromRGB(120, 120, 120)
    StatusText.TextSize = 11
    StatusText.Font = Enum.Font.GothamBold

    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        
        -- Плавная анимация клика и смены цвета
        local targetColor = state and Color3.fromRGB(220, 30, 30) or Color3.fromRGB(30, 30, 38)
        local textColor = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)
        local strokeColor = state and Color3.fromRGB(255, 60, 60) or Color3.fromRGB(40, 40, 50)

        TweenService:Create(StatusBadge, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(TStroke, TweenInfo.new(0.2), {Color = strokeColor}):Play()
        
        StatusText.Text = state and "ON" or "OFF"
        StatusText.TextColor3 = textColor
        Label.TextColor3 = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)

        callback(state)
    end)
end

-- --------------------------------------------------------
-- 4. ФУНКЦИОНАЛ ЧИТОВ
-- --------------------------------------------------------

-- [1] ESP Ayuwoki
local ayuwokiESP = false
local monsterHighlights = {}

CreateToggle("ESP Ayuwoki", function(val)
    ayuwokiESP = val
    if not ayuwokiESP then
        for _, hl in pairs(monsterHighlights) do if hl then hl:Destroy() end end
        monsterHighlights = {}
    end
end)

RunService.RenderStepped:Connect(function()
    if ayuwokiESP then
        for _, obj in pairs(Workspace:GetChildren()) do
            if obj:FindFirstChildOfClass("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                if not monsterHighlights[obj] then
                    local hl = Instance.new("Highlight")
                    hl.Parent = obj
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.FillTransparency = 0.4
                    monsterHighlights[obj] = hl
                end
            end
        end
    end
end)

-- [2] ESP Items (Чистый фильтр без дверей и автоматов)
local itemsESP = false
local itemFolder = Instance.new("Folder", ScreenGui)
itemFolder.Name = "ItemESPFolder"

local blacklist = {"door", "button", "buttons", "handle", "main", "prompt", "vending", "machine", "wall", "part"}
local function isBlacklisted(name)
    local n = name:lower()
    for _, b in pairs(blacklist) do
        if n == b then return true end
    end
    return false
end

CreateToggle("ESP Items", function(val)
    itemsESP = val
    if not itemsESP then itemFolder:ClearAllChildren() end
end)

task.spawn(function()
    while task.wait(0.5) do
        if itemsESP then
            itemFolder:ClearAllChildren()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("ClickDetector") or obj:IsA("ProximityPrompt") or obj:IsA("Tool") then
                    local inPlayer = false
                    for _, p in pairs(Players:GetPlayers()) do
                        if p.Character and obj:IsDescendantOf(p.Character) then inPlayer = true break end
                    end

                    if not inPlayer then
                        local parent = obj.Parent
                        local targetPart = parent:IsA("BasePart") and parent or parent:FindFirstChildOfClass("BasePart")
                        
                        if targetPart then
                            local itemName = parent.Name
                            if isBlacklisted(itemName) and parent.Parent then itemName = parent.Parent.Name end

                            if not isBlacklisted(itemName) and not itemName:lower().find(itemName, "door") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Parent = itemFolder
                                billboard.Adornee = targetPart
                                billboard.Size = UDim2.new(0, 100, 0, 30)
                                billboard.AlwaysOnTop = true

                                local label = Instance.new("TextLabel")
                                label.Parent = billboard
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.BackgroundTransparency = 1
                                label.Text = "[ " .. itemName .. " ]"
                                label.TextColor3 = Color3.fromRGB(0, 255, 140)
                                label.TextSize = 12
                                label.Font = Enum.Font.GothamBold
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- [3] Fullbright / No Fog
local fullbright = false
local defBright = Lighting.Brightness
local defClock = Lighting.ClockTime
local defFog = Lighting.FogEnd
local defShadows = Lighting.GlobalShadows

CreateToggle("Fullbright / No Fog", function(val)
    fullbright = val
    if not fullbright then
        Lighting.Brightness = defBright
        Lighting.ClockTime = defClock
        Lighting.FogEnd = defFog
        Lighting.GlobalShadows = defShadows
    end
end)

RunService.RenderStepped:Connect(function()
    if fullbright then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("Atmosphere") or v:IsA("PostEffect") or v:IsA("BlurEffect") then v.Enabled = false end
        end
    end
end)

-- [4] Infinite Stamina
CreateToggle("Infinite Stamina", function(val)
    if val then
        task.spawn(function()
            pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Ayuwoki-Field-Inf-stamina-72918"))() end)
        end)
    end
end)

-- [5] Speed Boost
CreateToggle("Speed Boost", function(val)
    if val then
        task.spawn(function()
            pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Ayuwoki-Field-Inf-speed-boost-138295"))() end)
        end)
    end
end)

print("Medrit Hub v2.0 — Elite Design Loaded!")
