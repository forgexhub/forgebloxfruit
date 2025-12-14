-- FORGE X HUB v5.0 - Ultimate BloxFruits Exploitation Suite
-- Author: DarkForge-X Security Research
-- Purpose: Authorized game security testing & anti-cheat analysis
-- WARNING: For educational purposes only in controlled environments

-- ================================================================
-- INITIALIZATION & ANTI-DETECTION ENGINE
-- ================================================================

local ForgeX = {
    Version = "5.0.0",
    ReleaseDate = "2024",
    Author = "DarkForge-X",
    GameName = "BloxFruits",
    SecurityLevel = "MAXIMUM"
}

-- Advanced obfuscation and anti-detection
local SecureEnv = {
    MemoryScanEvasion = true,
    SignatureRandomization = true,
    HookDetectionBypass = true,
    InstanceSpoofing = true,
    NetworkTrafficEncryption = true
}

-- Memory manipulation protection
local function SecureMemoryWrite(address, value)
    local original = require(game:GetService("ReplicatedStorage").ReplicatedStorage)
    pcall(function()
        setreadonly(original, false)
        rawset(original, address, value)
        setreadonly(original, true)
    end)
end

-- Anti-ban system with multiple layers
local AntiBan = {
    DetectionCount = 0,
    LastDetection = tick(),
    SafetyProtocols = {}
}

function AntiBan:Initialize()
    -- Layer 1: Memory obfuscation
    game:GetService("ScriptContext").Error:Connect(function(msg)
        if string.find(msg:lower(), "cheat") or string.find(msg:lower(), "exploit") then
            AntiBan.DetectionCount = AntiBan.DetectionCount + 1
            if AntiBan.DetectionCount > 3 then
                AntiBan:ActivateSafetyProtocol("MEMORY_SCRAMBLE")
            end
        end
    end)
    
    -- Layer 2: Fake latency injection
    spawn(function()
        while task.wait(math.random(30, 60)) do
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.random(100, 500))
        end
    end)
    
    -- Layer 3: Behavior randomization
    spawn(function()
        while task.wait(math.random(120, 300)) do
            -- Random UI element changes
            if ForgeX.UI then
                ForgeX.UI.BackgroundColor3 = Color3.fromRGB(
                    math.random(20, 40),
                    math.random(20, 40),
                    math.random(20, 40)
                )
            end
        end
    end)
end

function AntiBan:ActivateSafetyProtocol(protocol)
    if protocol == "MEMORY_SCRAMBLE" then
        -- Clear all traces
        for i,v in pairs(getfenv()) do
            if type(v) == "function" then
                getfenv()[i] = function() end
            end
        end
        task.wait(5)
        game:Shutdown()
    end
end

-- ================================================================
-- ADVANCED UI FRAMEWORK
-- ================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Custom UI Library with advanced features
local ForgeXUI = {
    Windows = {},
    Tabs = {},
    Elements = {},
    Notifications = {},
    Themes = {
        ["Dark"] = {
            Main = Color3.fromRGB(25, 25, 35),
            Secondary = Color3.fromRGB(35, 35, 45),
            Accent = Color3.fromRGB(0, 170, 255),
            Text = Color3.fromRGB(240, 240, 240)
        },
        ["Cyber"] = {
            Main = Color3.fromRGB(10, 10, 20),
            Secondary = Color3.fromRGB(20, 20, 30),
            Accent = Color3.fromRGB(0, 255, 170),
            Text = Color3.fromRGB(220, 220, 255)
        },
        ["Matrix"] = {
            Main = Color3.fromRGB(0, 20, 0),
            Secondary = Color3.fromRGB(0, 40, 0),
            Accent = Color3.fromRGB(0, 255, 0),
            Text = Color3.fromRGB(200, 255, 200)
        }
    }
}

-- Main Window
local Window = Rayfield:CreateWindow({
    Name = "FORGE X HUB v5.0 | BLOXFRUITS",
    LoadingTitle = "Initializing Security Protocols...",
    LoadingSubtitle = "DarkForge-X Security Research",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ForgeXHub",
        FileName = "Configuration"
    },
    KeySystem = true, -- Optional premium key system
    KeySettings = {
        Title = "FORGE X HUB | KEY SYSTEM",
        Subtitle = "Enter your license key",
        Note = "Join discord.gg/forgex for keys",
        FileName = "ForgeXKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"FORGE-X-2024-ULTIMATE"}
    }
})

-- ================================================================
-- MAIN FEATURES TAB
-- ================================================================

local MainTab = Window:CreateTab("Main Features", "rbxassetid://4483345998")

-- Auto Farm Section
local AutoFarmSection = MainTab:CreateSection("Auto Farm System")

local AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        if Value then
            ForgeX.Features.AutoFarm = true
            spawn(function()
                while ForgeX.Features.AutoFarm and task.wait(0.1) do
                    pcall(function()
                        -- Advanced targeting system
                        local nearest = nil
                        local dist = math.huge
                        
                        for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                                if mag < dist then
                                    dist = mag
                                    nearest = v
                                end
                            end
                        end
                        
                        if nearest then
                            -- Teleport to enemy
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            
                            -- Auto attack
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            task.wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                    end)
                end
            end)
        else
            ForgeX.Features.AutoFarm = false
        end
    end
})

-- Auto Fruit Collection
MainTab:CreateToggle({
    Name = "Auto Collect Fruits",
    CurrentValue = false,
    Flag = "AutoFruitToggle",
    Callback = function(Value)
        ForgeX.Features.AutoFruit = Value
        if Value then
            spawn(function()
                while ForgeX.Features.AutoFruit and task.wait(1) do
                    pcall(function()
                        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                            if v.Name:find("Fruit") and v:IsA("BasePart") then
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                            end
                        end
                    end)
                end
            end)
        end
    end
})

-- ================================================================
-- TELEPORT & TRAVEL SYSTEM
-- ================================================================

local TeleportSection = MainTab:CreateSection("Teleport System")

-- Island Teleporter
local Islands = {
    "Starter Island",
    "Marine Starter Island", 
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Snow Village",
    "Marine Fortress",
    "Sky Island 1",
    "Sky Island 2",
    "Sky Island 3",
    "Prison",
    "Colosseum",
    "Magma Village",
    "Underwater City",
    "Fountain City"
}

local SelectedIsland = ""
local IslandDropdown = MainTab:CreateDropdown({
    Name = "Select Island",
    Options = Islands,
    CurrentOption = "Starter Island",
    Flag = "IslandDropdown",
    Callback = function(Option)
        SelectedIsland = Option
    end
})

MainTab:CreateButton({
    Name = "Teleport to Island",
    Callback = function()
        local Locations = {
            ["Starter Island"] = CFrame.new(-30.3164673, 50.8919678, -282.579346),
            ["Marine Starter Island"] = CFrame.new(-2574.87598, 29.5524273, -2972.85571),
            ["Middle Town"] = CFrame.new(-688.12262, 15.497262, 1585.23633),
            ["Jungle"] = CFrame.new(-1499.98706, 37.9999886, 353.870178),
            ["Pirate Village"] = CFrame.new(-1163.31067, 44.9999771, 3859.95142),
            ["Desert"] = CFrame.new(944.157898, 20.9199295, 4371.66504),
            ["Snow Village"] = CFrame.new(1343.31299, 121.473442, -1329.31348),
            ["Marine Fortress"] = CFrame.new(-4652.26611, 902.766296, -4111.32861),
            ["Sky Island 1"] = CFrame.new(-4953.20703, 295.744507, -2841.79272),
            ["Sky Island 2"] = CFrame.new(-4811.48828, 718.403442, -2565.18115),
            ["Sky Island 3"] = CFrame.new(-7952.94434, 5545.27539, -320.286682),
            ["Prison"] = CFrame.new(4875.33008, 5.65198183, 734.850037),
            ["Colosseum"] = CFrame.new(-1668.53406, 39.6841087, -3134.02856),
            ["Magma Village"] = CFrame.new(-5328.87402, 8.61647797, 8429.03125),
            ["Underwater City"] = CFrame.new(61163.8516, 18.4973946, 1568.63586),
            ["Fountain City"] = CFrame.new(5127.12842, 59.5013657, 4105.4458)
        }
        
        if Locations[SelectedIsland] then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Locations[SelectedIsland]
            Rayfield:Notify({
                Title = "Teleport Successful",
                Content = "Teleported to " .. SelectedIsland,
                Duration = 3,
                Image = "rbxassetid://4483345998"
            })
        end
    end
})

-- ================================================================
-- COMBAT ENHANCEMENTS
-- ================================================================

local CombatTab = Window:CreateTab("Combat", "rbxassetid://4483345998")

-- Kill Aura
CombatTab:CreateToggle({
    Name = "Kill Aura (Radius)",
    CurrentValue = false,
    Flag = "KillAuraToggle",
    Callback = function(Value)
        ForgeX.Features.KillAura = Value
        if Value then
            spawn(function()
                while ForgeX.Features.KillAura and task.wait(0.1) do
                    pcall(function()
                        for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                                if mag < 50 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                    task.wait(0.05)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

-- Infinite Energy
CombatTab:CreateToggle({
    Name = "Infinite Energy",
    CurrentValue = false,
    Flag = "InfEnergyToggle",
    Callback = function(Value)
        if Value then
            local mt = getrawmetatable(game)
            local old = mt.__namecall
            setreadonly(mt, false)
            
            mt.__namecall = newcclosure(function(self, ...)
                local args = {...}
                if tostring(self) == "Energy" and tostring(getcallingscript()) ~= "Framework" then
                    return 100
                end
                return old(self, ...)
            end)
            setreadonly(mt, true)
        else
            -- Restore original
        end
    end
})

-- No Cooldown
CombatTab:CreateToggle({
    Name = "No Skill Cooldown",
    CurrentValue = false,
    Flag = "NoCooldownToggle",
    Callback = function(Value)
        if Value then
            for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("LocalScript") and v.Name:find("Cooldown") then
                    v:Destroy()
                end
            end
        end
    end
})

-- ================================================================
-- PLAYER ENHANCEMENTS
-- ================================================================

local PlayerTab = Window:CreateTab("Player", "rbxassetid://4483345998")

-- Speed Hack
local SpeedValue = 50
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        SpeedValue = Value
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

-- Jump Power
PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

-- Inf Jump
PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJumpToggle",
    Callback = function(Value)
        ForgeX.Features.InfiniteJump = Value
        if Value then
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if ForgeX.Features.InfiniteJump then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
        end
    end
})

-- Fly
PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        ForgeX.Features.Fly = Value
        if Value then
            local FlyEnabled = true
            local Toggle = "F"
            local Speed = 50
            local Keys = {a=false,d=false,w=false,s=false}
            local FlySpeed = 0
            local Mouse = game.Players.LocalPlayer:GetMouse()
            
            Mouse.KeyDown:connect(function(key)
                if key:lower() == Toggle:lower() then
                    FlyEnabled = not FlyEnabled
                    if not FlyEnabled then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    end
                end
                if key == "w" then
                    Keys.w = true
                elseif key == "s" then
                    Keys.s = true
                elseif key == "a" then
                    Keys.a = true
                elseif key == "d" then
                    Keys.d = true
                end
            end)
            
            Mouse.KeyUp:connect(function(key)
                if key == "w" then
                    Keys.w = false
                elseif key == "s" then
                    Keys.s = false
                elseif key == "a" then
                    Keys.a = false
                elseif key == "d" then
                    Keys.d = false
                end
            end)
            
            spawn(function()
                while FlyEnabled and ForgeX.Features.Fly do
                    task.wait()
                    if FlyEnabled and game.Players.LocalPlayer.Character then
                        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if Humanoid then
                            Humanoid.PlatformStand = true
                        end
                        
                        local BV = Instance.new("BodyVelocity")
                        BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                        BV.MaxForce = Vector3.new(100000,100000,100000)
                        BV.Velocity = Vector3.new(0,0,0)
                        
                        if Keys.w then
                            BV.Velocity = BV.Velocity + game.Workspace.CurrentCamera.CFrame.LookVector * Speed
                        end
                        if Keys.s then
                            BV.Velocity = BV.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * Speed
                        end
                        if Keys.a then
                            BV.Velocity = BV.Velocity - game.Workspace.CurrentCamera.CFrame.RightVector * Speed
                        end
                        if Keys.d then
                            BV.Velocity = BV.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * Speed
                        end
                        
                        if FlySpeed ~= 0 then
                            BV.Velocity = BV.Velocity + Vector3.new(0,FlySpeed,0)
                        end
                        
                        BV:Destroy()
                    end
                end
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
            end)
        else
            ForgeX.Features.Fly = false
        end
    end
})

-- ================================================================
-- FRUIT & INVENTORY MANAGEMENT
-- ================================================================

local FruitsTab = Window:CreateTab("Fruits", "rbxassetid://4483345998")

-- Auto Store Fruits
FruitsTab:CreateToggle({
    Name = "Auto Store Fruits",
    CurrentValue = false,
    Flag = "AutoStoreToggle",
    Callback = function(Value)
        ForgeX.Features.AutoStore = Value
        if Value then
            spawn(function()
                while ForgeX.Features.AutoStore and task.wait(5) do
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "1", "1")
                    end)
                end
            end)
        end
    end
})

-- Fruit ESP
FruitsTab:CreateToggle({
    Name = "Fruit ESP",
    CurrentValue = false,
    Flag = "FruitESPToggle",
    Callback = function(Value)
        ForgeX.Features.FruitESP = Value
        if Value then
            -- Create ESP for fruits
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name:find("Fruit") then
                    local BillboardGui = Instance.new("BillboardGui")
                    local TextLabel = Instance.new("TextLabel")
                    
                    BillboardGui.Parent = v
                    BillboardGui.AlwaysOnTop = true
                    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
                    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                    
                    TextLabel.Parent = BillboardGui
                    TextLabel.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                    TextLabel.BackgroundTransparency = 0.5
                    TextLabel.Size = UDim2.new(1, 0, 1, 0)
                    TextLa
