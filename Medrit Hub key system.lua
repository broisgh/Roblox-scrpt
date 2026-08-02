-- ====================================================
--            MEDRITHUB KEY SYSTEM (GUI)
-- ====================================================

local CorrectKey = "MedritCool920"
local KeyLinkvertise = "https://link-hub.net/8028026/xJSUmCL3Y9O4"
local MainScriptURL = "https://raw.githubusercontent.com/broisgh/Roblox-scrpt/refs/heads/main/MedritHub.lua"

-- Roblox Services
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Prevent duplicate UI
if CoreGui:FindFirstChild("MedritKeyUI") then
    CoreGui.MedritKeyUI:Destroy()
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MedritKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 220)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Title Text
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "MEDRITHUB | KEY SYSTEM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

-- Key TextBox
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0, 40)
KeyInput.Position = UDim2.new(0.075, 0, 0.28, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
KeyInput.Text = ""
KeyInput.TextSize = 15
KeyInput.Font = Enum.Font.SourceSans
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = KeyInput

-- Status Text
local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 20)
StatusText.Position = UDim2.new(0, 0, 0.52, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = ""
StatusText.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusText.TextSize = 14
StatusText.Font = Enum.Font.SourceSansItalic
StatusText.Parent = MainFrame

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 38)
GetKeyBtn.Position = UDim2.new(0.075, 0, 0.68, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(45, 90, 180)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 16
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.Parent = MainFrame

local BtnCorner1 = Instance.new("UICorner")
BtnCorner1.CornerRadius = UDim.new(0, 6)
BtnCorner1.Parent = GetKeyBtn

-- Enter Button
local EnterBtn = Instance.new("TextButton")
EnterBtn.Size = UDim2.new(0.4, 0, 0, 38)
EnterBtn.Position = UDim2.new(0.525, 0, 0.68, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
EnterBtn.Text = "Enter"
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.TextSize = 16
EnterBtn.Font = Enum.Font.SourceSansBold
EnterBtn.Parent = MainFrame

local BtnCorner2 = Instance.new("UICorner")
BtnCorner2.CornerRadius = UDim.new(0, 6)
BtnCorner2.Parent = EnterBtn

-- ====================================================
--                   LOGIC / EVENTS
-- ====================================================

-- Click Get Key
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KeyLinkvertise)
        StatusText.TextColor3 = Color3.fromRGB(80, 255, 120)
        StatusText.Text = "Link copied to clipboard!"
    else
        StatusText.TextColor3 = Color3.fromRGB(255, 180, 80)
        StatusText.Text = "Clipboard not supported!"
    end
end)

-- Click Enter
EnterBtn.MouseButton1Click:Connect(function()
    local userKey = KeyInput.Text:gsub("%s+", "")
    
    if userKey == CorrectKey then
        StatusText.TextColor3 = Color3.fromRGB(80, 255, 120)
        StatusText.Text = "Key Verified! Loading..."
        
        task.wait(1)
        ScreenGui:Destroy()
        
        -- Load main script
        loadstring(game:HttpGet(MainScriptURL))()
    else
        StatusText.TextColor3 = Color3.fromRGB(255, 80, 80)
        StatusText.Text = "Invalid Key! Try again."
    end
end)
