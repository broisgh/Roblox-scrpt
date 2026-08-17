-- ==========================================
--    MEDRIT HUB - HITBOX EXTENDER [PRO]
-- ==========================================
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("MedritHitboxGui") then 
    CoreGui.MedritHitboxGui:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MedritHitboxGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Position = UDim2.new(0.5, -120, 0.5, -160)
MainFrame.Size = UDim2.new(0, 240, 0, 360)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(45, 45, 45)
MainStroke.Thickness = 1.5

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", TopBar)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "Medrit Hub Hitbox Extender"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 9
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Position = UDim2.new(1, -26, 0.5, -9)
CloseBtn.Size = UDim2.new(0, 18, 0, 18)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CloseBtn.Text = "-"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 10
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

local Page = Instance.new("ScrollingFrame", MainFrame)
Page.Position = UDim2.new(0, 8, 0, 40)
Page.Size = UDim2.new(1, -16, 1, -48)
Page.BackgroundTransparency = 1
Page.CanvasSize = UDim2.new(0, 0, 0, 300)
Page.ScrollBarThickness = 2

local PList = Instance.new("UIListLayout", Page)
PList.Padding = UDim.new(0, 8)

local isOpen = true
CloseBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    Page.Visible = isOpen
    MainFrame.Size = isOpen and UDim2.new(0, 240, 0, 360) or UDim2.new(0, 240, 0, 30)
    CloseBtn.Text = isOpen and "-" or "+"
end)

local hitboxEnabled = false
local currentHitboxSize = 2  
local currentTransparency = 1 

-- Функция создания тумблера ON/OFF
local function CreateToggle(name, callback)
    local state = false
    local Btn = Instance.new("TextButton", Page)
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Btn.Text = ""
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
    
    local BStroke = Instance.new("UIStroke", Btn)
    BStroke.Color = Color3.fromRGB(35, 35, 35)
    BStroke.Thickness = 1

    local Label = Instance.new("TextLabel", Btn)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 9
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local StatusBadge = Instance.new("Frame", Btn)
    StatusBadge.Position = UDim2.new(1, -42, 0.5, -8)
    StatusBadge.Size = UDim2.new(0, 36, 0, 16)
    StatusBadge.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", StatusBadge).CornerRadius = UDim.new(0, 4)

    local StatusText = Instance.new("TextLabel", StatusBadge)
    StatusText.Size = UDim2.new(1, 0, 1, 0)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "OFF"
    StatusText.TextColor3 = Color3.fromRGB(100, 100, 100)
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 8

    Btn.MouseButton1Click:Connect(function()
        state = not state
        StatusBadge.BackgroundColor3 = state and Color3.fromRGB(240, 240, 240) or Color3.fromRGB(30, 30, 30)
        StatusText.Text = state and "ON" or "OFF"
        StatusText.TextColor3 = state and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(100, 100, 100)
        callback(state)
    end)
end

local function CreateSlider(name, min, max, default, callback)
    local Frame = Instance.new("Frame", Page)
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Color3.fromRGB(35, 35, 35)
    Stroke.Thickness = 1

    local Label = Instance.new("TextLabel", Frame)
    Label.Position = UDim2.new(0, 8, 0, 4)
    Label.Size = UDim2.new(1, -16, 0, 18)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 9
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local SliderBar = Instance.new("TextButton", Frame)
    SliderBar.Position = UDim2.new(0, 8, 0, 28)
    SliderBar.Size = UDim2.new(1, -16, 0, 12)
    SliderBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SliderBar.Text = ""
    Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(0, 4)

    local Fill = Instance.new("Frame", SliderBar)
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(0, 4)

    local dragging = false
    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
            Fill.Size = UDim2.new(pos, 0, 1, 0)
            local val = math.floor(min + ((max - min) * pos))
            Label.Text = name .. ": " .. val
            callback(val)
        end
    end)
end

-- Кнопка включения/выключения мода
CreateToggle("Enable Hitboxes", function(val)
    hitboxEnabled = val
end)

CreateSlider("Hitbox Size", 0, 40, 2, function(val)
    currentHitboxSize = val
end)

CreateSlider("Transparency", 0, 5, 1, function(val)
    currentTransparency = val
end)

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if hitboxEnabled then
                        hrp.Size = Vector3.new(currentHitboxSize, currentHitboxSize, currentHitboxSize)
                        hrp.Transparency = math.clamp(currentTransparency / 5, 0, 1)
                        hrp.Color = Color3.fromRGB(255, 0, 0)
                        hrp.Material = Enum.Material.Neon
                        hrp.CanCollide = false
                    else
                        -- Возвращаем дефолтные параметры, если выключено
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 1
                        hrp.Color = Color3.fromRGB(163, 162, 165)
                        hrp.Material = Enum.Material.SmoothPlastic
                    end
                end
            end
        end
    end
end)
