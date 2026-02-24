-- xaiku dep trai

local u1 = loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol'))()
local _ = task.wait
local _ = task.wait
local _HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local _LocalPlayer = game.Players.LocalPlayer

_LocalPlayer:GetMouse()

local _ = game:GetService('Workspace').CurrentCamera
local _Players = game.Players
local _Remotes = game.ReplicatedStorage.Remotes
local _Character = _Players.LocalPlayer.Character
local _RunService = game:GetService('RunService')

function bliocke(p8, p9)
    game.StarterGui:SetCore('SendNotification', {
        Title = 'Sheeps Softwares',
        Text = p8,
        Duration = p9,
        Icon = 'rbxassetid://11510461364',
    })
end

local v10, v11, v12 = pairs(game.Players:GetPlayers())
local v13 = {}

while true do
    local v14

    v12, v14 = v10(v11, v12)

    if v12 == nil then
        break
    end
    if v14 ~= _LocalPlayer then
        table.insert(v13, v14.Name)
    end
end

getgenv().playertotp = 'ed'
getgenv().WaitTime = 0.1

function fornewplayerbatuastupid()
    local v15 = {
        {
            Image = 'rbxassetid://519863145',
            Index = 1,
            Cost = 150,
            ImageColor = Color3.fromRGB(255, 89.00000229477882, 92.00000211596489),
            TransparentImage = 'rbxassetid://532658156',
            Name = 'Fire',
        },
    }

    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('UnlockElement'):InvokeServer(unpack(v15))
    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('SendLoadout'):FireServer(unpack({{}}))
    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('UnlockSpell'):InvokeServer(unpack({
        'Fire',
        'Great Fire Blast',
    }))
end

if game.Players.LocalPlayer.leaderstats.Level.Value == 0 then
    fornewplayerbatuastupid()

    repeat
        task.wait()
    until game.Players.LocalPlayer.leaderstats.Level.Value ~= 1

    bliocke('tkake the spells pls', 15)
end

local v16 = u1
local v17 = u1.New(v16, {
    Name = 'Sheep software',
    FolderToSave = 'SolarisLibStuff',
})
local _Maintab = v17:Tab('Main tab')
local _XPAutofarm = _Maintab:Section('XP Autofarm')

_XPAutofarm:Toggle('Autofarm toggle', false, 'Toggle', function(p20)
    getgenv().aaa = p20

    while getgenv().aaa == true and task.wait() do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1103.98059, 269.954407, 2605.0293)

        task.wait(getgenv().WaitTime)
        _Remotes.DoClientMagic:FireServer('Fire', 'Consecutive Fire Bullets')
        _Remotes.DoMagic:InvokeServer('Fire', 'Consecutive Fire Bullets')
        task.wait(getgenv().WaitTime)
        _Remotes.DoClientMagic:FireServer('Fire', 'Great Fire Blast')
        _Remotes.DoMagic:InvokeServer('Fire', 'Great Fire Blast')

        if not getgenv().aaa then
            break
        end
    end
end)
_XPAutofarm:Slider('Task.wait time between autofarm ', 0, 10, 0, 0.1, 'Slider', function(p21)
    getgenv().WaitTime = p21
end)
_XPAutofarm:Button('Reset Task.Wait', function()
    getgenv().WaitTime = 0.1

    u1:Notification('Test', 'This is a notification test.')
end)

local _Shardsfarms = _Maintab:Section('Shards farms')

_Shardsfarms:Toggle('Shards farm', false, 'Toggle', function(p23)
    getgenv().Shardfarm = p23

    while getgenv().Shardfarm == true and task.wait(0.3) do
        _HumanoidRootPart.CFrame = game:GetService('Workspace')['.Ignore']['.ServerEffects']:WaitForChild('Shard').CFrame

        task.wait(getgenv().ShardWaitTime)

        if not getgenv().Shardfarm then
            break
        end
    end
end)
_Shardsfarms:Slider('Task.wait time between picking shards ', 0, 10, 0, 0.1, 'Slider', function(p24)
    getgenv().ShardWaitTime = p24
end)

local _Diamondsfarms = _Maintab:Section('Diamonds farms')

_Diamondsfarms:Toggle('Diamond farm', false, 'Toggle', function(p26)
    getgenv().DIamondfarm = p26

    while getgenv().DIamondfarm == true do
        task.wait(0.3)

        _HumanoidRootPart.CFrame = game:GetService('Workspace')['.Ignore']['.ServerEffects']:WaitForChild('Diamond').CFrame

        task.wait(getgenv().Diamondwaittime)

        if not getgenv().DIamondfarm then
            break
        end
    end
end)
_Diamondsfarms:Slider('Task.wait time between picking Diamond ', 0, 10, 0, 0.1, 'Slider', function(p27)
    getgenv().Diamondwaittime = p27
end)

local _Localwhoahsoscary = v17:Tab('Local shits'):Section('Local whoah ! so scary')

_Localwhoahsoscary:Toggle('Local speed', false, 'Toggle', function(p29)
    getgenv().localspeed = p29
end)
_Localwhoahsoscary:Bind('Speed hold bidne', Enum.KeyCode.LeftControl, true, 'BindHold', function(p30)
    getgenv().secondothing = p30
end)
_Localwhoahsoscary:Slider('Walkspeed multiplier', 0, 10, 0, 0.1, 'Slider', function(p31)
    getgenv().Walklspeedmultiplier = p31
end)
_Localwhoahsoscary:Toggle('Local jumpower', false, 'Toggle', function(p32)
    getgenv().jumowere = p32
end)
_Localwhoahsoscary:Slider('jumpower thigo', 0, 10, 0, 0.1, 'Slider', function(p33)
    getgenv().hjumpoerwepsed = p33
end)

local _Teleportstab = v17:Tab('Teleport shit'):Section('Teleports tab')

_Teleportstab:Button('1st security zone', function()
    _HumanoidRootPart.CFrame = CFrame.new(-974.399109, 72.2855911, 253.963303, -0.36351341, 5.61294478e-8, 0.931588948, 7.3153898900000005e-8, 1, -3.1706072400000003e-8, -0.931588948, 5.6623783e-8, -0.36351341)
end)
_Teleportstab:Button('2nd security zone', function()
    _HumanoidRootPart.CFrame = CFrame.new(-974.399109, 72.2855911, 253.963303, -0.36351341, 5.61294478e-8, 0.931588948, 7.3153898900000005e-8, 1, -3.1706072400000003e-8, -0.931588948, 5.6623783e-8, -0.36351341)
end)
_Teleportstab:Button('3th security zone', function()
    _HumanoidRootPart.CFrame = CFrame.new(-1476.5675, 37.550087, 1017.84674, -0.88744849, 5.4084775800000005e-8, -0.460906923, 3.40493522e-9, 1, 1.1078825e-7, 0.460906923, 9.674950260000001e-8, -0.88744849)
end)
_Teleportstab:Button('Center of the map', function()
    _HumanoidRootPart.CFrame = CFrame.new(-822.125916, 5.08547068, 834.755676, 0.559284866, 9.06218318e-8, 0.828975558, -4.85575704e-8, 1, -7.65575265e-8, -0.828975558, 2.56442889e-9, 0.559284866)
end)
_Teleportstab:Bind('Tp you in safe zone when pressed', Enum.KeyCode.F, false, 'BindNormal', function()
    _HumanoidRootPart.CFrame = CFrame.new(-974.399109, 72.2855911, 253.963303, -0.36351341, 5.61294478e-8, 0.931588948, 7.3153898900000005e-8, 1, -3.1706072400000003e-8, -0.931588948, 5.6623783e-8, -0.36351341)
end)
_Teleportstab:Dropdown('Player list to tp to', v13, '', 'Dropdown', function(p35)
    getgenv().playertotp = p35
end)
_Teleportstab:Button('tp to the player selected', function()
    _HumanoidRootPart.CFrame = _Players[playertotp].Character.HumanoidRootPart.CFrame
end)
_RunService.Heartbeat:Connect(function()
    if getgenv().jumowere then
        _Character.Humanoid.JumpPower = getgenv().hjumpoerwepsed
    end
    if getgenv().localspeed and getgenv().secondothing and (_LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and _Character.Humanoid.MoveDirection.Magnitude > 0) then
        for _ = 1, getgenv().Walklspeedmultiplier do
            _Character:TranslateBy(_Character.Humanoid.MoveDirection)
        end
    end
end)
