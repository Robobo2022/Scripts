local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Redbox 2", HidePremium = false, IntroText = "Hydra Network", SaveConfig = true, ConfigFolder = "OrionTest"})

getgenv().HeadSize = 10
getgenv().Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
        if Disabled then
        for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
        pcall(function()
        v.Character.HumanoidRootPart.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
        v.Character.HumanoidRootPart.Transparency = 0.7
        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
        v.Character.HumanoidRootPart.Material = "ForceField"
        v.Character.HumanoidRootPart.CanCollide = false
        end)
        end
        end
        end
        end)

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
	Name = "Local Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddBind({
	Name = "Inf Ammo (equipe Weapon before pressing)",
	Default = Enum.KeyCode.L,
	Hold = false,
	Callback = function()
        local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local m = require(Tool.toolSettings)
        game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(Tool)
        game:GetService("ReplicatedStorage").Assets.Remotes.syncAmmo:FireServer(1000000,1000000, Tool)
	end    
})

MainTab:AddButton({
	Name = "No Recoil",
	Callback = function()	
        local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local m = require(Tool.toolSettings)
        m.firingRecoilEnabled = false
  	end    
})

MainTab:AddSlider({
    Name = "Hitbox",
    Min = 0,
    Max = 100,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Head size",
    Callback = function(Value)
        HeadSize = Value
    end    
})

PlayerTab:AddSlider({
	Name = "Fov Slider",
	Min = 0,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Fov",
	Callback = function(Value)
		local amount = Value
        game:GetService'Workspace'.Camera.FieldOfView = amount
	end    
})


PlayerTab:AddSlider({
	Name = "Speed Slider",
	Min = 0,
	Max = 120,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Fov",
	Callback = function(Value)
        
	end    
})