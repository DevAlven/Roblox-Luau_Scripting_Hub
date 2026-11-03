-- useless script tbh
-- this script rejoins you to the same exact server
-- made by vc_specs

local teleport = game:GetService("TeleportService")
local player = game:GetService("Players").LocalPlayer

teleport:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
