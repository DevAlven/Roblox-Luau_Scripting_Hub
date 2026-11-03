-- WELCOME!!!
--  this is the full guide of how to script roblox luau.
-- all code in this is used for coding in roblox.
-- made by vc_specs

-- VARIABLES
Variables store information. In Luau, always use the local keyword to 
scope variables efficiently to the block of code they are created in.
ex.
local score: number = 0                     -- Handles both integers and decimals
local playerName: string = "Builderman"     -- Text string
local isPlaying: boolean = true             -- True or false
local target: nil = nil                     -- nil Represents nothingness or non-existence


score += 10   -- Equivalent to: score = score + 10


-- TABLES, ARRAYS, AND DICTIONARIES
Tables are Luau's only data structure. They act as both ordered lists (arrays) and 
key-value maps (dictionaries). Note: Luau arrays are 1-indexed.
ex.
-- Array (Ordered list)
local inventory = {"Sword", "Shield", "Potion"}
print(inventory[1]) --> "Sword"

-- Dictionary (Key-Value)
local upgradeCosts = {
    Sword = 150,
    Shield = 100,
}
print(upgradeCosts.Sword) --> 150

-- CONTROL STRUCTURES
Control structures direct the program's path based on conditions or repetitions.
ex.
if score >= 100 then
    print("You win!")
elseif score > 50 then
    print("Almost there!")
else
    print("Keep trying!")
end

-- LOOPS AND ITERATION
-- For Loop (Start, End, Step)
for count = 1, 5 do
    print("Count is " .. count) -- Repeats 5 times
end

-- Generalized Iteration over tables (Luau exclusive syntax)
for key, value in upgradeCosts do
    print(key, value)
end

-- FUNCTIONS AND THE TASK LIBRARY
Functions wrap reusable logic. When managing timing in Roblox, use the modern task library instead of old global methods.
ex.
-- Function declaration with type annotations
local function calculateTotal(price: number, tax: number): number
    return price * (1 + tax)
end

-- Invoking the function
local finalPrice = calculateTotal(100, 0.12)

-- Task scheduling
task.wait(2) -- Pauses the thread efficiently for 2 seconds
task.spawn(function()
    print("This runs immediately without blocking the code below!")
end)

-- ROBLOX INSTANCES AND EVENT HANDLING
Roblox scripting combines the Luau language with the Roblox Engine API. 
The game world is structured as a tree of objects called Instances.
ex.
-- Referencing instances in the Explorer game tree
local part = workspace:WaitForChild("KillPart") -- Safely wait for an object to load

-- Modifying Properties
part.BrickColor = BrickColor.new("Bright red")
part.Anchored = true

-- Connecting Events (Functions triggered by game actions)
local function onTouched(otherPart)
    local character = otherPart.Parent
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        humanoid.Health = 0 -- Kills the player
    end
end

part.Touched:Connect(onTouched) -- Listens for physical contact

-- EVENTS (CLIENT VS. SERVER)
Roblox splits game execution across two distinct environments to manage security and multiplayer networking.

-- Environment	  -- Script Type	    -- Execution Location	    -- Primary Responsibilities
   Server	           Script	            Roblox Cloud Servers	     Saving data, managing game state, processing purchases.
   Client	           LocalScript	      Players Device	           Registering keystrokes/touches, 
                                                                   rendering UI, camera control.

-- REMOTE EVENTS
To pass information across this boundary 
(e.g., a client clicking a shop button to buy an item verified by the server), use a RemoteEvent.
ex.
-- SERVER SCRIPT (Receiving network request)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyEvent = ReplicatedStorage:WaitForChild("BuyItemEvent")

buyEvent.OnServerEvent:Connect(function(player, itemName)
    print(player.Name .. " wants to buy " .. itemName)
    -- Insert logic here to verify currency and give item
end)

-- CLIENT SCRIPT (Sending network request)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyEvent = ReplicatedStorage:WaitForChild("BuyItemEvent")

buyEvent:FireServer("DiamondSword")

-- MODERN LUAU FEATURES
If you are coming from traditional Lua 5.1, Luau introduces native optimizations and syntax enhancements:
  String Interpolation: Format text cleanly using backticks instead of concatenation (..).
ex.
local message = `Hello {playerName}! Your score is {score}.`

Strict Type Checking: Add --!strict to the absolute top of your script. Studio will flag type mismatches before runtime.
The continue keyword: Skips the rest of the current loop iteration and moves to the next one.

-- THANK YOU FOR YOUR EFFORT READING THIS!
-- I WISH YOU LEARNED SOMETHING!
