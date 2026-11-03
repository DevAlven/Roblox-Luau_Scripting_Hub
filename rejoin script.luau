-- useless script tbh
-- rejoins to exact same server
-- made by vc_specs

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local placeId = game.PlaceId
local jobId = game.JobId

if jobId == "" then
    warn("Cannot rejoin: JobId is empty (likely running in Roblox Studio).")
    return
end

local success, result = pcall(function()
    TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
end)

if not success then
    warn("Rejoin failed:", result)
    -- Fallback: Teleport to any available server in the place
    TeleportService:Teleport(placeId, LocalPlayer)
end
