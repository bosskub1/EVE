--// Wait game
if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Services
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local Player = Players.LocalPlayer

--// Map info
local PlaceId = game.PlaceId
local MapName = "Unknown"
pcall(function()
    MapName = MarketplaceService:GetProductInfo(PlaceId).Name
end)

--// ScreenGui
local ScreenGui = Instance.new("ScreenGui", Player.PlayerGui)
ScreenGui.Name = "AgainHub"

--// Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromScale(0.34, 0.28)
Main.Position = UDim2.fromScale(0.33, 0.34)
Main.BorderSizePixel = 0

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 18)

--// Dark Void Gradient
local BG = Instance.new("UIGradient", Main)
BG.Rotation = 135
BG.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHSV(0.72, 0.55, 0.12)), -- dark purple
    ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.65, 0.65, 0.18)), -- void blue
    ColorSequenceKeypoint.new(1, Color3.fromHSV(0.78, 0.45, 0.1)) -- deep void
})

--// Void Border
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 1.6
Stroke.Transparency = 0.15
Stroke.Color = Color3.fromHSV(0.72, 0.8, 1)

--// Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.fromScale(1, 0.22)
Title.BackgroundTransparency = 1
Title.Text = "AGAIN HUB"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromHSV(0.75, 0.3, 1)

--// Glow effect (fake)
local Glow = Instance.new("UIStroke", Title)
Glow.Thickness = 2
Glow.Transparency = 0.7
Glow.Color = Color3.fromHSV(0.72, 1, 1)

--// Map label
local MapLabel = Instance.new("TextLabel", Main)
MapLabel.Position = UDim2.fromScale(0, 0.3)
MapLabel.Size = UDim2.fromScale(1, 0.18)
MapLabel.BackgroundTransparency = 1
MapLabel.Text = "Map : "..MapName
MapLabel.Font = Enum.Font.Gotham
MapLabel.TextScaled = true
MapLabel.TextColor3 = Color3.fromHSV(0.6, 0.15, 0.9)

--// Status
local Status = Instance.new("TextLabel", Main)
Status.Position = UDim2.fromScale(0, 0.58)
Status.Size = UDim2.fromScale(1, 0.25)
Status.BackgroundTransparency = 1
Status.Text = "WAIT SCRIPT LOADED"
Status.Font = Enum.Font.GothamSemibold
Status.TextScaled = true
Status.TextColor3 = Color3.fromHSV(0.15, 0.8, 1)

--// Map scripts
local Maps = {
    [10595058975] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/ArcaneLineage.lua",
    [3351674303] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/DrivingEmpire.lua",
}

--// Load script
task.spawn(function()
    local url = Maps[PlaceId]
    if not url then
        Status.Text = "Script Not Supported"
        Status.TextColor3 = Color3.fromHSV(0, 0.9, 1)
        task.wait(1.8)
        ScreenGui:Destroy()
        return
    end

    local success = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if success then
        Status.Text = "Loaded ✓"
        Status.TextColor3 = Color3.fromHSV(0.33, 0.9, 1)
    else
        Status.Text = "Error"
        Status.TextColor3 = Color3.fromHSV(0, 0.9, 1)
    end

    task.wait(1.5)
    ScreenGui:Destroy()
end)
