for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
    v:Disable()
end

for _,v in next, getconnections(game:GetService("LogService").MessageOut) do
    v:Disable()
end

local getupvalue = (getupvalue or debug.getupvalue);
local hookmetamethod = hookmetamethod or function(tbl, mt, func) return hookfunction(getrawmetatable(tbl)[mt], func) end;

repeat wait() until game:IsLoaded();
local players = game:GetService("Players");
local lplr = players.LocalPlayer;
local variables, mainEnv, encrypt;

do
    local banRemotes = {
        "FireToDieInstantly";
        "LoadString";
        "FlyRequest";
        "FinishTimeTrial";
        "UpdateDunceList";
        "FF";
        "okbye";
        "Fling";
        "ClientFling";
        "LCombo";
        "SubmitCombo";
        "GetCurrentCombo";
        "MaxCombo";
        "UpdateCombo";
        "SetTrail";
        "InsertTrail";
    }

    local hook
    hook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if (method == "FireServer" and table.find(banRemotes, self.Name)) then
            return
        end
        if (method == "InvokeServer" and table.find(banRemotes, self.Name)) then
            return
        end
        return hook(self, unpack(args))
    end))

    local old
    old = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if (key == "PlaybackLoudness" and getfenv(2).script.Name == "RadioScript") then
            return 0;
        end

        return old(self, key);
    end))
    
    local function onCharacterAdded(char)
        if (not char)  then return end
        wait(1)
        local Main = lplr.Backpack:WaitForChild("Main")
        variables = getupvalue(getsenv(Main).charJump, 1)
        variables.adminLevel = 13
        getfenv().script = Main
        mainEnv = getsenv(Main)
        main = getupvalue(getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).resetAmmo, 1)
        encrypt = function(string)
            local _, res = pcall(mainEnv.encrypt, string)
            return res
        end
    end
    onCharacterAdded(lplr.Character);
    lplr.CharacterAdded:Connect(onCharacterAdded);
end

local Settings = {
    autofarm = false,
    autocombo = false,
    combolvl = 1,
    Nofall = false,
    Slidespeed = false,
    slidevalue = 1,
    chargecooldown = false,
    infwallboost = false,
    infwallrun = false,
    trickpass = false,
    reset = false,
    resetvalue = 10000,
    flow = false,
    stimeject = false,
    autoquest = false,
    infglidestamina = false,
    walkspeedvalue = 1,
    walkspeedtoggle = false,
    infdrink = false,
    AntiCombobreak = false,
    AntiComboSubtract = false,
}

local foundSupportedFolder = false

local Support = {
    general29 = false,
    general11 = false,
    general9 = false,
    general17 = false,
    general41 = false,
    general4 = false,
    general16 = false,
    general13 = false,
    general45 = false,
    general1 = false,
    general23 =false,
    general54 = false,
}

local SupportedMission = {
    general29 = function()
        if Support.general29 then
            Library:Notify("Doing: Break a leg", 5)
            for i = 1, 15 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("landms", math.random(50, 75))
             end
        end
    end,
    general11 = function()
        if Support.general11 then
            Library:Notify("Doing: Dropper", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("damage", 0, 85)
        end
    end,
    general9 = function()
        if Support.general9 then
            Library:Notify("Doing: Quick fingers", 5)
            for i = 1, 15 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("boost", math.random(50.1, 85))
            end
        end
    end,
    general17 = function()
        if Support.general17 then
            Library:Notify("Doing: Boost master", 5)
            for i = 1,55 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("boost", 100)
            end
        end
    end,
    general41 = function()
        if Support.general41 then
            Library:Notify("Doing: Luck landing", 5)
            for i = 1,30 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("pLand")
            end
        end
    end,
    general4 = function()
        if Support.general4 then
            Library:Notify("Doing: Combo Legend", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("combobreak", 5, 5)
        end
    end,
    general16 = function()
        if Support.general16 then
            Library:Notify("Doing: Push your limits", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("general16", 8)
        end
    end,
    general13 = function()
        if Support.general13 then
            Library:Notify("Doing: Highrider", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("zipline", math.random(850 ,1000))
        end
    end,
    general45 = function()
        if Support.general45 then
            Library:Notify("Doing: Lax to Chi", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("general45")
        end
    end,
    general1 = function()
        if Support.general1 then
            Library:Notify("Doing: Combo Breaker", 5)
            getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("combobreak", 2, 2)
        end
    end,
    general23 = function()
        if Support.general23 then
            Library:Notify("Doing: Vaultist", 5)
            for i = 1, 105 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("vault")
            end
        end
    end,
    general54 = function()
        if Support.general54 then
            Library:Notify("Doing: Deep n Damp", 5)
            for i = 1, 255 do
                getsenv(game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Main")).fireMissionTrigger("dampen")
            end
        end
    end,
}

local function reset()
    for _,v in pairs(game:GetService("ReplicatedStorage").PlayerRuntimeData[lplr.Name]:GetDescendants()) do
        if v.Name ~= Support[v.Name] then
            game:GetService("ReplicatedStorage").MissionReroll:FireServer(v.Name)
            task.wait(0.1)
        end
    end
end

task.spawn(function()
    while task.wait() do
        if Settings.flow then
            main.flowActive = true
            main.flowAlpha = 100
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.reset then
            if lplr.leaderstats.Points.Value >= Settings.resetvalue then
                game:GetService("ReplicatedStorage").Reset:InvokeServer()
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.trickpass then
            main.hasTricksPass = Settings.trickpass
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.infwallboost then
            main.numWallclimb = math.huge
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.infdrink then
            main.lastDrink = 0
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.infwallrun then
            main.numWallrun = math.huge
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.autocombo then
            main.comboLevel = Settings.combolvl
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.Slidespeed then
            main.slidespeed = Settings.slidevalue
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.walkspeedtoggle then
            main.walkspeedMult = Settings.walkspeedvalue
        elseif not Settings.walkspeedtoggle then
            main.walkspeedMult = 1
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.AntiCombobreak then
            main.comboHealth = math.huge
        else
            local originalValue = main.comboHealth
            main.comboHealth = originalValue
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.AntiComboSubtract then
            local originalValue = main.comboXp
            local newValue = main.comboXp
            main.timeBelowSpeed = 0
            main.timeStopped = 0
            main.timeSlow = 0
            if newValue >= originalValue then
                main.comboXp = newValue
            end
        else
            local originalValue = main.comboXp
            main.comboXp = originalValue
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.chargecooldown then
            main.chargeCooldown = 0
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.infglidestamina then
            main.glideStamina = math.huge
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.autoquest then
            for _,v in pairs(game:GetService("ReplicatedStorage").PlayerRuntimeData[lplr.Name]:GetDescendants()) do
                if v.ClassName == "Folder" and Support[v.name] ~= nil then
                    Support[v.name] = true
                    SupportedMission[v.name]()
                    repeat task.wait() until not v:FindFirstChild("DisplayName")
                        foundSupportedFolder = false
                end
            end
            if not foundSupportedFolder then
                reset()
            end
        elseif not Settings.autoquest then
            foundSupportedFolder = false
        end
    end
end)

local Nofall
Nofall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if (method == "TakeDamage" and self.ClassName == "Humanoid") and Settings.Nofall then
        return
    end
    return Nofall(self, unpack(args))
end))

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Parkour',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Player = Tabs.Main:AddLeftGroupbox('Player')
local Remove = Tabs.Main:AddLeftGroupbox('Remove')
local Exp = Tabs.Main:AddRightGroupbox('Exp')
local Inf = Tabs.Main:AddRightGroupbox('inf')
local Combo = Tabs.Main:AddRightGroupbox('Combo')
local Other = Tabs.Main:AddLeftGroupbox('Other')

Combo:AddToggle('ComboToggle', {
    Text = 'Combo',
    Default = false,
    Tooltip = 'Toggles the combo feature',
})

Toggles.ComboToggle:OnChanged(function()
    Settings.autocombo = Toggles.ComboToggle.Value
end)

Combo:AddSlider('Combo', {
    Text = 'Combo lvl',
    Default = 1,
    Min = 0,
    Max = 5,
    Rounding = 0,
    Compact = false,
})

Options.Combo:OnChanged(function()
    Settings.combolvl = Options.Combo.Value
end)

Combo:AddToggle('ComboBreak', {
    Text = 'Anti Combo Break',
    Default = false,
    Tooltip = 'Toggles the Anti combo break feature',
})

Toggles.ComboBreak:OnChanged(function()
    Settings.AntiCombobreak = Toggles.ComboBreak.Value
end)

Combo:AddToggle('ComboSubtract', {
    Text = 'Anti Combo Subtract',
    Default = false,
    Tooltip = 'Toggles the Anti Combo Subtract feature',
})

Toggles.ComboSubtract:OnChanged(function()
    Settings.AntiComboSubtract = Toggles.ComboSubtract.Value
end)

Remove:AddToggle('Nofall', {
    Text = 'Remove fall Damage',
    Default = false,
    Tooltip = 'Toggles the No fall feature',
})

Toggles.Nofall:OnChanged(function()
    Settings.Nofall = Toggles.Nofall.Value
end)

Player:AddToggle('slideToggle', {
    Text = 'Slide speed',
    Default = false,
    Tooltip = 'toggles slide speed feature',
})

Toggles.slideToggle:OnChanged(function()
    Settings.Slidespeed = Toggles.slideToggle.Value
end)

Player:AddSlider('slideValue', {
    Text = 'slide speed value',
    Default = 34,
    Min = 34,
    Max = 1000,
    Rounding = 0,
    Compact = false,
})

Options.slideValue:OnChanged(function()
    Settings.slidevalue = Options.slideValue.Value
end)

Player:AddToggle('speedtogle', {
    Text = 'walkspeed toggle',
    Default = false,
    Tooltip = 'toggles walkspeed feature',
})

Toggles.speedtogle:OnChanged(function()
    Settings.walkspeedtoggle = Toggles.speedtogle.Value
end)

Player:AddSlider('runvalue', {
    Text = 'walkspeed value',
    Default = 1,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
})

Options.runvalue:OnChanged(function()
    Settings.walkspeedvalue = Options.runvalue.Value
end)

Remove:AddToggle('Charge', {
    Text = 'Remove charge cooldown',
    Default = false,
    Tooltip = 'Toggles the no charge feature',
})

Toggles.Charge:OnChanged(function()
    Settings.chargecooldown = Toggles.Charge.Value
end)

Inf:AddToggle('wallboost', {
    Text = 'inf wallboost',
    Default = false,
    Tooltip = 'Toggles the inf wallboost feature',
})

Toggles.wallboost:OnChanged(function()
    Settings.infwallboost = Toggles.wallboost.Value
end)

Inf:AddToggle('wallrun', {
    Text = 'inf wallrun',
    Default = false,
    Tooltip = 'Toggles the inf wallrun feature',
})

Toggles.wallrun:OnChanged(function()
    Settings.infwallrun = Toggles.wallrun.Value
end)

Player:AddToggle('tricking', {
    Text = 'freerunnning pass',
    Default = false,
    Tooltip = 'gives freerunning pass features',
})

Toggles.tricking:OnChanged(function()
    Settings.trickpass = Toggles.tricking.Value
end)

local moves = {"dropdown","longjump"}

local MyButton = Exp:AddButton('AutoFarm', function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if lplr.PlayerScripts:FindFirstChild("Points") and getsenv(lplr.Backpack.Main) then
            local points = getsenv(lplr.PlayerScripts.Points);
            points.changeParkourRemoteParent(workspace);
            local Remote = getupvalue(points.changeParkourRemoteParent, 2);
    
            Remote:FireServer(encrypt("longjump"), {[encrypt("combo")] = encrypt(tostring(5))})
            Remote:FireServer(encrypt("dropdown"), {[encrypt("combo")] = encrypt(tostring(5))})
            Remote:FireServer(encrypt(moves[#moves]), {[encrypt("combo")] = encrypt(tostring(1.7976931348623157e+308))})
        end
    end)
end)

Exp:AddToggle('Reset', {
    Text = 'Auto turn in points',
    Default = false,
    Tooltip = 'it turns in your points automatic', 
})

Toggles.Reset:OnChanged(function()
    Settings.reset = Toggles.Reset.Value
end)

Exp:AddSlider('Resetvalue', {
    Text = 'Points value',
    Default = 10000,
    Min = 10000,
    Max = 10000000,
    Rounding = 0,
    Compact = false,
})

Options.Resetvalue:OnChanged(function()
    Settings.resetvalue = Options.Resetvalue.Value
end)

Exp:AddToggle('flow', {
    Text = 'flow',
    Default = false,
    Tooltip = 'toggles flow', 
})

Toggles.flow:OnChanged(function()
    Settings.flow = Toggles.flow.Value
end)

Exp:AddToggle('quest', {
    Text = 'Auto Mission',
    Default = false,
    Tooltip = 'Toggles the auto mission feature',
})

Toggles.quest:OnChanged(function()
    Settings.autoquest = Toggles.quest.Value
end)

Inf:AddToggle('glide', {
    Text = 'inf glide stamina',
    Default = false,
    Tooltip = 'Toggles the inf glide stamina feature',
})

Toggles.glide:OnChanged(function()
    Settings.infglidestamina = Toggles.glide.Value
end)

Remove:AddToggle('drink', {
    Text = 'Remove Drink cooldown',
    Default = false,
    Tooltip = 'Toggles the No drink cooldown feature',
})

Toggles.drink:OnChanged(function()
    Settings.infdrink = Toggles.drink.Value
end)

Player:AddLabel('Ammo Reset'):AddKeyPicker('ammoreset', {
    Default = 'F',
    SyncToggleState = false, 
    Mode = 'Hold',
    Text = 'Reset Ammo',
    NoUI = false,
})

task.spawn(function()
    while task.wait() do
        local state = Options.ammoreset:GetState()
        if state then
            getsenv(lplr.Backpack:WaitForChild("Main")).resetAmmo()
        end

        if Library.Unloaded then break end
    end
end)

--Misc tab--

local MyButton = Other:AddButton('Unlock all spawns', function()
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.ClassName == "SpawnLocation" then
            lplr.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(1)
        end
    end
end)

local MyButton = Other:AddButton('Unlock Badges', function()
    for i, v in next, workspace:GetChildren() do
        if (v.Name ~= "BadgeAwarder" or not lplr.Character) then continue end;
        local part = v:FindFirstChildWhichIsA("Part");
        firetouchinterest(lplr.Character.HumanoidRootPart, part, 1);
        firetouchinterest(lplr.Character.HumanoidRootPart, part, 0);
    end;
end)


--settings
Library:SetWatermark('Parkour By Hydra#8270')

Library:OnUnload(function()
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

MenuGroup:AddToggle('keybindframe', {
    Text = 'Keybind Frame',
    Default = false,
    Tooltip = 'Toggles KeybindFrame',
})

Toggles.keybindframe:OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.keybindframe.Value
end)

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])