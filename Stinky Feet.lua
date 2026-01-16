-- Made by Zyrkon_Vaalix
-- Roblox game: https://www.roblox.com/games/135073499041900/Anime-Feet-Simulator-X

local autoClickerToggle = false
local autoRebirthToggle = false
local autoHatchToggle = false

local eggType = "Waifu Egg" 
local eggAmount = 1

-- Functions
local function autoClickerFunction()
    while autoClickerToggle do
        task.wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Clicker"):FireServer()
    end
end

local function autoRebirthFunction()
    while autoRebirthToggle do
        task.wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Rebirth"):FireServer()
    end
end

local function autoHatchFunction()
    while autoHatchToggle do
        task.wait()
        local args = {
            eggType,
            eggAmount
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Egg"):InvokeServer(unpack(args))
    end
end


task.spawn(function()
    while true do
        task.wait()

        

        
    end
end)




local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()


local Window = Library:CreateWindow('Stinky Feet', 'Anime Feet Simulator X', 'Visual UI Library', 'rbxassetid://10618928818', false, 'VisualUIConfigs', 'Default')


local autoFarm = Window:CreateTab('Auto Farm', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))

local main = autoFarm:CreateSection('Main')

local autoClicker = main:CreateToggle('Auto Clicker', false, Color3.fromRGB(0, 125, 255), 0, function(Value)
    autoClickerToggle = Value

    if autoClickerToggle then
        task.spawn(autoClickerFunction)
    end
end)

local deleteCoinSound = main:CreateButton('Delete Coin Sound', function()
    game:GetService("ReplicatedStorage").Assets.Sounds.Coins:Destroy()
end)

local autoRebirth = main:CreateToggle('Auto Rebirth', false, Color3.fromRGB(0, 125, 255), 0, function(Value)
    autoRebirthToggle = Value

    if autoRebirthToggle then
        task.spawn(autoRebirthFunction)
    end
end)

local eggSelection = main:CreateTextbox('Egg Type', eggType, function(Value)
    eggType = Value
end)

local eggAmountDropdown = main:CreateDropdown('Egg Amount', {1, 2, 3}, 1, 0.25, function(Value)
    eggAmount = Value
end)

local autoHatch = main:CreateToggle('Auto Hatch', false, Color3.fromRGB(0, 125, 255), 0, function(Value)
    autoHatchToggle = Value

    if autoHatchToggle then
        task.spawn(autoHatchFunction)
    end
end)



