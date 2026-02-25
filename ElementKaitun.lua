
_G.AutoFarm = {

    AutoClickMenu = false,
    

    AutoServerHop = true,
    HopTime = 30, 


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

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
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
local function ServerHop()
    sendNotification('Server Hop', 'Đang tìm server mới để chuyển...', 5)
    local PlaceId = game.PlaceId
    local JobId = game.JobId
    
    local success, result = pcall(function()
        return game:HttpGet("https://games.roblox.com/v1/games/" .. tostring(PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100")
    end)
    
    if success then
        local data = HttpService:JSONDecode(result)
        if data and data.data then
            local availableServers = {}
            for _, v in pairs(data.data) do
          
                if type(v) == "table" and v.playing and v.maxPlayers and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(availableServers, v.id)
                end
            end
            
            if #availableServers > 0 then
              
                local randomServer = availableServers[math.random(1, #availableServers)]
                TeleportService:TeleportToPlaceInstance(PlaceId, randomServer, LocalPlayer)
            else
                sendNotification('Server Hop', 'Không tìm thấy server phù hợp. Thử lại sau.', 5)
            end
        end
    else
        sendNotification('Server Hop', 'Lỗi khi lấy dữ liệu server!', 5)
    end
end


task.spawn(function()
    local timeElapsed = 0
    while task.wait(1) do 
        if _G.AutoFarm.AutoServerHop then
            timeElapsed = timeElapsed + 1
            if timeElapsed >= (_G.AutoFarm.HopTime * 60) then
                timeElapsed = 0 -- Reset bộ đếm
                ServerHop()
            end
        else
            timeElapsed = 0
        end
    end
end)




if _G.AutoFarm.AutoClickMenu then
    task.spawn(function()
        task.wait(0.5) 
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
    end)
end


task.spawn(function()
    while task.wait() do
        if _G.AutoFarm.XP then
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
               
                character.HumanoidRootPart.CFrame = CFrame.new(-1954, 100, 828)
                
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
