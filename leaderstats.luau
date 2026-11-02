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
