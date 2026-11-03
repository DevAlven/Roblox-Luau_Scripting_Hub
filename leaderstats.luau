-- this script is a complete leaderstats script with data store service
-- Publish your game first, then go to file - experience settings - security - then click Enable Studio Access to API Services.
-- If you dont have a leaderstats script yet, use this script.
-- This script is important if you are making simulators, RNGs, etc. which needs a leaderstats for shops and others.
-- I recommend you to change the "money.Value = 0" based on what starting value you want for new players.
-- Made by vc_specs (Fixed Version v2)

local DataStoreService = game:GetService("DataStoreService")
local playerdatastore = DataStoreService:GetDataStore("PlayerLeaderstats_DataV1")
local Players = game:GetService("Players") 

Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player 

    local money = Instance.new("IntValue")
    money.Name = "Money"
    money.Parent = leaderstats
    money.Value = 0

    local playerkey = "Player_" .. player.UserId
    local success, savedData = pcall(function()
        return playerdatastore:GetAsync(playerkey) 
    end)

    if success then
        if savedData and savedData.money then
            money.Value = savedData.money
        end
    else
        warn("Failed to load data for " .. player.Name)
    end
end)

-- function to save data when player leaves
local function saveData(player) 
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then return end

    local money = leaderstats:FindFirstChild("Money")
    if not money then return end

    local playerkey = "Player_" .. player.UserId 
    local dataToSave = {
        money = money.Value
    }

    local success, err = pcall(function()
        playerdatastore:SetAsync(playerkey, dataToSave)
    end)

    if not success then
        warn("Failed to save data for " .. player.Name .. ": " .. tostring(err)) 
    end
end

Players.PlayerRemoving:Connect(saveData)

-- handle server shutdown safety
game:BindToClose(function()
    for _, player in ipairs(Players:GetPlayers()) do
        task.spawn(function()
            saveData(player)
        end)
    end
end)
