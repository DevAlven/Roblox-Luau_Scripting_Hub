-- If you dont have a leaderstats script yet, use this script.
-- This script is important if you are making simulators, RNGs, etc. which needs a leaderstats for shops and others.
-- Made by vc_specs

local player = game:GetService("Players")

game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = Player

    local money = Instance.new("IntValue")
    money.Name = "Money"
    money.Parent = leaderstats
    money.Value = 0
end)
