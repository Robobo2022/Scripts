local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hydra Network | Prison life", HidePremium = false, IntroText = "Prison Life", SaveConfig = true, ConfigFolder = "OrionTest"})

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddDropdown({
	Name = "Gun",
	Default = "Choose Weapon",
	Options = {"M9", "AK-47", "M4A1", "Remington 870"},
	Callback = function(Value)
		game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Value].ITEMPICKUP)
	end    
})

MainTab:AddDropdown({
	Name = "Melee",
	Default = "Choose Weapon",
	Options = {"Hammer", "Crude Knife"},
	Callback = function(Value)
		local args = {
			[1] = workspace.Prison_ITEMS.single[Value].ITEMPICKUP}
		workspace.Remote.ItemHandler:InvokeServer(unpack(args))
	end    
})

local TargetWalkspeed
PlayerTab:AddSlider({
	Name = "Speed (MoveDirection)",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walk Speed",
	Callback = function(Value)
		TargetWalkspeed = Value
	end   
})


PlayerTab:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 500,
	Default = 50.145,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
    end
})

PlayerTab:AddSlider({
	Name = "Hip Height",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Hip Height",
	Callback = function(JumpHeight)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = JumpHeight
    end
})

PlayerTab:AddSlider({
	Name = "Fov Slider",
	Min = 1,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Fov",
	Callback = function(Fov)
        game:GetService'Workspace'.Camera.FieldOfView = Fov
    end
})

PlayerTab:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 196.2,
	Default = 196.2,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Gravity)
        Workspace.Gravity = Gravity
    end
})

PlayerTab:AddSlider({
	Name = "Day & night Slider",
	Min = 0,
	Max = 24,
	Default = 14,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	ValueName = "Time",
	Callback = function(Time)
        game.Lighting.ClockTime = Time
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/500)
        end
    end)
end)