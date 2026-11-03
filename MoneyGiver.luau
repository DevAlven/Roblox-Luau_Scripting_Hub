-- This script gives money to you every time you touch the part/block.
-- Insert a script into your part/block in workspace then paste this code.
-- Made by vc_specs (Fixed version)
-- I added a guide for yall to know what it does.

local part = script.Parent
local playerCooldowns = {} -- Tracks cooldown individually for each player

part.Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	
	if humanoid then
		local player = game.Players:GetPlayerFromCharacter(character)
		
		if player then
			-- Check if this specific player is on cooldown
			if playerCooldowns[player] then return end
			
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local money = leaderstats:FindFirstChild("Money")
				
				if money then
					-- Set player on cooldown before adding money
					playerCooldowns[player] = true
					
					-- Give money
					money.Value = money.Value + 10
					print(player.Name .. " collected 10 money!")
					
					-- Wait 2 seconds for this player, then clear their cooldown
					task.wait(2)
					playerCooldowns[player] = nil
				end
			end
		end
	end
end)
