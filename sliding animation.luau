-- Simple sliding animation script.
-- Made specifically for GUIs.
-- Insert a local script into your GUI's frame.
-- Made by vc_specs

local TweenService = game:GetService("TweenService")
local frame = script.Parent

-- Define the start and end positions of the frame
local open_position = UDim2.new(0.5, 0, 0.5, 0)   -- Center of the screen
local close_position = UDim2.new(0.5, 0, 1.5, 0) -- Hidden below the screen

-- Set starting position immediately
frame.Position = close_position

-- Configure the animation style
local info = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- Keep track of active tweens to prevent spam-clicking glitches
local currentTween = nil

local function playTween(targetPosition)
	if currentTween then
		currentTween:Cancel()
	end
	currentTween = TweenService:Create(frame, info, {Position = targetPosition})
	currentTween:Play()
end

local function openShop()
	playTween(open_position)
end

local function closeShop()
	playTween(close_position)
end

-- Button connections (ensure your button names match these)
local openButton = script.Parent.Parent:WaitForChild("OpenButton")
openButton.MouseButton1Click:Connect(openShop)

local closeButton = script.Parent:WaitForChild("CloseButton")
closeButton.MouseButton1Click:Connect(closeShop)
