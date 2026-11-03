-- This script gives money to you everytime a you touch the part/block.
-- Insert a script to your part/block in workspace then paste this code.
-- You can modify some parts on this script ONLY IF YOU KNOW WHAT YOU ARE DOING.
-- This script is connected to the leaderstats script that I also made.
-- I recommend you to change the "leaderstats" and the "money" part if you already made your own leaderstats script.
-- Made by vc_specs

local canGiveMoney = true
local part = script.Parent
part.Touched:Connect(function(hit)
    local character = hit.Parent
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
      local player = game.Players:GetPlayerFromCharacter(character)
    
      if player then
        local leaderstats = player:FindFirstChild("leaderstats")
    
        if leaderstats then
            local money = leaderstats:FindFirstChild("Money")

          if money then
            money.Value = money.Value + 10
          
            if canGiveMoney == true then
              canGiveMoney = false
              task.wait(2)
              canGiveMoney = true
            end
          end
        end
      end
    end
end)
