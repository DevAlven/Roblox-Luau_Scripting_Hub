-- Simple sliding animation script.
-- Made specifically for GUIs.
-- Insert a local script to your gui's frame NOT ON THE GUI! ONLY INSIDE THE FRAME OF YOUR GUI.
-- PLEASE! change the UDim2 (close and open position) based on where your frame is positioned (left, right, center, top, bottom).
-- READ THE INSTRUCTIONS ON WHAT TO DO
-- Made by vc_specs

local tween = game:GetService("TweenService")
local frame = script.Parent

-- define the start and end positions of the frame - CHANGE THIS PART IF YOU WANT
local open_position = UDim2.new(0.5, 0, 0.5, 0) -- center of the screen - CHANGE THIS PART based on the position you want
local close_position = UDim2.new(0.5, 0, 1.5, 0) -- hidden below the screen at Y scale 1.5 - CHANGE THIS PART based on the position you want

-- starting position
frame.Position = close_position

-- configure the animation style
local info = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- opening animation
local function openShop()
	local openTween = tween:Create(frame, info, {Position = open_position})
	openTween:Play()
end

-- closing animation
local function closeShop()
  local closeTween = tween:Create(frame, info, {Position = close_position})
  closeTween:Play()
end
-- button connection - CHANGE THIS PART BASED ON WHAT YOU NAMED YOUR BUTTON FOR OPENING THE SHOP
local openbutton = script.Parent.Parent:WaitForChild("OpenButton") -- CHANGE THIS PART, open button is usually outside the main frame but inside the gui.
openbutton.MouseButton1Click:Connect(openShop)

local closebutton = script.Parent:WaitForChild("CloseButton") -- CHANGE THIS PART, close button is usually inside the main frame.
closebutton.MouseButton1Click:Connect(closeShop)
