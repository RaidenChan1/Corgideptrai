-- ==========================================

-- ==========================================
_G.AutoFarm = {

    XP = false,
    WaitTime = 0.1,
    
    Shard = false,
    ShardWaitTime = 0.5,
    
    Diamond = false,
    DiamondWaitTime = 0.5,
    
    
    LocalSpeed = false,
    WalkSpeedMultiplier = 2,
    
    LocalJumpPower = false,
    JumpPowerAmount = 100
}

-- ==========================================

-- ==========================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- ==========================================
-- NOTIFICATION FUNCTION
-- ==========================================
local function sendNotification(title, text, duration)
    game.StarterGui:SetCore('SendNotification', {
        Title = title,
        Text = text,
        Duration = duration,
        Icon = 'rbxassetid://11510461364',
    })
end

-- ==========================================
-- AUTO SETUP FOR NEW PLAYERS (LEVEL 0)
-- ==========================================
local function setupNewPlayer()
    local v15 = {
        {
            Image = 'rbxassetid://519863145',
            Index = 1,
            Cost = 150,
            ImageColor = Color3.fromRGB(255, 89, 92),
            TransparentImage = 'rbxassetid://532658156',
            Name = 'Fire',
        }
    }
    Remotes:WaitForChild('UnlockElement'):InvokeServer(unpack(v15))
    Remotes:WaitForChild('SendLoadout'):FireServer(unpack({{}}))
    Remotes:WaitForChild('UnlockSpell'):InvokeServer(unpack({'Fire', 'Great Fire Blast'}))
end

if LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Level").Value == 0 then
    setupNewPlayer()
    repeat task.wait() until LocalPlayer.leaderstats.Level.Value ~= 1
    sendNotification('Sheeps Softwares', 'Take the spells pls', 15)
end

-- ==========================================
-- FARMING LOOPS
-- ==========================================

-- 1. XP AutoFarm Loop
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm.XP then
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(-1103.98059, 269.954407, 2605.0293)
                
                task.wait(_G.AutoFarm.WaitTime)
                Remotes.DoClientMagic:FireServer('Fire', 'Consecutive Fire Bullets')
                Remotes.DoMagic:InvokeServer('Fire', 'Consecutive Fire Bullets')
                
                task.wait(_G.AutoFarm.WaitTime)
                Remotes.DoClientMagic:FireServer('Fire', 'Great Fire Blast')
                Remotes.DoMagic:InvokeServer('Fire', 'Great Fire Blast')
            end
        end
    end
end)

-- 2. Shards AutoFarm Loop
task.spawn(function()
    while task.wait(0.3) do
        if _G.AutoFarm.Shard then
            local character = LocalPlayer.Character
            local shard = Workspace:FindFirstChild(".Ignore") 
                and Workspace[".Ignore"]:FindFirstChild(".ServerEffects") 
                and Workspace[".Ignore"][".ServerEffects"]:FindFirstChild("Shard")
                
            if character and character:FindFirstChild("HumanoidRootPart") and shard then
                character.HumanoidRootPart.CFrame = shard.CFrame
                task.wait(_G.AutoFarm.ShardWaitTime)
            end
        end
    end
end)

-- 3. Diamonds AutoFarm Loop
task.spawn(function()
    while task.wait(0.3) do
        if _G.AutoFarm.Diamond then
            local character = LocalPlayer.Character
            local diamond = Workspace:FindFirstChild(".Ignore") 
                and Workspace[".Ignore"]:FindFirstChild(".ServerEffects") 
                and Workspace[".Ignore"][".ServerEffects"]:FindFirstChild("Diamond")
                
            if character and character:FindFirstChild("HumanoidRootPart") and diamond then
                character.HumanoidRootPart.CFrame = diamond.CFrame
                task.wait(_G.AutoFarm.DiamondWaitTime)
            end
        end
    end
end)

-- ==========================================

-- ==========================================
RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    
    -- Local JumpPower
    if _G.AutoFarm.LocalJumpPower and humanoid then
        humanoid.JumpPower = _G.AutoFarm.JumpPowerAmount
    end
    
    -- Local Speed
    if _G.AutoFarm.LocalSpeed and hrp and humanoid and humanoid.MoveDirection.Magnitude > 0 then
        for _ = 1, _G.AutoFarm.WalkSpeedMultiplier do
            character:TranslateBy(humanoid.MoveDirection)
        end
    end
end)
