-- ==========================================
--    MEDRIT MEGA HUB [ULTIMATE EDITION V12]
-- ==========================================
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

if CoreGui:FindFirstChild("MedritKeySystem") then CoreGui.MedritKeySystem:Destroy() end
if CoreGui:FindFirstChild("MedritUltraHub") then CoreGui.MedritUltraHub:Destroy() end

local CorrectKey = "MedritCool920"

-- ================= KEY SYSTEM =================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "MedritKeySystem"
KeyGui.ResetOnSpawn = false
KeyGui.Parent = CoreGui

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Position = UDim2.new(0.5, -120, 0.5, -100)
KeyFrame.Size = UDim2.new(0, 240, 0, 200)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.Active = true
KeyFrame.Draggable = true
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 8)

local KStroke = Instance.new("UIStroke", KeyFrame)
KStroke.Color = Color3.fromRGB(50, 50, 50)
KStroke.Thickness = 1.5

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "MEDRIT LOGIN [V12]"
KeyTitle.TextColor3 = Color3.fromRGB(240, 240, 240)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 11

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Position = UDim2.new(0.1, 0, 0, 40)
KeyBox.Size = UDim2.new(0.8, 0, 0, 32)
KeyBox.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
KeyBox.PlaceholderText = "Enter key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(240, 240, 240)
KeyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
KeyBox.Font = Enum.Font.GothamMedium
KeyBox.TextSize = 10
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 6)
local BoxStroke = Instance.new("UIStroke", KeyBox)
BoxStroke.Color = Color3.fromRGB(40, 40, 40)
BoxStroke.Thickness = 1

local GetKeyBtn = Instance.new("TextButton", KeyFrame)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0, 80)
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 28)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 10
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)
local GetStroke = Instance.new("UIStroke", GetKeyBtn)
GetStroke.Color = Color3.fromRGB(40, 40, 40)
GetStroke.Thickness = 1

GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://link-target.net/8028026/sqCo7LR6bbYq")
        GetKeyBtn.Text = "COPIED!"
        task.wait(1.5)
        GetKeyBtn.Text = "GET KEY"
    end
end)

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.Position = UDim2.new(0.1, 0, 0, 116)
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 32)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
SubmitBtn.Text = "SUBMIT"
SubmitBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 10
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 6)

local ErrorLbl = Instance.new("TextLabel", KeyFrame)
ErrorLbl.Position = UDim2.new(0, 0, 0, 158)
ErrorLbl.Size = UDim2.new(1, 0, 0, 30)
ErrorLbl.BackgroundTransparency = 1
ErrorLbl.Text = ""
ErrorLbl.TextColor3 = Color3.fromRGB(255, 80, 80)
ErrorLbl.Font = Enum.Font.GothamBold
ErrorLbl.TextSize = 9

SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == CorrectKey then
        LaunchMainHub()
    else
        ErrorLbl.Text = "INVALID KEY!"
        task.wait(1.5)
        ErrorLbl.Text = ""
    end
end)

-- ================= MAIN HUB =================
function LaunchMainHub()
    if KeyGui then KeyGui:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MedritUltraHub"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local AlertLbl = Instance.new("TextLabel", ScreenGui)
    AlertLbl.Position = UDim2.new(0.5, -200, 0.15, 0)
    AlertLbl.Size = UDim2.new(0, 400, 0, 40)
    AlertLbl.BackgroundTransparency = 1
    AlertLbl.Text = ""
    AlertLbl.TextColor3 = Color3.fromRGB(240, 50, 50)
    AlertLbl.Font = Enum.Font.GothamBold
    AlertLbl.TextSize = 18
    AlertLbl.TextStrokeTransparency = 0.3

    local OpenBtn = Instance.new("TextButton", ScreenGui)
    OpenBtn.Position = UDim2.new(0.5, -60, 0, 8)
    OpenBtn.Size = UDim2.new(0, 120, 0, 28)
    OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    OpenBtn.Text = "MEDRIT [V12]"
    OpenBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.TextSize = 10
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 6)
    local OpenStroke = Instance.new("UIStroke", OpenBtn)
    OpenStroke.Color = Color3.fromRGB(50, 50, 50)
    OpenStroke.Thickness = 1.2

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Position = UDim2.new(0.5, -125, 0.5, -180)
    MainFrame.Size = UDim2.new(0, 250, 0, 380)
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
    Title.Size = UDim2.new(1, -20, 1, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "MEDRIT HUB [V12]"
    Title.TextColor3 = Color3.fromRGB(240, 240, 240)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 10
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local TabBar = Instance.new("Frame", MainFrame)
    TabBar.Position = UDim2.new(0, 8, 0, 38)
    TabBar.Size = UDim2.new(1, -16, 0, 26)
    TabBar.BackgroundTransparency = 1

    local TabList = Instance.new("UIListLayout", TabBar)
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.Padding = UDim.new(0, 4)

    local Pages = {}
    local function CreateTab(name)
        local TabBtn = Instance.new("TextButton", TabBar)
        TabBtn.Size = UDim2.new(0.32, 0, 1, 0)
        TabBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        TabBtn.Text = name
        TabBtn.TextColor3 = Color3.fromRGB(140, 140, 140)
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextSize = 9
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 5)
        local TabStroke = Instance.new("UIStroke", TabBtn)
        TabStroke.Color = Color3.fromRGB(35, 35, 35)
        TabStroke.Thickness = 1

        local Page = Instance.new("ScrollingFrame", MainFrame)
        Page.Position = UDim2.new(0, 8, 0, 72)
        Page.Size = UDim2.new(1, -16, 1, -80)
        Page.BackgroundTransparency = 1
        Page.CanvasSize = UDim2.new(0, 0, 0, 380)
        Page.ScrollBarThickness = 2
        Page.Visible = false

        local PList = Instance.new("UIListLayout", Page)
        PList.Padding = UDim.new(0, 5)

        Pages[name] = Page

        TabBtn.MouseButton1Click:Connect(function()
            for _, p in pairs(Pages) do p.Visible = false end
            Page.Visible = true
        end)

        return Page
    end

    local Tab1 = CreateTab("Main")
    local Tab2 = CreateTab("Visuals")
    local Tab3 = CreateTab("Movement")

    if Pages["Main"] then Pages["Main"].Visible = true end

    OpenBtn.MouseButton1Click:Connect(function() 
        MainFrame.Visible = not MainFrame.Visible 
    end)

    local function CreateToggle(parent, name, callback)
        local state = false
        local Btn = Instance.new("TextButton", parent)
        Btn.Size = UDim2.new(1, 0, 0, 30)
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

    -- ================= TAB 1 =================
    local fullbrightConn = nil
    CreateToggle(Tab1, "Real Fullbright", function(val)
        if val then
            fullbrightConn = RunService.RenderStepped:Connect(function()
                Lighting.GlobalShadows = false
                Lighting.Brightness = 3
                Lighting.ClockTime = 14
                Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
                Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                Lighting.FogEnd = 1000000
                for _, v in pairs(Lighting:GetChildren()) do
                    if v:IsA("Atmosphere") or v:IsA("PostEffect") then v.Enabled = false end
                end
            end)
        else
            if fullbrightConn then
                fullbrightConn:Disconnect()
                fullbrightConn = nil
            end
            Lighting.GlobalShadows = true
            Lighting.Brightness = 1
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            Lighting.FogEnd = 1000
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("Atmosphere") or v:IsA("PostEffect") then v.Enabled = true end
            end
        end
    end)

    local skySafePart = nil
    local savedPlayerPos = nil
    CreateToggle(Tab1, "Sky Safe (Block in Sky)", function(val)
        if val then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local root = char.HumanoidRootPart
                savedPlayerPos = root.CFrame
                
                skySafePart = Instance.new("Part", Workspace)
                skySafePart.Name = "MedritSkyPlatform"
                skySafePart.Size = Vector3.new(40, 2, 40)
                skySafePart.Anchored = true
                skySafePart.CanCollide = true
                skySafePart.BrickColor = BrickColor.new("Medium stone grey")
                skySafePart.Material = Enum.Material.SmoothPlastic
                skySafePart.Position = root.Position + Vector3.new(0, 200, 0)
                
                task.wait(0.05)
                root.CFrame = skySafePart.CFrame + Vector3.new(0, 5, 0)
                
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.PlatformStand = false
                end
            end
        else
            if skySafePart then
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") and savedPlayerPos then
                    char.HumanoidRootPart.CFrame = savedPlayerPos + Vector3.new(0, 3, 0)
                end
                skySafePart:Destroy()
                skySafePart = nil
                savedPlayerPos = nil
            end
        end
    end)

    -- ================= TAB 2 =================
    local espFolder = Instance.new("Folder", ScreenGui)
    local itemEspFolder = Instance.new("Folder", ScreenGui)
    local espAyu, espPlr, espItems = false, false, false

    CreateToggle(Tab2, "ESP Monsters", function(val) espAyu = val; espFolder:ClearAllChildren() end)
    CreateToggle(Tab2, "ESP Players", function(val) espPlr = val; espFolder:ClearAllChildren() end)
    CreateToggle(Tab2, "ESP Items", function(val) espItems = val; itemEspFolder:ClearAllChildren() end)

    RunService.RenderStepped:Connect(function()
        espFolder:ClearAllChildren()
        
        local ayuClose = false
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local myRoot = LocalPlayer.Character.HumanoidRootPart
            local myPos = myRoot.Position
            
            for _, obj in pairs(Workspace:GetChildren()) do
                if obj:FindFirstChildOfClass("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                    if obj:FindFirstChild("HumanoidRootPart") then
                        local dist = (obj.HumanoidRootPart.Position - myPos).Magnitude
                        if dist < 30 then
                            ayuClose = true
                        end
                    end
                    if espAyu then
                        local hl = Instance.new("Highlight", espFolder)
                        hl.Adornee = obj
                        hl.FillColor = Color3.fromRGB(240, 50, 50)
                    end
                end
            end
        end

        AlertLbl.Text = ayuClose and "⚠️ Ayuwoki is approaching you! ⚠️" or ""

        if espPlr then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local hl = Instance.new("Highlight", espFolder)
                    hl.Adornee = p.Character
                    hl.FillColor = Color3.fromRGB(50, 150, 240)
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.2) do
            itemEspFolder:ClearAllChildren()
            if espItems and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local myPos = LocalPlayer.Character.HumanoidRootPart.Position
                
                for _, obj in pairs(Workspace:GetDescendants()) do
                    local target = nil
                    
                    if obj:IsA("ProximityPrompt") then
                        local parent = obj.Parent
                        if parent then
                            target = parent
                        end
                    end
                    
                    if target then
                        if not target:IsDescendantOf(LocalPlayer.Character) and not target:IsDescendantOf(LocalPlayer.Backpack) then
                            local mainPart = target:IsA("BasePart") and target or target:FindFirstChildOfClass("BasePart") or target.PrimaryPart
                            
                            if mainPart and mainPart.Parent then
                                local dist = math.floor((mainPart.Position - myPos).Magnitude)
                                if dist < 300 then
                                    local hl = Instance.new("Highlight", itemEspFolder)
                                    hl.Adornee = target
                                    hl.FillColor = Color3.fromRGB(50, 240, 100)
                                    hl.OutlineColor = Color3.fromRGB(240, 240, 240)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    -- ================= TAB 3 =================
    CreateToggle(Tab3, "Infinite Stamina", function(val)
        if val then
            pcall(function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/The-Ayuwoki-Field-Inf-stamina-72918"))()
            end)
        end
    end)

    CreateToggle(Tab3, "Noclip", function(val)
        if val then
            getgenv().MedritNoclip = RunService.Stepped:Connect(function()
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end)
        else
            if getgenv().MedritNoclip then
                getgenv().MedritNoclip:Disconnect()
                getgenv().MedritNoclip = nil
            end
        end
    end)
end
