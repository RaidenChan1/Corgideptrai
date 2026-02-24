

_G.AutoFarm = {

   

    AutoClickMenu = true,

    


    XP = true,

    WaitTime = 0.1,

    

    Shard = true,

    ShardWaitTime = 0.5,

    

    Diamond = true,

    DiamondWaitTime = 0.5,

    



    LocalSpeed = false,

    WalkSpeedMultiplier = 2,

    

    LocalJumpPower = false,

    JumpPowerAmount = 100

}





local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local RunService = game:GetService("RunService")

local Workspace = game:GetService("Workspace")

local VirtualInputManager = game:GetService("VirtualInputManager")





local function getSafeZoneCFrame()

    local safeZoneName = "MySkySafeZone"

    local safePart = Workspace:FindFirstChild(safeZoneName)

    

    

    if not safePart then

        safePart = Instance.new("Part")

        safePart.Name = safeZoneName

        safePart.Size = Vector3.new(50, 2, 50) 

        safePart.Position = Vector3.new(0, 10000, 0) 

        safePart.Anchored = true

        safePart.CanCollide = true

        safePart.Transparency = 0.5 -- Hơi trong suốt

        safePart.Parent = Workspace

    end

    

    -- Trả về CFrame nằm ngay trên cái bục

    return CFrame.new(0, 10003, 0)

end



local safeZoneCFrame = getSafeZoneCFrame()



local function sendNotification(title, text, duration)

    game.StarterGui:SetCore('SendNotification', {

        Title = title,

        Text = text,

        Duration = duration,

        Icon = 'rbxassetid://11510461364',

    })

end





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









task.spawn(function()

    while task.wait(0.5) do

        if _G.AutoFarm.AutoClickMenu then

          

            local playerGui = LocalPlayer:FindFirstChild("PlayerGui")

            if playerGui then

                local menu = playerGui:FindFirstChild("Menu")

                if menu then

                    local screen = menu:FindFirstChild("Screen")

                    if screen then

                        local centerPanel = screen:FindFirstChild("CenterPanel")

                        if centerPanel then

                            local button = centerPanel:FindFirstChild("Button")

                            

                            if button and button.Visible then

                                local absPos = button.AbsolutePosition

                                local absSize = button.AbsoluteSize

                                

                             

                                local clickX = absPos.X + (absSize.X / 2)

                                local clickY = absPos.Y + (absSize.Y / 2) + 36 



                           

                                VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, true, game, 1)

                                task.wait(0.05)

                                VirtualInputManager:SendMouseButtonEvent(clickX, clickY, 0, false, game, 1)

                            end

                        end

                    end

                end

            end

        end

    end

end)




task.spawn(function()

    while task.wait() do

        if _G.AutoFarm.XP then

            local character = LocalPlayer.Character

            if character and character:FindFirstChild("HumanoidRootPart") then

                -- Teleport lên Safe Zone trên không

                character.HumanoidRootPart.CFrame = safeZoneCFrame

                

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
