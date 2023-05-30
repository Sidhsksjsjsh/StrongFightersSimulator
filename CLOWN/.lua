-- game name: Strong Fighters Simulator in roblox

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "Strong Fighters Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Farm",
Icon = "rbxassetid://9073052584",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://9073052584",
PremiumOnly = false
})

local Egg = {}

for _,I in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
  table.insert(Egg, I.Name)
end

local NPC = {}

for _,U in pairs(game:GetService("Workspace").NPC:GetChildren()) do
  table.insert(NPC, U.Name)
end

local trigger_ = {}

function AttackTarget(name, trigger)
  game:GetService("ReplicatedStorage").Network.Punch:FireServer(name, trigger)
end

function punch()
  game:GetService("ReplicatedStorage").Network.Punch:FireServer()
end

function stage()
  game:GetService("ReplicatedStorage").Network.BuyStage:FireServer()
end

function equipbat()
  game:GetService("ReplicatedStorage").Network.EquipBestBat:FireServer()
end

function equippet()
  game:GetService("ReplicatedStorage").Network.EquipBestPets:FireServer()
end

function hatch(name)
  game:GetService("ReplicatedStorage").Network.OpenEgg:InvokeServer(name, "Single")
end

T1:AddDropdown({
    Name = "Select NPC name",
    Default = "?",
    Options = NPC,
    Callback = function(Value)
      _G.NPCtrigger = Value
   end
})

T1:AddToggle({
    Name = "Auto Kill",
    Default = false,
    Callback = function(val)
        _G.Self = val
         while wait() do
        if _G.Self == false then break end
        for _,X in pairs(game:GetService("Workspace").NPC[_G.NPCtrigger]:GetChildren()) do
            table.insert(trigger_, X.Name)
        end
        
        local randomizer = trigger_[math.random(1, #trigger_)]
        AttackTarget(_G.NPCtrigger,randomizer)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").NPC[_G.NPCtrigger][randomizer].CFrame)
      end
  end
})
  
T1:AddToggle({
    Name = "Auto Punch",
    Default = false,
    Callback = function(val)
        _G.P = val
         while wait() do
        if _G.P == false then break end
        punch()
      end
  end
})
    
T1:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(val)
        _G.R = val
         while wait() do
        if _G.R == false then break end
        stage()
      end
  end
})
      
T1:AddToggle({
    Name = "Auto Equip best bat",
    Default = false,
    Callback = function(val)
        _G.BB = val
         while wait() do
        if _G.BB == false then break end
        equipbat()
      end
  end
})

T2:AddDropdown({
    Name = "Select Egg",
    Default = "?",
    Options = Egg,
    Callback = function(Value)
      _G.EggName = Value
   end
})

T2:AddToggle({
    Name = "Auto Hatch",
    Default = false,
    Callback = function(val)
        _G.VU = val
         while wait() do
        if _G.VU == false then break end
        hatch(_G.EggName)
      end
  end
})

T2:AddToggle({
    Name = "Auto Equip best pet",
    Default = false,
    Callback = function(val)
        _G.BP = val
         while wait() do
        if _G.BP == false then break end
        equippet()
      end
  end
})
