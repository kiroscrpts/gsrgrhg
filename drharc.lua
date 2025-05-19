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

-- Animate progress bar
spawn(function()
	while true do
		for i = 1, 100 do
			progressBar.Size = UDim2.new(i/100, 0, 1, 0)
			wait(0.01)
		end
		wait(0.3)
		for i = 100, 1, -1 do
			progressBar.Size = UDim2.new(i/100, 0, 1, 0)
			wait(0.005)
		end
		wait(0.3)
	end
end)
