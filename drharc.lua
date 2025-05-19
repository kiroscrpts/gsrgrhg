--  "Loading Script!" GUI for Roblox (All Games & Executors)
local gui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local uicorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local progressBarBG = Instance.new("Frame")
local progressBar = Instance.new("Frame")
local corner1 = Instance.new("UICorner")
local corner2 = Instance.new("UICorner")

-- Executor-friendly GUI parenting
pcall(function()
	gui.Parent = game:GetService("CoreGui")
end)
if not gui.Parent then
	gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

gui.Name = "LoadingScriptGUI"

-- Main frame (rounded black box)
mainFrame.Parent = gui
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.Size = UDim2.new(0, 400, 0, 150)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -75)
mainFrame.BackgroundTransparency = 0.1
uicorner.CornerRadius = UDim.new(0, 12)
uicorner.Parent = mainFrame

-- Title label
title.Parent = mainFrame
title.Text = "Loading script!"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Progress bar background
progressBarBG.Parent = mainFrame
progressBarBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
progressBarBG.Position = UDim2.new(0.1, 0, 0.7, 0)
progressBarBG.Size = UDim2.new(0.8, 0, 0.15, 0)
corner1.CornerRadius = UDim.new(0, 6)
corner1.Parent = progressBarBG

-- Progress bar fill
progressBar.Parent = progressBarBG
progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
progressBar.Size = UDim2.new(0, 0, 1, 0)
corner2.CornerRadius = UDim.new(0, 6)
corner2.Parent = progressBar

-- Percentage label above the progress bar
local percentageLabel = Instance.new("TextLabel")
percentageLabel.Parent = mainFrame
percentageLabel.Position = UDim2.new(0.5, 0, 0.55, 0) -- Slightly above the progress bar
percentageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
percentageLabel.Size = UDim2.new(0, 100, 0, 30)
percentageLabel.BackgroundTransparency = 1
percentageLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
percentageLabel.Font = Enum.Font.GothamBold
percentageLabel.TextScaled = true
percentageLabel.Text = "1%"

-- Run Script button (hidden initially)
local runButton = Instance.new("TextButton")
runButton.Parent = mainFrame
runButton.Size = UDim2.new(0.4, 0, 0.2, 0)
runButton.Position = UDim2.new(0.5, 0, 0.88, 0)
runButton.AnchorPoint = Vector2.new(0.5, 0.5)
runButton.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
runButton.TextColor3 = Color3.fromRGB(0, 0, 0)
runButton.Font = Enum.Font.GothamBold
runButton.TextScaled = true
runButton.Text = "Run Script"
runButton.Visible = false

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = runButton

-- Animate progress bar and percentage over 80 seconds
spawn(function()
	for i = 1, 100 do
		progressBar.Size = UDim2.new(i / 100, 0, 1, 0)
		percentageLabel.Text = i .. "%"
		wait(0.8) -- 80 seconds total
	end

	-- Show Run Script button after loading completes
	runButton.Visible = true
end)

-- Do nothing when button is clicked (placeholder)
runButton.MouseButton1Click:Connect(function()
	print("Run Script button clicked (no action)")
end)
