--[[
    Project: Medrit Hub Elite (Secure Edition)
    Features: Key System, Rainbow Glow, ESP, Auto TP, Noclip, Fast Pickup, Fullbright, Sky Platform, Infinite Jump, Anti-Slow.
]]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local CORRECT_KEY = "MedritCool920"

if CoreGui:FindFirstChild("MedritHubElite") then
    CoreGui.MedritHubElite:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MedritHubElite"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- ==================== KEY SYSTEM GUI ====================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = ScreenGui
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
KeyFrame.Size = UDim2.new(0, 320, 0, 220)
KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(220, 30, 30)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyFrame

local KeyTopBar = Instance.new("Frame")
KeyTopBar.Parent = KeyFrame
KeyTopBar.Size = UDim2.new(1, 0, 0, 35)
KeyTopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
KeyTopBar.BorderSizePixel = 0

local KeyTopCorner = Instance.new("UICorner")
KeyTopCorner.CornerRadius = UDim.new(0, 12)
KeyTopCorner.Parent = KeyTopBar

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyTopBar
KeyTitle.Position = UDim2.new(0, 15, 0, 0)
KeyTitle.Size = UDim2.new(1, -30, 1, 0)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "MEDRIT HUB — KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 13
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeyDesc = Instance.new("TextLabel")
KeyDesc.Parent = KeyFrame
KeyDesc.Position = UDim2.new(0, 20, 0, 48)
KeyDesc.Size = UDim2.new(1, -40, 0, 30)
KeyDesc.BackgroundTransparency = 1
KeyDesc.Text = "Введите ключ доступа, чтобы разблокировать хаб:"
KeyDesc.TextColor3 = Color3.fromRGB(170, 170, 170)
KeyDesc.TextSize = 11
KeyDesc.Font = Enum.Font.GothamMedium
KeyDesc.TextXAlignment = Enum.TextXAlignment.Left

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = KeyFrame
KeyBox.Position = UDim2.new(0, 20, 0, 88)
KeyBox.Size = UDim2.new(1, -40, 0, 40)
KeyBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
KeyBox.PlaceholderText = "Введи ключ сюда..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
KeyBox.TextSize = 13
KeyBox.Font = Enum.Font.GothamBold
KeyBox.ClearTextOnFocus = false

local KB際のCorner = Instance.new("UICorner")
KB際のCorner.CornerRadius = UDim.new(0, 8)
KB際のCorner.Parent = KeyBox

local KBStroke = Instance.new("UIStroke")
KBStroke.Color = Color3.fromRGB(40, 40, 50)
KBStroke.Thickness = 1.5
KBStroke.Parent = KeyBox

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.Position = UDim2.new(0, 20, 0, 145)
SubmitBtn.Size = UDim2.new(1, -40, 0, 42)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
SubmitBtn.Text = "ПРОВЕРИТЬ КЛЮЧ"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 13
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.AutoButtonColor = false

local SubCorner = Instance.new("UICorner")
SubCorner.CornerRadius = UDim.new(0, 8)
SubCorner.Parent = SubmitBtn

-- Драг окна ключа
local kDragging, kDragInput, kDragStart, kStartPos
KeyTopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        kDragging = true
        kDragStart = input.Position
        kStartPos = KeyFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then kDragging = false end
        end)
    end
end)

KeyTopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        kDragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == kDragInput and kDragging then
        local delta = input.Position - kDragStart
        KeyFrame.Position = UDim2.new(kStartPos.X.Scale, kStartPos.X.Offset + delta.X, kStartPos.Y.Scale, kStartPos.Y.Offset + delta.Y)
    end
end)

-- Логика проверки ключа
local function StartMainHub()
    -- Плавное скрытие окна ключа
    TweenService:Create(KeyFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 0), Position = KeyFrame.Position + UDim2.new(0, 160, 0, 110)}):Play()
    task.wait(0.4)
    KeyFrame:Destroy()

    -- Главная кнопка открытия/закрытия меню
    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Name = "OpenButton"
    OpenBtn.Parent = ScreenGui
    OpenBtn.Position = UDim2.new(0.5, -75, 0, 12)
    OpenBtn.Size = UDim2.new(0, 150, 0, 32)
    OpenBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    OpenBtn.Text = "MEDRIT HUB"
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

    -- Окно интерфейса
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -220)
    MainFrame.Size = UDim2.new(0, 300, 0, 440)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.ClipsDescendants = true

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(220, 30, 30)
    MainStroke.Thickness = 2
    MainStroke.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    TopBar.Parent = MainFrame
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    TopBar.BorderSizePixel = 0

    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 12)
    TopCorner.Parent = TopBar

    local Title = Instance.new("TextLabel")
    Title.Parent = TopBar
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(1, -50, 1, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "MEDRIT HUB ULTIMATE"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopBar
    CloseBtn.Position = UDim2.new(1, -35, 0.5, -12)
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 12
    CloseBtn.Font = Enum.Font.GothamBold

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseBtn

    local Container = Instance.new("ScrollingFrame")
    Container.Parent = MainFrame
    Container.Position = UDim2.new(0, 10, 0, 50)
    Container.Size = UDim2.new(1, -20, 1, -60)
    Container.BackgroundTransparency = 1
    Container.BorderSizePixel = 0
    Container.CanvasSize = UDim2.new(0, 0, 0, 1150)
    Container.ScrollBarThickness = 3
    Container.ScrollBarImageColor3 = Color3.fromRGB(200, 30, 30)

    local UIList = Instance.new("UIListLayout")
    UIList.Parent = Container
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.Padding = UDim.new(0, 8)

    -- Драг главного меню
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

    local function CreateSection(titleText)
        local SecLabel = Instance.new("TextLabel")
        SecLabel.Parent = Container
        SecLabel.Size = UDim2.new(1, 0, 0, 25)
        SecLabel.BackgroundTransparency = 1
        SecLabel.Text = "  " .. titleText
        SecLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
        SecLabel.TextSize = 12
        SecLabel.Font = Enum.Font.GothamBold
        SecLabel.TextXAlignment = Enum.TextXAlignment.Left
    end

    local function CreateToggle(name, callback)
        local state = false
        local ToggleBtn = Instance.new("TextButton")
        ToggleBtn.Parent = Container
        ToggleBtn.Size = UDim2.new(1, 0, 0, 38)
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
        Label.Position = UDim2.new(0, 12, 0, 0)
        Label.Size = UDim2.new(1, -60, 1, 0)
        Label.BackgroundTransparency = 1
        Label.Text = name
        Label.TextColor3 = Color3.fromRGB(200, 200, 200)
        Label.TextSize = 12
        Label.Font = Enum.Font.GothamMedium
        Label.TextXAlignment = Enum.TextXAlignment.Left

        local StatusBadge = Instance.new("Frame")
        StatusBadge.Parent = ToggleBtn
        StatusBadge.Position = UDim2.new(1, -50, 0.5, -10)
        StatusBadge.Size = UDim2.new(0, 38, 0, 20)
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
        StatusText.TextSize = 10
        StatusText.Font = Enum.Font.GothamBold

        ToggleBtn.MouseButton1Click:Connect(function()
            state = not state
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

    local function CreateTextBoxInput(name, defaultVal, callback)
        local FrameBox = Instance.new("Frame")
        FrameBox.Parent = Container
        FrameBox.Size = UDim2.new(1, 0, 0, 38)
        FrameBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)

        local FCorner = Instance.new("UICorner")
        FCorner.CornerRadius = UDim.new(0, 8)
        FCorner.Parent = FrameBox

        local FStroke = Instance.new("UIStroke")
        FStroke.Color = Color3.fromRGB(40, 40, 50)
        FStroke.Thickness = 1
        FStroke.Parent = FrameBox

        local Label = Instance.new("TextLabel")
        Label.Parent = FrameBox
        Label.Position = UDim2.new(0, 12, 0, 0)
        Label.Size = UDim2.new(1, -80, 1, 0)
        Label.BackgroundTransparency = 1
        Label.Text = name
        Label.TextColor3 = Color3.fromRGB(200, 200, 200)
        Label.TextSize = 12
        Label.Font = Enum.Font.GothamMedium
        Label.TextXAlignment = Enum.TextXAlignment.Left

        local TextBox = Instance.new("TextBox")
        TextBox.Parent = FrameBox
        TextBox.Position = UDim2.new(1, -70, 0.5, -12)
        TextBox.Size = UDim2.new(0, 60, 0, 24)
        TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
        TextBox.Text = tostring(defaultVal)
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 12
        TextBox.Font = Enum.Font.GothamBold
        TextBox.ClearTextOnFocus = false

        local TBCorner = Instance.new("UICorner")
        TBCorner.CornerRadius = UDim.new(0, 6)
        TBCorner.Parent = TextBox

        TextBox.FocusLost:Connect(function()
            local num = tonumber(TextBox.Text)
            if num then callback(num) else TextBox.Text = tostring(defaultVal) end
        end)
    end

    -- ==================== RAINBOW GLOW LOGIC ====================
    local rainbowGlow = false

    RunService.RenderStepped:Connect(function()
        if rainbowGlow then
            local hue = (tick() % 5) / 5
            local rainbowColor = Color3.fromHSV(hue, 1, 1)
            
            MainStroke.Color = rainbowColor
            OpenStroke.Color = rainbowColor
            OpenBtn.TextColor3 = rainbowColor
        end
    end)

    -- ==================== ESP AND TRACKING ====================
    CreateSection("ESP AND TRACKING")

    local ayuwokiESP = false
    local monsterData = {}
    local autoTP = false
    local tpCooldown = false

    CreateToggle("ESP Ayuwoki", function(val)
        ayuwokiESP = val
        if not ayuwokiESP then
            for _, data in pairs(monsterData) do
                if data.Highlight then data.Highlight:Destroy() end
                if data.Billboard then data.Billboard:Destroy() end
            end
            monsterData = {}
        end
    end)

    CreateToggle("Auto TP From Ayuwoki (200 Studs)", function(val) autoTP = val end)

    local playersESP = false
    local playersData = {}

    CreateToggle("ESP Player", function(val)
        playersESP = val
        if not playersESP then
            for _, data in pairs(playersData) do
                if data.Highlight then data.Highlight:Destroy() end
                if data.Billboard then data.Billboard:Destroy() end
            end
            playersData = {}
        end
    end)

    RunService.RenderStepped:Connect(function()
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
        local myHrp = LocalPlayer.Character.HumanoidRootPart
        local myPos = myHrp.Position

        for _, obj in pairs(Workspace:GetChildren()) do
            if obj:FindFirstChildOfClass("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                local monsterPart = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildOfClass("BasePart")
                if monsterPart then
                    local dist = math.floor((myPos - monsterPart.Position).Magnitude)

                    if autoTP and dist <= 200 and not tpCooldown then
                        tpCooldown = true
                        local cam = Workspace.CurrentCamera
                        local lookVec = cam.CFrame.LookVector
                        local flatVector = Vector3.new(lookVec.X, 0, lookVec.Z).Unit
                        
                        local newPos = myHrp.Position - (flatVector * 180)
                        myHrp.CFrame = CFrame.new(newPos + Vector3.new(0, 5, 0))
                        myHrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        
                        task.delay(1.5, function() tpCooldown = false end)
                    end

                    if ayuwokiESP then
                        if not monsterData[obj] then
                            local hl = Instance.new("Highlight")
                            hl.Parent = ScreenGui
                            hl.Adornee = obj
                            hl.FillTransparency = 0.4
                            
                            local bb = Instance.new("BillboardGui")
                            bb.Parent = ScreenGui
                            bb.Adornee = monsterPart
                            bb.Size = UDim2.new(0, 180, 0, 40)
                            bb.AlwaysOnTop = true

                            local lbl = Instance.new("TextLabel")
                            lbl.Parent = bb
                            lbl.Size = UDim2.new(1, 0, 1, 0)
                            lbl.BackgroundTransparency = 1
                            lbl.TextSize = 13
                            lbl.Font = Enum.Font.GothamBold

                            monsterData[obj] = {Highlight = hl, Billboard = bb, Label = lbl, LastDist = dist}
                        end

                        local data = monsterData[obj]
                        local isDangerZone = (dist <= 60)

                        if isDangerZone then
                            data.Highlight.FillColor = Color3.fromRGB(255, 0, 60)
                            data.Highlight.OutlineColor = Color3.fromRGB(255, 230, 0)
                            data.Label.Text = "DANGER! " .. dist .. "m"
                            data.Label.TextColor3 = Color3.fromRGB(255, 40, 40)
                        else
                            data.Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                            data.Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            data.Label.Text = "Ayuwoki " .. dist .. "m"
                            data.Label.TextColor3 = Color3.fromRGB(255, 170, 0)
                        end
                        data.LastDist = dist
                    end
                end
            end
        end

        if playersESP then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pChar = p.Character
                    local pPart = pChar.HumanoidRootPart
                    local dist = math.floor((myPos - pPart.Position).Magnitude)

                    if not playersData[p] then
                        local hl = Instance.new("Highlight")
                        hl.Parent = ScreenGui
                        hl.Adorne
