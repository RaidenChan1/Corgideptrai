local po,ts = game:WaitForChild("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay"),game:GetService('TeleportService')
po.ChildAdded:connect(function(a)
if a.Name == 'ErrorPrompt' then

while wait(1) do pcall(function()
ts:Teleport(3237168)
end)
end

end
end)

repeat wait() until game:IsLoaded()
game.StarterGui:SetCore("SendNotification", {Title = "Wave Hub";Text = "Loading";Duration = 25;})
repeat task.wait() until game:IsLoaded()

_G.hjasfhjkaskjfgkhjafsgashjkgfaghjfsghfjas = true 
_G.ASJKDJSAKDASLKDSJKLDHEHRUIEIHHGF = true


local vu15 = request or http_request or (HttpPost or syn.request)
local vu38 = nil


local vu38 = nil
function AutoStore()
    local v39 = game:GetService("Players").LocalPlayer
    local v40 = {
        "Candy Fruit",
        "Gravity Fruit",
        "Rumble Fruit",
        "Magma Fruit",
        "Light Fruit",
        "Ope Fruit",
        "Venom Fruit",
        "Candy Fruit",
        "Hollow Fruit",
        "Chilly Fruit",
        "Gas Fruit",
        "Flare Fruit",
        "Smoke Fruit",
        "Sand Fruit",
        "Plasma Fruit",
        "Snow Fruit"
    }
    local v41 = {
        "Quake Fruit",
        "Dark Fruit",
        "Phoenix Fruit",
        "Vampire Fruit"
    }
    if not vu38 then
        vu38 = {}
        local v42, v43, v44 = pairs(game.workspace.UserData["User_" .. v39.UserId].Data:GetChildren())
        while true do
            local v45
            v44, v45 = v42(v43, v44)
            if v44 == nil then
                break
            end
            if v45:IsA("StringValue") and string.find(v45.Name, "StoredDF") then
                table.insert(vu38, v45)
            end
        end
    end
    local function v50()
        local v46, v47, v48 = pairs(vu38)
        while true do
            local v49
            v48, v49 = v46(v47, v48)
            if v48 == nil then
                break
            end
            if v49.Value == "None" then
                return v49
            end
        end
        return nil
    end
    local v51, v52, v53 = pairs(v39.Backpack:GetChildren())
    while true do
        local v54
        v53, v54 = v51(v52, v53)
        if v53 == nil then
            break
        end
        if v54:IsA("Tool") and (v50() and (v54:FindFirstChild("Main") and (table.find(v40, v54.Name) or (table.find(v41, v54.Name) or tonumber(string.split(v54:WaitForChild("Data").Value, ",")[6]) == 1)))) then
            v39.Character.Humanoid:EquipTool(v54)
            local v55 = v50()
            while v55.Value == "None" do
                task.wait()
                workspace.UserData["User_" .. v39.UserId].StoredDFRequest:FireServer(v55.Name)
            end
        end
    end
end
local vu56 = loadstring(game:HttpGet("https://raw.githubusercontent.com/skidboss/ok/main/dragkavoui"))()
local v57 = vu56.CreateLib("Wave Hub Version: 1.22 bug fix auto store", _G.colors)
local v58 = v57:NewTab("Sam"):NewSection("Sam")
local v59 = v57:NewTab("Drinks"):NewSection("Drinks")
local v60 = v57:NewTab("AutoFarms"):NewSection("AutoFarms")
local v61 = v57:NewTab("Players Related"):NewSection("Players Related")
local v62 = v57:NewTab("Haki"):NewSection("Haki Autofarm")
local vu63 = v57:NewTab("Affinity"):NewSection("Affinity (Rest Works In Vip Only)")
local v64 = v57:NewTab("Misc"):NewSection("Misc")
v57:NewTab(" "):NewSection(" ")
local vu65 = game:GetService("Workspace"):WaitForChild("UserData"):WaitForChild("User_" .. game.Players.LocalPlayer.UserId):WaitForChild("Data"):WaitForChild("DevilFruit")
local function vu67(p66)
    if p66 == "Light" then
        _G.TheFruit = "Light"
        _G.Skill = "Power2"
        _G.Delay = 0.125
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCrv"
    end
    if p66 == "Vampire" then
        _G.TheFruit = "Vampire"
        _G.Skill = "Power5"
        _G.Delay = 0.3
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCjwf"
    end
    if p66 == "Dark" then
        _G.TheFruit = "Dark"
        _G.Skill = "Power4"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCjebaj"
    end
    if p66 == "Magma" then
        _G.TheFruit = "Magma"
        _G.Skill = "Power1"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCmel"
    end
    if p66 == "Chilly" then
        _G.TheFruit = "Chilly"
        _G.Skill = "Power5"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCewddsfe"
    end
    if p66 == "Flare" then
        _G.TheFruit = "Flare"
        _G.Skill = "Power2"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCmgwcm"
    end
    if p66 == "Bomb" then
        _G.TheFruit = "Bomb"
        _G.Skill = "Power5"
        _G.Delay = 0.125
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCcpkghc"
    end
    if p66 == "Gas" then
        _G.TheFruit = "Gas"
        _G.Skill = "Power5"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCtb"
    end
    if p66 == "Rumble" then
        _G.TheFruit = "Rumble"
        _G.Skill = "Power3"
        _G.Delay = 0.125
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCzyhf"
    end
    if p66 == "Phoenix" then
        _G.TheFruit = "Phoenix"
        _G.Skill = "Power3"
        _G.Delay = 0.125
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCytb"
    end
    if p66 == "Gravity" then
        _G.TheFruit = "Gravity"
        _G.Skill = "Power4"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCjh"
    end
    if p66 == "Quake" then
        _G.TheFruit = "Quake"
        _G.Skill = "Power4"
        _G.Delay = 0.25
        _G.OutPut = 100
        _G.Range = 7.5
        _G.HarveyTrash = "VTCebvc"
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Fruit Detecting",
        Text = tostring(_G.TheFruit) .. " Detected",
        Duration = 5
    })
end
repeat
    wait()
until vu65.Value ~= nil
vu67(vu65.Value)
vu65:GetPropertyChangedSignal("Value"):Connect(function()
    vu67(vu65.Value)
end)
function Mobile()
    local vu68 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Menu"):WaitForChild("Frame"):WaitForChild("F")
    vu68.Text = "Wave Hub Gui"
    vu68.TextColor3 = Color3.new(0, 0, 255)
    vu68.BackgroundColor3 = Color3.new(0, 0, 0)
    local v69 = vu68
    vu68.GetPropertyChangedSignal(v69, "TextColor3"):Connect(function()
        vu68.TextColor3 = Color3.new(0, 0, 255)
    end)
    vu68.MouseButton1Click:Connect(function()
        vu56:ToggleUI()
    end)
end
Mobile()
game:GetService("Players").LocalPlayer.ChildAdded:Connect(function(p70)
    if p70.Name == "Backpack" then
        wait()
        Mobile()
    end
end)
v58:NewToggle("Sam Quest", "Quest", function(p71)
    if p71 then
        _G.quest = true
        while _G.quest do
            wait()
            workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim1")
        end
    else
        _G.quest = false
    end
end)
v58:NewButton("Tp Sam", "Tp sam", function()
    local v72 = game:GetService("Players").LocalPlayer
    local v73 = v72.Character.HumanoidRootPart.CFrame
    local v74 = game:GetService("Workspace").UserData["User_" .. v72.UserId].Data.CompassTokens.Value
    local v75 = game:GetService("Workspace").UserData["User_" .. v72.UserId].Data.CompassTokens
    local v76, v77, v78 = pairs(v72.Backpack:GetChildren())
    while true do
        local v79
        v78, v79 = v76(v77, v78)
        if v78 == nil then
            break
        end
        if v79.Name == "Compass" then
            v74 = v74 + 1
        end
    end
    while true do
        task.wait()
        workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim10")
        if v72.Character:FindFirstChild("Compass") then
            v72.Character:FindFirstChild("Compass").Parent = v72.Backpack
        end
        if v75.Value == 0 then
            for _ = 1, v74 do
                v72.Backpack:WaitForChild("Compass").Parent = v72.Character
                v72.Character:WaitForChild("Compass"):Activate()
                local v80 = v72.Character:WaitForChild("Compass"):WaitForChild("Poser").Value
                while v72.Character:FindFirstChild("Compass") do
                    task.wait()
                    v72.Character.HumanoidRootPart.CFrame = CFrame.new(v80)
                end
            end
            v72.Character.HumanoidRootPart.CFrame = v73
            return
        end
    end
end)
v58:NewToggle("Automatic Sam", "Tp sam automatic test", function(p81)
    if p81 then
        _G.Tpsam = true
        local vu82 = game:GetService("Players").LocalPlayer
        local vu83 = game:GetService("Workspace").UserData["User_" .. vu82.UserId].Data.CompassTokens
        while _G.Tpsam do
            wait()
            pcall(function()
                while true do
                    task.wait()
                    if vu82.Character:FindFirstChild("Compass") then
                        vu82.Character:FindFirstChild("Compass").Parent = vu82.Backpack
                    end
                    if vu82.Backpack:FindFirstChild("Compass") or (vu83.Value > 0 or _G.Tpsam == false) then
                        local v84 = vu82.Character.HumanoidRootPart.CFrame
                        local v85 = game:GetService("Workspace").UserData["User_" .. vu82.UserId].Data.CompassTokens.Value
                        local v86, v87, v88 = pairs(vu82.Backpack:GetChildren())
                        while true do
                            local v89
                            v88, v89 = v86(v87, v88)
                            if v88 == nil then
                                break
                            end
                            if v89.Name == "Compass" then
                                v85 = v85 + 1
                            end
                        end
                        while true do
                            task.wait()
                            workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim10")
                            if vu82.Character:FindFirstChild("Compass") then
                                vu82.Character:FindFirstChild("Compass").Parent = vu82.Backpack
                            end
                            if vu83.Value == 0 or _G.Tpsam == false then
                                for _ = 1, v85 do
                                    vu82.Backpack:WaitForChild("Compass").Parent = vu82.Character
                                    vu82.Character:WaitForChild("Compass"):Activate()
                                    local v90 = vu82.Character:WaitForChild("Compass"):WaitForChild("Poser").Value
                                    while vu82.Character:FindFirstChild("Compass") do
                                        task.wait()
                                        vu82.Character.HumanoidRootPart.CFrame = CFrame.new(v90)
                                    end
                                end
                                vu82.Character.HumanoidRootPart.CFrame = v84
                                return
                            end
                        end
                    end
                end
            end)
        end
    else
        _G.Tpsam = false
    end
end)
v58:NewButton("Tp Fruit", "Tps fruit", function()
    local v91, v92, v93 = pairs(game:GetService("Workspace").Trees:GetDescendants())
    while true do
        local v94
        v93, v94 = v91(v92, v93)
        if v93 == nil then
            break
        end
        if v94:IsA("ClickDetector") then
            fireclickdetector(v94)
        end
    end
end)
v58:NewToggle("Tp Fruit", "Toggle", function(p95)
    if p95 then
        _G.Tpfruit = true
        while _G.Tpfruit do
            task.wait()
            local v96, v97, v98 = pairs(game:GetService("Workspace").Trees.Tree:GetDescendants())
            while true do
                local v99
                v98, v99 = v96(v97, v98)
                if v98 == nil then
                    break
                end
                if v99:IsA("ClickDetector") then
                    fireclickdetector(v99)
                end
            end
        end
    else
        _G.Tpfruit = false
    end
end)
v58:NewToggle("Auto Rare/Ultra Store", "Auto Rare/Ultra store", function(p100)
    if p100 then
        _G.toggle = true
        local v101 = game:GetService("Players").LocalPlayer
        while _G.toggle do
            wait(0)
            local v102, v103, v104 = pairs(v101.Backpack:GetChildren())
            while true do
                local v105
                v104, v105 = v102(v103, v104)
                if v104 == nil then
                    break
                end
                if v105:IsA("Tool") and string.find(v105.Name, "Rare") then
                    v105.Parent = v101.Character
                    v105:Activate()
                end
            end
            AutoStore()
        end
    else
        _G.toggle = false
    end
end)
v58:NewButton("Safe place not water", "breh", function()
    game.Players.LocalPlayer.Character.Humanoid.Sit = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 20479, 215, - 20479)
    baseplatee = Instance.new("Part", workspace)
    baseplatee.Size = Vector3.new(1000000, 100, 1000000)
    baseplatee.CFrame = game.workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame + Vector3.new(0, - 2, 0)
    baseplatee.Anchored = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait(1)
end)
v58:NewButton("Notifier", "yes", function()
    local vu106 = game:GetService("Players")
    game:GetService("ReplicatedStorage")
    local v107 = vu106.LocalPlayer
    if not v107.Character then
        v107.CharacterAdded:Wait()
    end
    local vu108 = {
        "Plasma Fruit",
        "Gravity Fruit",
        "Rumble Fruit",
        "Magma Fruit",
        "Light Fruit",
        "Ope Fruit",
        "Venom Fruit",
        "Candy Fruit",
        "Hollow Fruit",
        "Chilly Fruit",
        "Gas Fruit",
        "Flare Fruit",
        "Smoke Fruit",
        "Sand Fruit"
    }
    local vu109 = {
        "Quake Fruit",
        "Dark Fruit",
        "Phoenix Fruit",
        "Vampire Fruit"
    }
    local vu110 = {
        "Rare Box",
        "Ultra Rare Box"
    }
    game.Players.PlayerAdded:Connect(function(p111)
        wait(5)
        local v112 = vu106
        local v113, v114, v115 = pairs(v112:GetPlayers())
        while true do
            local vu116
            v115, vu116 = v113(v114, v115)
            if v115 == nil then
                break
            end
            if vu116.Name == p111.Name then
                vu116.Backpack.ChildAdded:Connect(function(p117)
                    if p117:IsA("Tool") and table.find(vu108, p117.Name) or (table.find(vu109, p117.Name) or table.find(vu110, p117.Name)) then
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Fruit/Box Notifier",
                            Text = vu116.Name .. "|" .. p117.Name,
                            Duration = 50
                        })
                    end
                end)
            end
        end
    end)
    local v118, v119, v120 = pairs(vu106:GetPlayers())
    local vu121 = vu110
    local vu122 = vu109
    local vu123 = vu108
    while true do
        local vu124
        v120, vu124 = v118(v119, v120)
        if v120 == nil then
            break
        end
        if vu124.Name ~= v107.Name and vu124.UserId ~= v107.UserId then
            vu124.Backpack.ChildAdded:Connect(function(p125)
                if p125:IsA("Tool") and table.find(vu123, p125.Name) or (table.find(vu122, p125.Name) or table.find(vu121, p125.Name)) then
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Fruit/Box Notifier",
                        Text = vu124.Name .. "|" .. p125.Name,
                        Duration = 50
                    })
                end
            end)
        end
    end
end)
v59:NewDropdown("Select Drink", "DropdownInf", {
    "Cider+",
    "Juice+",
    "Smoothie+",
    "Lemonade+",
    "Cider",
    "Juice",
    "Smoothie",
    "Lemonade"
}, function(p126)
    _G.Choosed = p126
end)
v59:NewTextBox("Ammount of Drink", "TextboxInfo", function(p127)
    local v128 = tonumber(p127)
    if string.find(_G.Choosed, "+") then
        for _ = 1, v128 do
            task.wait()
            workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer(_G.Choosed)
        end
    end
    if not string.find(_G.Choosed, "+") then
        for _ = 1, v128 do
            task.wait()
            workspace.Merchants.DrinkMerchant.Clickable.Retum:FireServer(_G.Choosed)
        end
    end
end)
v59:NewButton("Auto Buy Drinks Math To Max", "Yes", function()
    local v129 = game:GetService("Players").LocalPlayer
    local v130 = v129.PlayerGui.Menu.Frame.C.Frame
    function calculate_exp(p131, p132)
        local function v134(p133)
            return 100 + p133 * 10
        end
        local v135 = 0
        for v136 = 1, 500 do
            v135 = v135 + v134(v136)
        end
        local v137 = 0
        for v138 = 1, p131 - 1 do
            v137 = v137 + v134(v138)
        end
        local v139 = v135 - (v137 + p132 / 100 * v134(p131))
        return math.floor(v139 + 0.5)
    end
    local v140 = game.Workspace.UserData["User_" .. v129.UserId].Data.DefenseLevel.Value
    local v141 = math.floor(v130.Defense.Frame.Frame.Min.Value / v130.Defense.Frame.Frame.Max.Value * 10000) / 100
    local v142 = game.Workspace.UserData["User_" .. v129.UserId].Data.MeleeLevel.Value
    local v143 = math.floor(v130.Melee.Frame.Frame.Min.Value / v130.Melee.Frame.Frame.Max.Value * 10000) / 100
    local v144 = game.Workspace.UserData["User_" .. v129.UserId].Data.SniperLevel.Value
    local v145 = math.floor(v130.Sniper.Frame.Frame.Min.Value / v130.Sniper.Frame.Frame.Max.Value * 10000) / 100
    local v146 = game.Workspace.UserData["User_" .. v129.UserId].Data.SwordLevel.Value
    local v147 = math.floor(v130.Sword.Frame.Frame.Min.Value / v130.Sword.Frame.Frame.Max.Value * 10000) / 100
    for _ = 1, math.floor(calculate_exp(v142, v143) / 2000 + 0.5) do
        workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer("Cider+")
    end
    for _ = 1, math.floor(calculate_exp(v140, v141) / 500 + 0.5) do
        workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer("Smoothie+")
    end
    for _ = 1, math.floor(calculate_exp(v144, v145) / 2000 + 0.5) do
        workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer("Lemonade+")
    end
    for _ = 1, math.floor(calculate_exp(v146, v147) / 2000 + 0.5) do
        workspace.Merchants.BetterDrinkMerchant.Clickable.Retum:FireServer("Juice+")
    end
end)
v59:NewToggle("Mixer", "Drinks", function(p148)
    if p148 then
        local vu149 = game:GetService("Players").LocalPlayer
        _G.AutoMixer = true
        spawn(function()
            repeat
                wait(1)
                pcall(function()
                    if vu149.Character.Humanoid.Sit == true then
                        vu149.Character.Humanoid.Jump = true
                    end
                end)
            until _G.AutoMixer == false
        end)
        spawn(function()
            while _G.AutoMixer do
                wait()
                pcall(function()
                    repeat
                        wait()
                    until vu149.Challenges.Frame.Frame.ChallengesFrame.ScrollingFrame.Challenge13.Claim.AutoButtonColor == true
                    workspace.UserData["User" .. vu149.UserId].ChallengesRemote:FireServer("Claim", "Challenge13")
                    workspace.UserData["User_" .. vu149.UserId].ChallengesRemote:FireServer("Claim", "Challenge14")
                end)
            end
        end)
        local v150, v151, v152 = pairs(game:GetService("Workspace").Barrels:GetDescendants())
        local vu153 = vu149
        local vu154 = {}
        while true do
            local v155
            v152, v155 = v150(v151, v152)
            if v152 == nil then
                break
            end
            if v155.Name == "Crate" or (v155.Name == "Barrel" or v155.Name == "Roller" and (v155:FindFirstChild("ClickDetector") and v155.Transparency == 0)) then
                table.insert(vu154, v155)
            end
        end
        function GetNearest()
            local v156, v157, v158 = pairs(vu154)
            while true do
                local v159
                v158, v159 = v156(v157, v158)
                if v158 == nil then
                    break
                end
                if v159.ClickDetector.MaxActivationDistance > 0 and (v159.Position - vu153.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    fireclickdetector(v159.ClickDetector)
                end
            end
        end
        while _G.AutoMixer do
            task.wait()
            pcall(function()
                local v160 = vu153.Character.HumanoidRootPart.CFrame
                local v161, v162, v163 = pairs(vu154)
                while true do
                    local v164
                    v163, v164 = v161(v162, v163)
                    if v163 == nil then
                        break
                    end
                    if v164.ClickDetector.MaxActivationDistance > 0 then
                        while v164.ClickDetector.MaxActivationDistance > 0 do
                            task.wait()
                            vu153.Character.HumanoidRootPart.CFrame = v164.CFrame + Vector3.new(0, 2.5, 0)
                            GetNearest()
                        end
                    end
                end
                local v165, v166, v167 = pairs(game:GetService("Workspace").Island8.Kitchen:GetDescendants())
                while true do
                    local v168
                    v167, v168 = v165(v166, v167)
                    if v167 == nil then
                        break
                    end
                    if v168:IsA("ClickDetector") then
                        fireclickdetector(v168)
                    end
                end
                vu153.Character.HumanoidRootPart.CFrame = v160
            end)
        end
    else
        _G.AutoMixer = false
    end
end)
v59:NewToggle("Drinking", "drinking", function(p169)
    if p169 then
        _G.Drinking = true
        while _G.Drinking do
            pcall(function()
                local v170 = game:GetService("Players").LocalPlayer
                local v171 = (v170.Character or v170.CharacterAdded:Wait()).Humanoid
                local v172, v173, v174 = pairs(v170.Backpack:GetChildren())
                while true do
                    local v175
                    v174, v175 = v172(v173, v174)
                    if v174 == nil then
                        break
                    end
                    if v175.Name == "Crab Toy" then
                        v175:Destroy()
                    end
                    if v175:IsA("Tool") and string.find(v175.Name, "Juice") or (string.find(v175.Name, "Milk") or (string.find(v175.Name, "Cider") or (string.find(v175.Name, "Lemonade") or (string.find(v175.Name, "Smoothie") or string.find(v175.Name, "Golden"))))) then
                        v171:EquipTool(v175)
                        v175:Activate()
                    end
                end
            end)
            task.wait(5)
        end
    else
        _G.Drinking = false
    end
end)
v59:NewButton("Click to Drink Them All", "sex", function()
    local v176 = game:GetService("Players").LocalPlayer
    local v177 = (v176.Character or v176.CharacterAdded:Wait()).Humanoid
    local v178, v179, v180 = pairs(v176.Backpack:GetChildren())
    while true do
        local v181
        v180, v181 = v178(v179, v180)
        if v180 == nil then
            break
        end
        if v181:IsA("Tool") and string.find(v181.Name, "Cider") or (string.find(v181.Name, "Juice") or (string.find(v181.Name, "Smoothie") or (string.find(v181.Name, "Lemonade") or string.find(v181.Name, "Milk")))) then
            v177:EquipTool(v181)
            repeat
                task.wait()
            until game.workspace["" .. v176.Name]:FindFirstChild(v181.Name)
            v181:Activate()
        end
    end
end)
v59:NewTextBox("Printer Data,Paste Webhook", "prints each (15 mins)", function(p182)
    tostring(game.Players.LocalPlayer.Name)
    local v183 = tostring(game.Players.LocalPlayer.UserId)
    spawn(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Wave Hub",
            Text = "Will Print Ur Data Each 30 Mins To The Webhook Server",
            Duration = 100
        })
    end)
    while task.wait(900) do
        local v184 = {
            content = ""
        }
        local v185 = {}
        local v186 = {
            title = "**Afk Grind**",
            description = "",
            type = "rich",
            color = tonumber(65535)
        }
        local v187 = {}
        local v188 = {
            name = "**Defense Level**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.DefenseLevel.Value,
            inline = true
        }
        local v189 = {
            name = "**Melee Level**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.MeleeLevel.Value,
            inline = true
        }
        local v190 = {
            name = "**Sniper Level**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.SniperLevel.Value,
            inline = true
        }
        local v191 = {
            name = "**Sword Level**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.SwordLevel.Value,
            inline = true
        }
        local v192 = {
            name = "**Haki Level**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.HakiLevel.Value,
            inline = true
        }
        local v193 = {
            name = "**Legendary**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.Legendary.Value,
            inline = true
        }
        local v194 = {
            name = "**Expertise Level**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.ExpertiseLevel.Value,
            inline = true
        }
        local v195 = {
            name = "**Current Expertise Mission**",
            value = "[" .. game:GetService("Workspace").UserData["User_" .. v183].Data.MissionDifficulty.Value .. "] " .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionObjective.Value .. " " .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionObjectiveTarget.Value .. " " .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionProgress.Value .. "/" .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionRequirement.Value,
            inline = true
        }
        local v196 = {
            name = "**Bounty**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.Bounty.Value,
            inline = true
        }
        local v197 = {
            name = "**Gems**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.Gems.Value,
            inline = true
        }
        local v198 = {
            name = "**Kills**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.Kills.Value,
            inline = true
        }
        local v199 = {
            name = "**Cash**",
            value = game:GetService("Workspace").UserData["User_" .. v183].Data.Cash.Value,
            inline = true
        }
        __set_list(v187, 1, {
            v188,
            v189,
            v190,
            v191,
            v192,
            v193,
            v194,
            v195,
            v196,
            v197,
            v198,
            v199,
            {
                name = "**Sam\'s Quest**",
                value = game.Players.LocalPlayer.PlayerGui.Menu.Frame.C.Frame.A.Sam.SamTimer.Text,
                inline = true
            }
        })
        v186.fields = v187
        __set_list(v185, 1, {
            v186
        })
        v184.embeds = v185
        local v200 = game:GetService("HttpService"):JSONEncode(v184)
        request = vu15 or request or (HttpPost or syn.request)
        request({
            Url = p182,
            Body = v200,
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json"
            }
        })
    end
end)
v59:NewToggle("Printer Data If You Afk (DC Wave Hub)", " EACH 15 MIN", function(p201)
    if p201 then
        tostring(game.Players.LocalPlayer.Name)
        local v202 = tostring(game.Players.LocalPlayer.UserId)
        _G.WBH = true
        spawn(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Wave Hub",
                Text = "Will Print Ur Data Each 30 Mins To The Webhook Server",
                Duration = 100
            })
        end)
        while _G.WBH do
            task.wait(900)
            local v203 = {
                content = ""
            }
            local v204 = {}
            local v205 = {
                title = "**Afk Grind**",
                description = "",
                type = "rich",
                color = tonumber(65535)
            }
            local v206 = {}
            local v207 = {
                name = "**Defense Level**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.DefenseLevel.Value,
                inline = true
            }
            local v208 = {
                name = "**Melee Level**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.MeleeLevel.Value,
                inline = true
            }
            local v209 = {
                name = "**Sniper Level**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.SniperLevel.Value,
                inline = true
            }
            local v210 = {
                name = "**Sword Level**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.SwordLevel.Value,
                inline = true
            }
            local v211 = {
                name = "**Haki Level**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.HakiLevel.Value,
                inline = true
            }
            local v212 = {
                name = "**Legendary**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.Legendary.Value,
                inline = true
            }
            local v213 = {
                name = "**Expertise Level**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.ExpertiseLevel.Value,
                inline = true
            }
            local v214 = {
                name = "**Current Expertise Mission**",
                value = "[" .. game:GetService("Workspace").UserData["User_" .. v202].Data.MissionDifficulty.Value .. "] " .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionObjective.Value .. " " .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionObjectiveTarget.Value .. " " .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionProgress.Value .. "/" .. game:GetService("Workspace").UserData["User_" .. Lp.UserId].Data.MissionRequirement.Value,
                inline = true
            }
            local v215 = {
                name = "**Bounty**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.Bounty.Value,
                inline = true
            }
            local v216 = {
                name = "**Gems**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.Gems.Value,
                inline = true
            }
            local v217 = {
                name = "**Kills**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.Kills.Value,
                inline = true
            }
            local v218 = {
                name = "**Cash**",
                value = game:GetService("Workspace").UserData["User_" .. v202].Data.Cash.Value,
                inline = true
            }
            __set_list(v206, 1, {
                v207,
                v208,
                v209,
                v210,
                v211,
                v212,
                v213,
                v214,
                v215,
                v216,
                v217,
                v218,
                {
                    name = "**Sam\'s Quest**",
                    value = game.Players.LocalPlayer.PlayerGui.Menu.Frame.C.Frame.A.Sam.SamTimer.Text,
                    inline = true
                }
            })
            v205.fields = v206
            __set_list(v204, 1, {
                v205
            })
            v203.embeds = v204
            local v219 = game:GetService("HttpService"):JSONEncode(v203)
            request = vu15 or request or (HttpPost or syn.request)
            request({
                Url = "https://discord.com/api/webhooks/1057391450641420360/sJOM733Sr2tjy2jOJOlhTMyqAEzdOYwbNQ6fTkjdd51qA-7Dc7FMJSiKz6EEM7OcqxMw",
                Body = v219,
                Method = "POST",
                Headers = {
                    ["content-type"] = "application/json"
                }
            })
        end
    else
        _G.WBH = false
    end
end)
v59:NewButton("Click To Auto Close Game if Max", "open console Prints ANAL if its enabled", function()
    print("ANAL ITS ENABLED")
    local v220 = tostring(game.Players.LocalPlayer.UserId)
    repeat
        wait()
    until game.workspace.UserData["User_" .. v220].Data.DefenseLevel.value == 500 and (game.workspace.UserData["User_" .. v220].Data.MeleeLevel.value == 500 and (game.workspace.UserData["User_" .. v220].Data.SniperLevel.value == 500 and game.workspace.UserData["User_" .. v220].Data.SwordLevel.value == 500))
    wait(15)
    game:shutdown()
end)
v59:NewButton("Safe Place", "ButtonInfo", function()
    baseplatee = Instance.new("Part", workspace)
    baseplatee.Size = Vector3.new(500, 1, 500)
    baseplatee.CFrame = CFrame.new(- 20479, 215, - 20479)
    baseplatee.Anchored = true
    local v221 = CFrame.new(- 20479, 216, - 20479)
    local v222 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0), {
        CFrame = v221
    })
    v222:Play()
    v222.Completed:Wait()
end)
v59:NewButton("Atlar tp", ":)", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Altar.Ring.CFrame
end)
vu63:NewButton("Manual Affinity ", "Spins affs", function()
    local v223, v224, v225 = pairs(game:GetService("Workspace").Merchants.AffinityMerchant:GetDescendants())
    while true do
        local v226
        v225, v226 = v223(v224, v225)
        if v225 == nil then
            break
        end
        if v226:IsA("ClickDetector") then
            fireclickdetector(v226)
        end
    end
end)
if game:GetService("Workspace"):WaitForChild("GlobalReference"):WaitForChild("Private").Value == false then
    vu63:NewButton("Enable it at your own risk", "ButtonInfo", function()
        _G.SpankMeDaddy = true
    end)
end
spawn(function()
    repeat
        wait()
    until game:GetService("Workspace").GlobalReference.Private.Value == true or _G.SpankMeDaddy == true
    local vu227 = game:GetService("Workspace").UserData["User_" .. game.Players.LocalPlayer.UserId].Data
    local vu228 = {
        vu227.DevilFruit.Value,
        vu227.DevilFruit2.Value
    }
    _G.DefenseLock = false
    _G.SwordLock = false
    _G.MeleeLock = false
    _G.SniperLock = false
    function gg()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Lucy The Whore",
            Text = "Gaved You " .. _G.gg,
            Duration = 250
        })
    end
    local vu230 = vu63:NewDropdown("DevilFruit", "DropdownInf", vu228, function(p229)
        if p229 == vu227.DevilFruit.Value then
            _G.DevilFruit = "DFT1"
        end
        if p229 == vu227.DevilFruit2.Value then
            _G.DevilFruit = "DFT2"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "Auto Aff",
            Text = "You Choose " .. tostring(_G.DevilFruit),
            Duration = 5
        })
    end)
    vu227.DevilFruit:GetPropertyChangedSignal("Value"):Connect(function()
        wait(0)
        vu228 = {
            vu227.DevilFruit.Value,
            vu227.DevilFruit2.Value
        }
        vu230:Refresh(vu228)
    end)
    vu227.DevilFruit2:GetPropertyChangedSignal("Value"):Connect(function()
        wait(0)
        vu228 = {
            vu227.DevilFruit.Value,
            vu227.DevilFruit2.Value
        }
        vu230:Refresh(vu228)
    end)
    vu63:NewDropdown("Payment", "DropdownInf", {
        "Cash",
        "Gems"
    }, function(p231)
        _G.Payment = p231
    end)
    vu63:NewDropdown("Affinity Selector", "DropdownInf", {
        "1.1",
        "1.2",
        "1.3",
        "1.4",
        "1.5",
        "1.6",
        "1.7",
        "1.8",
        "1.9",
        "2.0"
    }, function(p232)
        _G.tostop = tonumber(p232 - 0.1)
    end)
    vu63:NewToggle("DefenseLock", "sex", function(p233)
        if p233 then
            _G.DefenseLock = true
        else
            _G.DefenseLock = false
        end
    end)
    vu63:NewToggle("SwordLock", "sex", function(p234)
        if p234 then
            _G.SwordLock = true
        else
            _G.SwordLock = false
        end
    end)
    vu63:NewToggle("MeleeLock", "sex", function(p235)
        if p235 then
            _G.MeleeLock = true
        else
            _G.MeleeLock = false
        end
    end)
    vu63:NewToggle("SniperLock", "sex", function(p236)
        if p236 then
            _G.SniperLock = true
        else
            _G.SniperLock = false
        end
    end)
    vu63:NewToggle("Spinner(slow)", "sex", function(p237)
        if p237 then
            local v238 = tostring(game.Players.LocalPlayer.UserId)
            local v239 = game:GetService("Workspace").UserData["User_" .. v238].Data
            _G.Defense = v239["" .. _G.DevilFruit .. "Defense"]
            _G.Melee = v239["" .. _G.DevilFruit .. "Melee"]
            _G.Sniper = v239["" .. _G.DevilFruit .. "Sniper"]
            _G.Sword = v239["" .. _G.DevilFruit .. "Sword"]
            if _G.DevilFruit == nil then
                game.Players.LocalPlayer:Kick("Do You Wan\'t to Get Banned Retard, Pick Devil Fruit Before You Use Affinity Spinner")
            end
            _G.Defense:GetPropertyChangedSignal("Value"):Connect(function()
                if _G.Defense.Value > _G.tostop then
                    _G.AutoAff = false
                    _G.gg = Defense.Value .. " Defense Aff"
                    gg()
                end
            end)
            _G.Melee:GetPropertyChangedSignal("Value"):Connect(function()
                if _G.Melee.Value > _G.tostop then
                    _G.AutoAff = false
                    _G.gg = Melee.Value .. " Melee Aff"
                    gg()
                end
            end)
            _G.Sniper:GetPropertyChangedSignal("Value"):Connect(function()
                if _G.Sniper.Value > _G.tostop then
                    _G.AutoAff = false
                    _G.gg = Sniper.Value .. " Sniper Aff"
                    gg()
                end
            end)
            _G.Sword:GetPropertyChangedSignal("Value"):Connect(function()
                if _G.Sword.Value > _G.tostop then
                    _G.AutoAff = false
                    _G.gg = Sword.Value .. " Sword Aff"
                    gg()
                end
            end)
            _G.AutoAff = true
            while _G.AutoAff do
                workspace.Merchants.AffinityMerchant.Clickable.Retum:FireServer(_G.DevilFruit, _G.DefenseLock, _G.MeleeLock, _G.SniperLock, _G.SwordLock, _G.Payment)
                task.wait(10.5)
            end
        else
            _G.AutoAff = false
            _G.Defense = nil
            _G.Melee = nil
            _G.Sniper = nil
            _G.Sword = nil
        end
    end)
    vu63:NewToggle("Spinner(Fast)", "sex", function(p240)
        if not p240 then
            _G.AutoAff = false
            return
        end
        _G.AutoAff = true
        local v241 = game:GetService("Workspace")
        local v242 = tostring(game.Players.LocalPlayer.UserId)
        local v243 = v241.UserData["User_" .. v242].Data
        if _G.DevilFruit == nil then
            game.Players.LocalPlayer:Kick("Do You Wan\'t to Get Banned Retard, Pick Devil Fruit Before You Use Affinity Spinner")
        end
        wait(0)
        if _G.DefenseLock == false and _G.Defense.Value > _G.tostop then
            _G.AutoAff = false
            _G.gg = _G.Defense.Value .. " Defense Aff"
            gg()
            wait(2.5)
        end
        if _G.SwordLock == false and _G.Sword.Value > _G.tostop then
            _G.AutoAff = false
            _G.gg = _G.Sword.Value .. " Sword Aff"
            gg()
            wait(2.5)
        end
        if _G.MeleeLock == false and _G.Melee.Value > _G.tostop then
            _G.AutoAff = false
            _G.gg = _G.Melee.Value .. " Melee Aff"
            gg()
            wait(2.5)
        end
        if _G.SniperLock == false and _G.Sniper.Value > _G.tostop then
            _G.AutoAff = false
            _G.gg = _G.Sniper.Value .. " Sniper Aff"
            gg()
            wait(2.5)
        end
        _G.Pass = false
        if not _G.AutoAff then
        end
        task.wait()
        _G.Defense = v243["" .. _G.DevilFruit .. "Defense"]
        _G.Melee = v243["" .. _G.DevilFruit .. "Melee"]
        _G.Sniper = v243["" .. _G.DevilFruit .. "Sniper"]
        _G.Sword = v243["" .. _G.DevilFruit .. "Sword"]
        _G.DValue = _G.Defense.Value
        _G.MValue = _G.Melee.Value
        _G.SValue = _G.Sniper.Value
        _G.SWvalue = _G.Sword.Value
        _G.AntiBug = _G.DValue + _G.MValue + _G.SValue + _G.SWvalue
        _G.AntiClug = 0
        workspace.Merchants.AffinityMerchant.Clickable.Retum:FireServer(_G.DevilFruit, _G.DefenseLock, _G.MeleeLock, _G.SniperLock, _G.SwordLock, _G.Payment)
        task.wait()
        _G.AntiClug = _G.AntiClug + 1
        if _G.AntiClug == 1500 then
            _G.Pass = true
        end
        if _G.Defense.Value ~= _G.DValue or (_G.Melee.Value ~= _G.MValue or (_G.Sniper.Value ~= _G.SValue or (_G.Sword.Value ~= _G.SWvalue or (_G.AutoAff == false or _G.Pass == true)))) then
        else
        end
    end)
end)
v62:NewButton("Rayleigh Taker", "Prints If Gotten", function()
    local v244 = game:GetService("Players").LocalPlayer
    local vu245 = workspace.UserData["User_" .. v244.UserId]
    local function vu247(p246)
        vu245.III:FireServer(p246, 1)
        task.wait(0.1)
    end
    repeat
        wait()
    until vu245.TotalLevel.Value > 999
    game.Workspace.Merchants.QuestHakiMerchant.Clickable.Retum:FireServer()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Rayleigh",
        Text = "You Got Haki",
        Duration = 2
    })
    repeat
        wait()
    until v244.PlayerGui.Emotes.Frame.Frame["2C"].Active == true
    repeat
        wait()
        v244.Character.Mark3:FireServer()
    until vu245.HakiLevel.Value ~= 0
    local v248 = game:GetService("RunService").RenderStepped:Connect(function()
        vu247("On")
        vu247("Off")
    end)
    repeat
        wait()
    until vu245.HakiLevel.Value > 199
    v248:Disconnect()
end)
v62:NewButton("Click to Regen haki", "sex", function()
    local v249 = tostring(game.Players.LocalPlayer.UserId)
    for _ = 1, 10 do
        workspace.UserData["User_" .. v249].III:FireServer("On", 1)
        wait()
        workspace.UserData["User_" .. v249].III:FireServer("Off", 1)
        workspace.UserData["User_" .. v249].III:FireServer("On", 1)
        wait()
        workspace.UserData["User_" .. v249].III:FireServer("Off", 1)
        workspace.UserData["User_" .. v249].III:FireServer("On", 1)
        wait()
        workspace.UserData["User_" .. v249].III:FireServer("Off", 1)
        workspace.UserData["User_" .. v249].III:FireServer("On", 1)
        wait()
        workspace.UserData["User_" .. v249].III:FireServer("Off", 1)
        workspace.UserData["User_" .. v249].III:FireServer("On", 1)
        wait()
        workspace.UserData["User_" .. v249].III:FireServer("Off", 1)
    end
end)
v62:NewToggle("PvP Mode", ":)", function(p250)
    if p250 then
        _G.AutoBuso = true
        local vu251 = game:GetService("Players").LocalPlayer
        local vu252 = workspace.UserData["User_" .. vu251.UserId]
        while _G.AutoBuso do
            wait()
            pcall(function()
                repeat
                    wait(0)
                until vu251.Character:FindFirstChild("CharacterTrait")
                repeat
                    wait(0)
                until vu251.Character.CharacterTrait:FindFirstChild("Health")
                repeat
                    wait(0)
                until vu251.Character.CharacterTrait.Health.Value ~= 0
                repeat
                    wait(0)
                until vu251.Character:FindFirstChild("DamageScript").Enabled == true
                vu251.PlayerGui.HealthBar.Frame.Visible = true
                local v253 = vu251.PlayerGui.HealthBar.Frame.Haki.Frame.Min
                local v254 = vu251.PlayerGui.HealthBar.Frame.Haki.Frame.Max
                repeat
                    wait(0)
                    vu252.UpdateHaki:FireServer()
                until vu252.UsingHaki.Value == true or vu251.Character:FindFirstChild("DamageScript").Enabled == false
                vu252.III:FireServer("On", 1)
                repeat
                    wait(0)
                until tonumber(math.floor(v253.Value / v254.Value * 10000) / 100) < 50 or vu251.Character:FindFirstChild("DamageScript").Enabled == false
                repeat
                    wait(0)
                    vu252.UpdateHaki:FireServer()
                until vu252.UsingHaki.Value == false or vu251.Character:FindFirstChild("DamageScript").Enabled == false
                repeat
                    task.wait()
                    local v255 = tonumber(math.floor(v253.Value / v254.Value * 10000) / 100)
                    spawn(function()
                        vu252.III:FireServer("On", 1)
                        task.wait(0)
                        vu252.III:FireServer("Off", 1)
                        vu252.III:FireServer("On", 1)
                        task.wait(0)
                        vu252.III:FireServer("Off", 1)
                        vu252.III:FireServer("On", 1)
                        task.wait(0)
                        vu252.III:FireServer("Off", 1)
                        vu252.III:FireServer("On", 1)
                        task.wait(0)
                        vu252.III:FireServer("Off", 1)
                        vu252.III:FireServer("On", 1)
                        task.wait(0)
                        vu252.III:FireServer("Off", 1)
                        vu252.III:FireServer("On", 1)
                        task.wait(0)
                        vu252.III:FireServer("Off", 1)
                    end)
                until v255 < 40 or vu251.Character:FindFirstChild("DamageScript").Enabled == false
                repeat
                    task.wait()
                until tonumber(math.floor(v253.Value / v254.Value * 10000) / 100) == 100 or vu251.Character:FindFirstChild("DamageScript").Enabled == false
            end)
        end
    else
        _G.pvp = false
    end
end)
v62:NewToggle("Auto Buso", ":)", function(p256)
    if p256 then
        _G.AutoBuso = true
        local vu257 = game:GetService("Players").LocalPlayer
        local vu258 = workspace.UserData["User_" .. vu257.UserId]
        while _G.AutoBuso do
            wait()
            pcall(function()
                repeat
                    wait(0)
                until game.workspace["" .. vu257.Name]:FindFirstChild("CharacterTrait")
                repeat
                    wait(0)
                until game.workspace["" .. vu257.Name].CharacterTrait:FindFirstChild("Health")
                repeat
                    wait(0)
                until game.workspace["" .. vu257.Name].CharacterTrait.Health.Value ~= 0
                repeat
                    wait(0)
                until game:GetService("Workspace")["" .. vu257.Name]:FindFirstChild("DamageScript").Enabled == true
                vu257.PlayerGui.HealthBar.Frame.Visible = true
                local v259 = vu257.PlayerGui.HealthBar.Frame.Haki.Frame.Min
                local v260 = vu257.PlayerGui.HealthBar.Frame.Haki.Frame.Max
                repeat
                    wait(0)
                    vu258.UpdateHaki:FireServer()
                until vu258.UsingHaki.Value == true or game:GetService("Workspace")["" .. vu257.Name]:FindFirstChild("DamageScript").Enabled == false
                repeat
                    wait(0)
                    vu257.PlayerGui.HealthBar.Frame.Visible = true
                until tonumber(math.floor(v259.Value / v260.Value * 10000) / 100) < 50 or game:GetService("Workspace")["" .. vu257.Name]:FindFirstChild("DamageScript").Enabled == false
                repeat
                    wait(0)
                    vu258.UpdateHaki:FireServer()
                until vu258.UsingHaki.Value == false or game:GetService("Workspace")["" .. vu257.Name]:FindFirstChild("DamageScript").Enabled == false
                repeat
                    task.wait()
                    vu257.PlayerGui.HealthBar.Frame.Visible = true
                    local v261 = tonumber(math.floor(v259.Value / v260.Value * 10000) / 100)
                    vu258.III:FireServer("On", 1)
                    wait()
                    vu258.III:FireServer("Off", 1)
                    vu258.III:FireServer("On", 1)
                    wait()
                    vu258.III:FireServer("Off", 1)
                    vu258.III:FireServer("On", 1)
                    wait()
                    vu258.III:FireServer("Off", 1)
                    vu258.III:FireServer("On", 1)
                    wait()
                    vu258.III:FireServer("Off", 1)
                    vu258.III:FireServer("On", 1)
                    wait()
                    vu258.III:FireServer("Off", 1)
                until v261 < 40 or game:GetService("Workspace")["" .. vu257.Name]:FindFirstChild("DamageScript").Enabled == false
                repeat
                    wait()
                    vu257.PlayerGui.HealthBar.Frame.Visible = true
                until tonumber(math.floor(v259.Value / v260.Value * 10000) / 100) == 100 or game:GetService("Workspace")["" .. vu257.Name]:FindFirstChild("DamageScript").Enabled == false
            end)
        end
    else
        _G.AutoBuso = false
    end
end)
v64:NewTextBox("Join Player", "Write Username", function(p262)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Trolo2014/IntrestingScript/refs/heads/main/SniperByShawn4444.lua"))()
    local v263 = game.PlaceId
    workspace.ShawnSniper.SearchTarget.Value = tostring(tostring(v263) .. ":" .. p262)
    local v264 = workspace.ShawnSniper.OutPut.Changed:Wait()
    if string.find(v264, "-") then
        game:GetService("TeleportService"):TeleportToPlaceInstance(v263, v264)
    else
        wait(0)
        game.StarterGui:SetCore("SendNotification", {
            Title = "ShawnSniper",
            Text = v264,
            Duration = 10
        })
    end
end)
_G.ServerList = {}
local vu267 = v64:NewDropdown("Server Joiner", "", _G.ServerList, function(p265)
    local v266 = game.Players.LocalPlayer
    game:GetService("TeleportService"):TeleportToPlaceInstance(3237168, p265, v266)
end)
v64:NewButton("Refresh Servers", "Refreshes Dropdown", function(_)
    _G.ServerList = {}
    local v268, v269, v270 = ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data)
    while true do
        local v271
        v270, v271 = v268(v269, v270)
        if v270 == nil then
            break
        end
        if type(v271) == "table" and (v271.maxPlayers > v271.playing and v271.id ~= game.JobId) then
            table.insert(_G.ServerList, "--------------------------------------------------------------------")
            table.insert(_G.ServerList, v271.playing .. "/" .. v271.maxPlayers .. ":Players " .. v271.ping .. ":Ping")
            table.insert(_G.ServerList, v271.id)
        end
    end
    vu267:Refresh(_G.ServerList)
end)
v64:NewButton("Rejoin", "ButtonInfo", function()
    ts = game:GetService("TeleportService")
    ts:Teleport(game.PlaceId)
end)
v64:NewButton("Server Hop", "ButtonInfo", function()
    repeat
        pcall(function()
            local v272, v273, v274 = ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data)
            local v275 = {}
            while true do
                local v276
                v274, v276 = v272(v273, v274)
                if v274 == nil then
                    break
                end
                if type(v276) == "table" and (v276.maxPlayers > v276.playing and v276.id ~= game.JobId) then
                    v275[# v275 + 1] = v276.id
                end
            end
            if # v275 <= 0 then
                local _ = notify
            else
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v275[math.random(1, # v275)])
            end
        end)
        task.wait(2.5)
    until not game.Players.LocalPlayer
end)
v64:NewButton("Kaizu 1 tap[use before spawn]", "Use Before Spawning", function()
    local v277 = game:GetService("Players").LocalPlayer
    local v278 = game:GetService("Workspace").IslandKai
    v277.Backpack:WaitForChild("Yoru").Parent = v277.Character
    local v279 = v277.Character:WaitForChild("Yoru")
    local v280 = nil
    while v280 == nil do
        task.wait()
        local v281, v282, v283 = pairs(getconnections(v279:WaitForChild("RequestAnimation").OnClientEvent))
        while true do
            local v284
            v283, v284 = v281(v282, v283)
            if v283 == nil then
                break
            end
            v280 = getsenv(v279.AnimationController)
        end
    end
    v279.Parent = v277.Backpack
    v277.Character.HumanoidRootPart.CFrame = CFrame.new(- 1576, 216, 9934)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Waiting For Kaizu",
        Text = "",
        Duration = 5
    })
    local v285 = v278:WaitForChild("Kaizu")
    v285:WaitForChild("HumanoidRootPart")
    v285:WaitForChild("Humanoid")
    game.StarterGui:SetCore("SendNotification", {
        Title = "Kaizu Found",
        Text = "Waiting until Max Hp",
        Duration = 5
    })
    v279.Parent = v277.Character
    workspace.UserData["User_" .. v277.UserId].UpdateHaki:FireServer()
    repeat
        task.wait()
    until v285.Humanoid.Health > 1
    game.StarterGui:SetCore("SendNotification", {
        Title = "Killing Him Now",
        Text = "",
        Duration = 50
    })
    while v278:FindFirstChild("Kaizu") do
        task.wait()
        if v278:FindFirstChild("Kaizu") then
            v277.Character.HumanoidRootPart.CFrame = v285.HumanoidRootPart.CFrame
            v279.RequestAnimation:FireServer(v280.PlaceId)
            v279:Activate()
            v285.Humanoid.Health = 0
        end
    end
    workspace.UserData["User_" .. v277.UserId].UpdateHaki:FireServer()
    v279.Parent = v277.Backpack
end)
v64:NewButton("Pursuer 1 tap", "1 taps Pursuer u need hit him", function()
    local v286 = game:GetService("Players").LocalPlayer
    local _ = v286.Character.HumanoidRootPart.CFrame
    local v287 = game:GetService("Workspace").Island14.Activator.Value ~= true and "" or "Btw This Server Only Needs 3 Fruits "
    game.StarterGui:SetCore("SendNotification", {
        Title = "Waiting For Pursuer",
        Text = v287,
        Duration = 25
    })
    game:GetService("Workspace").UserData["User_" .. v286.UserId].Data.PlayerHas_Masamune:GetPropertyChangedSignal("Value"):Connect(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "You Got Masamune",
            Text = "",
            Duration = 25
        })
    end)
    game:GetService("Workspace").Island14:WaitForChild("Lv5000 Pursuer")
    v286.Character.Humanoid:EquipTool(v286.Backpack:WaitForChild("Yoru"))
    local v288 = v286.Character:WaitForChild("Yoru")
    local v289 = nil
    while v289 == nil do
        task.wait()
        local v290, v291, v292 = pairs(getconnections(v288:WaitForChild("RequestAnimation").OnClientEvent))
        while true do
            local v293
            v292, v293 = v290(v291, v292)
            if v292 == nil then
                break
            end
            v289 = getsenv(v288.AnimationController)
        end
    end
    workspace.UserData["User_" .. v286.UserId].UpdateHaki:FireServer()
    local v294, v295, v296 = pairs(game:GetService("Workspace").Island14:GetChildren())
    while true do
        local v297
        v296, v297 = v294(v295, v296)
        if v296 == nil then
            break
        end
        if string.find(v297.Name, "Pursuer") then
            v297:WaitForChild("HumanoidRootPart")
            v297:WaitForChild("Humanoid")
            while v297.Humanoid.Health > 0 do
                task.wait()
                v286.Character.HumanoidRootPart.CFrame = v297.HumanoidRootPart.CFrame
                v288.RequestAnimation:FireServer(v289.PlaceId)
                v288:Activate()
            end
        end
    end
    workspace.UserData["User_" .. v286.UserId].UpdateHaki:FireServer()
    v288.Parent = v286.Backpack
end)
v64:NewButton("Auto Complete Challenges", "Need Cannon Ball", function()
    local vu298 = game:GetService("Players")
    local vu299 = vu298.LocalPlayer
    local function vu318(p300)
        local v301, v302, v303 = pairs(p300:GetChildren())
        while true do
            local v304
            v303, v304 = v301(v302, v303)
            if v303 == nil then
                break
            end
            if string.find(v304.Name, "Frame") then
                local v305, v306, v307 = pairs(v304:WaitForChild("ScrollingFrame"):GetChildren())
                while true do
                    local v308
                    v307, v308 = v305(v306, v307)
                    if v307 == nil then
                        break
                    end
                    local v309 = v308.Name
                    p300:WaitForChild(v304.Name):WaitForChild("ScrollingFrame"):WaitForChild(v309):WaitForChild("Claim"):GetPropertyChangedSignal("AutoButtonColor"):Connect(function()
                        for v310 = 1, 4 do
                            workspace.UserData["User_" .. vu299.UserId].ChallengesRemote:FireServer("Claim", "Daily" .. v310)
                        end
                        for v311 = 1, 3 do
                            workspace.UserData["User_" .. vu299.UserId].ChallengesRemote:FireServer("Claim", "Weekly" .. v311)
                        end
                        for v312 = 1, 2 do
                            workspace.UserData["User_" .. vu299.UserId].ChallengesRemote:FireServer("Claim", "Monthly" .. v312)
                        end
                        for v313 = 1, 14 do
                            workspace.UserData["User_" .. vu299.UserId].ChallengesRemote:FireServer("Claim", "Challenge" .. v313)
                        end
                        local v314, v315, v316 = pairs({
                            "AllMonthly",
                            "AllWeekly",
                            "AllDaily"
                        })
                        while true do
                            local v317
                            v316, v317 = v314(v315, v316)
                            if v316 == nil then
                                break
                            end
                            workspace.UserData["User_" .. vu299.UserId].ChallengesRemote:FireServer("Claim", v317)
                        end
                    end)
                end
            end
        end
    end
    local v319 = game:GetService("Workspace").UserData["User_" .. vu299.UserId].Data.CompassTokens
    local v320 = game:GetService("Workspace").UserData["User_" .. vu299.UserId].Data.Kills.Value
    function Player()
        local vu321 = vu299.Character
        local v322 = vu321
        local v323 = vu321.WaitForChild(v322, "Weapons")
        local v324 = vu321
        vu321.WaitForChild(v324, "CharacterTrait"):WaitForChild("ClothingTrigger"):FireServer()
        local v325 = vu321
        vu321.WaitForChild(v325, "Humanoid"):GetPropertyChangedSignal("Sit"):Connect(function()
            wait(0)
            vu321.Humanoid.Jump = true
        end)
        local v326 = vu321
        vu321.WaitForChild(v326, "Left Arm"):GetPropertyChangedSignal("Parent"):Connect(function()
            workspace.UserData["User_" .. vu299.UserId].III:FireServer("Off", 10000)
        end)
        local v327 = vu321
        vu321.WaitForChild(v327, "Clothing_Hair")
        vu318(vu299:WaitForChild("PlayerGui"):WaitForChild("Challenges"):WaitForChild("Frame"):WaitForChild("Frame"))
        v323:FireServer()
        local v328 = vu321
        vu321.WaitForChild(v328, "CamScript"):WaitForChild("ClientServerClient"):FireServer(vu299)
        vu299.PlayerGui.Blindness:Destroy()
        vu299.PlayerGui.Load.Frame:Destroy()
        vu299.PlayerGui.HealthBar.Frame.Visible = true
        repeat
            task.wait()
            vu321.HumanoidRootPart.CFrame = CFrame.new(- 3135, 528, - 4095)
            local v329 = vu321
        until vu321.WaitForChild(v329, "DamageScript").Enabled == true
    end
    local v330 = vu299.CharacterAdded:Connect(function()
        Player()
    end)
    local function vu338(p331)
        if vu299.Character:FindFirstChild("Cannon Ball") then
            if vu299.Character:FindFirstChild("HumanoidRootPart") and vu299.Character:FindFirstChild("Cannon Ball") then
                local v332 = {
                    CFrame.new(0, 0, 0),
                    vu299.Character.HumanoidRootPart
                }
                vu299.Character:FindFirstChild("Cannon Ball").RemoteEvent:FireServer(unpack(v332))
                local v333, v334, v335 = pairs(workspace.ResourceHolder["Resources_" .. vu299.UserId]:GetChildren())
                while true do
                    local v336
                    v335, v336 = v333(v334, v335)
                    if v335 == nil then
                        break
                    end
                    if v336.Name == "CannonBall" and v336:FindFirstChild("TouchInterest") then
                        local v337 = Instance.new("BodyAngularVelocity")
                        v337.AngularVelocity = Vector3.new(1000000, 1000000, 1000000)
                        v337.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
                        v337.P = 1000000
                        v337.Parent = v336
                        v336.CFrame = p331.HumanoidRootPart.CFrame
                        task.wait(0)
                    end
                end
            end
            return
        else
            while true do
                task.wait()
                repeat
                    task.wait()
                until vu299.Backpack:FindFirstChildOfClass("Tool")
                vu299.Backpack:FindFirstChild("Cannon Ball").Parent = vu299.Character
                if vu299.Character:FindFirstChild("Cannon Ball") then
                end
            end
        end
    end
    if vu299.PlayerGui.Challenges.Frame.Frame.DailyFrame.ScrollingFrame.Challenge_1.Claim.TextLabel.Text == "Claim" then
        local v339 = game.Workspace.UserData["User_" .. vu299.UserId].Data.MissionObjective
        local vu340 = game:GetService("Workspace").UserData["User_" .. vu299.UserId].Data.MissionDifficulty
        function ExpertTaker()
            local v341 = vu299.Character
            v341:WaitForChild("Clothing_Hair")
            while v341.Humanoid.Health == 100 and vu340.Value == "None" do
                wait()
                workspace.Merchants.ExpertiseMerchant.Clickable.Retum:FireServer()
            end
        end
        vu299.CharacterAdded:Connect(function()
            if vu340.Value == "None" then
                ExpertTaker()
            end
        end)
        ExpertTaker()
        while vu340.Value == "None" do
            wait()
        end
        if vu299.Character.DamageScript.Enabled == false then
            Player()
        end
        local v342 = game:GetService("Workspace").UserData["User_" .. vu299.UserId].Data.MissionDifficulty.Value
        if v339.Value == "Elite Kill" or v339.Value == "Kill" then
            local v343 = game:GetService("Workspace").UserData["User_" .. vu299.UserId].Data.MissionObjectiveTarget.Value
            local v344, v345, v346 = pairs(workspace.Enemies:GetChildren())
            local vu347 = {}
            while true do
                local v348
                v346, v348 = v344(v345, v346)
                if v346 == nil then
                    break
                end
                if v343 == "Freddy" and string.find(v348.Name, "Fr") then
                    table.insert(vu347, v348.Name)
                end
                if string.find(v348.Name, v343) then
                    table.insert(vu347, v348.Name)
                end
            end
            repeat
                wait()
                pcall(function()
                    repeat
                        wait()
                    until vu299.Backpack:FindFirstChildOfClass("Tool")
                    local v349 = workspace:FindFirstChild("Enemies")
                    local v350, v351, v352 = pairs(v349:GetChildren())
                    while true do
                        local v353
                        v352, v353 = v350(v351, v352)
                        if v352 == nil then
                            break
                        end
                        if v353:IsA("Model") and (v353.Humanoid.Health >= 1 and (table.find(vu347, v353.Name) and vu299.Character)) then
                            vu338(v353)
                        end
                    end
                end)
            until vu340.Value ~= v342
        end
        if v339.Value == "Quests" then
            baseplatee = Instance.new("Part", workspace)
            baseplatee.Size = Vector3.new(50, 1, 50)
            baseplatee.CFrame = CFrame.new(- 20479, 215, - 20479)
            baseplatee.Anchored = true
            repeat
                wait()
                pcall(function()
                    workspace.Merchants.QuestFishMerchant.Clickable.Retum:FireServer()
                    vu299.Character.HumanoidRootPart.CFrame = CFrame.new(- 2371, 216, 10990)
                    local v354, v355, v356 = pairs(vu299.Backpack:GetChildren())
                    while true do
                        local v357
                        v356, v357 = v354(v355, v356)
                        if v356 == nil then
                            break
                        end
                        if v357:IsA("Tool") and string.find(v357.Name, "Package") then
                            vu299.Character.Humanoid:EquipTool(v357)
                            v357:Activate()
                            wait()
                            local v358, v359, v360 = pairs(game:GetService("Workspace").Merchants:GetDescendants())
                            while true do
                                local v361
                                v360, v361 = v358(v359, v360)
                                if v360 == nil then
                                    break
                                end
                                if v361:IsA("Model") and (string.find(v361.Name, "Merch") and not string.find(v361.Name, "Haki")) and vu299.Character:FindFirstChild("Package") then
                                    vu299.Character.HumanoidRootPart.CFrame = v361.Torso.CFrame
                                    wait(0.5)
                                end
                            end
                            vu299.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        end
                    end
                end)
            until vu340.Value ~= v342
        end
        if v339.Value == "Damage" or v339.Value == "Money" then
            local vu362 = {
                "Lv360 Bruno",
                "Lv440 Buster",
                "Lv500 Bucky",
                "Lv8000 Gunner Captain",
                "Lv219 Cave Demon",
                "Lv186 Cave Demon",
                "Lv188 Cave Demon",
                "Lv198 Cave Demon"
            }
            repeat
                wait()
                pcall(function()
                    repeat
                        wait()
                    until vu299.Backpack:FindFirstChildOfClass("Tool")
                    local v363 = workspace:FindFirstChild("Enemies")
                    local v364, v365, v366 = pairs(v363:GetChildren())
                    while true do
                        local v367
                        v366, v367 = v364(v365, v366)
                        if v366 == nil then
                            break
                        end
                        if v367:IsA("Model") and (v367.Humanoid.Health >= 1 and (table.find(vu362, v367.Name) and vu299.Character)) then
                            vu338(v367)
                        end
                    end
                end)
            until vu340.Value ~= v342
        end
        if v339.Value == "Player Kill" then
            repeat
                wait()
                pcall(function()
                    repeat
                        wait()
                    until vu299.Backpack:FindFirstChildOfClass("Tool")
                    local v368 = vu298
                    local v369, v370, v371 = pairs(v368:GetChildren())
                    while true do
                        local v372
                        v371, v372 = v369(v370, v371)
                        if v371 == nil then
                            break
                        end
                        if v372 ~= vu299 and (v372.Character.DamageScript.Enabled == true and v372.Character.Humanoid.Health == 100) then
                            vu338(v372.Character)
                        end
                    end
                end)
            until vu340.Value ~= v342
        end
    end
    if vu299.PlayerGui.Challenges.Frame.Frame.DailyFrame.ScrollingFrame.Challenge_2.Claim.TextLabel.Text == "Claim" then
        repeat
            wait()
        until workspace.UserData["User_" .. vu299.UserId].Data.RewardHourlyN.Value > 0
        workspace.UserData["User_" .. vu299.UserId].ClaimRewardHourly:FireServer("RewardMark")
    end
    local v373 = 1030 - (tonumber(string.split(vu299.PlayerGui.Challenges.Frame.Frame.DailyFrame.ScrollingFrame.Challenge_3.Progress.LabelProgress.Text, "/")[1]) + tonumber(string.split(vu299.PlayerGui.Challenges.Frame.Frame.WeeklyFrame.ScrollingFrame.Challenge_2.Progress.LabelProgress.Text, "/")[1]))
    if v373 > 0 then
        if vu299.Character.DamageScript.Enabled == false then
            Player()
        end
        repeat
            wait()
            pcall(function()
                local v374, v375, v376 = pairs(workspace:FindFirstChild("Enemies"):GetChildren())
                while true do
                    local v377
                    v376, v377 = v374(v375, v376)
                    if v376 == nil then
                        break
                    end
                    if v377:IsA("Model") and (v377.Humanoid.Health >= 1 and vu299.Character) then
                        vu338(v377)
                    end
                end
            end)
        until game:GetService("Workspace").UserData["User_" .. vu299.UserId].Data.Kills.Value > v320 + v373
    end
    v330:Disconnect()
    for _ = 1, 6 - (tonumber(string.split(vu299.PlayerGui.Challenges.Frame.Frame.DailyFrame.ScrollingFrame.Challenge_4.Progress.LabelProgress.Text, "/")[1]) + tonumber(string.split(vu299.PlayerGui.Challenges.Frame.Frame.WeeklyFrame.ScrollingFrame.Challenge_3.Progress.LabelProgress.Text, "/")[1])) do
        repeat
            wait()
        until v319.Value > 0
        if vu299.Character.DamageScript.Enabled == false then
            Player()
        end
        workspace.Merchants.QuestMerchant.Clickable.Retum:FireServer("Claim1")
        vu299.Character.Humanoid:EquipTool(vu299.Backpack:WaitForChild("Compass"))
        vu299.Character.HumanoidRootPart.CFrame = CFrame.new(vu299.Character:WaitForChild("Compass"):WaitForChild("Poser").Value)
        vu299.Character:WaitForChild("Compass"):Activate()
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Challenges Completed",
        Text = "Imagine",
        Duration = 250
    })
end)
v64:NewTextBox("Cash Gifts", "Write Ammount You wan\'t Take", function(p378)
    local v379 = tostring(game.Players.LocalPlayer.UserId)
    for _ = 1, p378 do
        task.wait()
        workspace.UserData["User_" .. v379].ClaimRewardHourly:FireServer("RewardMark")
    end
end)
v64:NewTextBox("Gems Gifts", "Write Ammount You wan\'t Take", function(p380)
    local v381 = tostring(game.Players.LocalPlayer.UserId)
    for _ = 1, p380 do
        task.wait()
        workspace.UserData["User_" .. v381].ClaimRewardDaily:FireServer("RewardMark")
    end
end)
v64:NewToggle("Auto Chest Bringer", "Chest Bringer", function(p382)
    if p382 then
        local vu383 = game:GetService("Players").LocalPlayer
        _G.Chestobringo = true
        local v384, v385, v386 = pairs(game.Workspace:GetDescendants())
        local v387 = {}
        while true do
            local v388
            v386, v388 = v384(v385, v386)
            if v386 == nil then
                break
            end
            if string.find(v388.Name, "ChestSpawner") then
                table.insert(v387, v388)
            end
        end
        local v389, v390, v391 = pairs(v387)
        while true do
            local vu392
            v391, vu392 = v389(v390, v391)
            if v391 == nil then
                break
            end
            spawn(function()
                while _G.Chestobringo do
                    task.wait()
                    local v393, v394, v395 = pairs(vu392:WaitForChild("TreasureChest"):GetChildren())
                    while true do
                        local vu396
                        v395, vu396 = v393(v394, v395)
                        if v395 == nil then
                            break
                        end
                        if vu396.Name == "TreasureChestPart" and vu396:FindFirstChild("TouchInterest") then
                            pcall(function()
                                local v397 = vu383.Character.HumanoidRootPart.CFrame
                                local v398 = game:GetService("TweenService"):Create(vu396, TweenInfo.new(3), {
                                    CFrame = v397
                                })
                                v398:Play()
                                v398.Completed:Wait()
                            end)
                        end
                    end
                end
            end)
        end
    else
        _G.Chestobringo = false
    end
end)
v64:NewDropdown("Auto Fishing + Auto Sell", "ye", {
    "Wood Rod",
    "Sturdy Rod",
    "Super Rod"
}, function(pu399)
    local vu400 = game:GetService("Players").LocalPlayer
    local v401 = vu400.Character or vu400.CharacterAdded:Wait()
    local v402 = v401.Humanoid
    local vu403 = v401.HumanoidRootPart.CFrame
    local v404, v405, v406 = pairs(vu400.Backpack:GetChildren())
    while true do
        local v407
        v406, v407 = v404(v405, v406)
        if v406 == nil then
            break
        end
        if v407:IsA("Tool") and string.find(v407.Name, pu399) then
            v407.Parent = vu400.Character
            repeat
                wait()
            until game.Workspace["" .. vu400.Name]:FindFirstChild(pu399)
        end
    end
    repeat
        task.wait()
        pcall(function()
            while true do
                task.wait()
                if not game.Workspace["" .. vu400.Name]["" .. pu399].Cast:FindFirstChild("Bobber") then
                    vu400.Character:FindFirstChild(pu399).Click:FireServer(Vector3.new(vu403))
                end
                if game.Workspace["" .. vu400.Name]["" .. pu399].Cast:FindFirstChild("Bobber") then
                    if game.Workspace["" .. vu400.Name]["" .. pu399].Cast:FindFirstChild("Bobber") then
                        repeat
                            task.wait()
                            game:GetService("Workspace")["" .. vu400.Name][pu399].Cast.Bobber.CFrame = vu400.Character.Torso.CFrame + Vector3.new(0, - 10, 0)
                        until game:GetService("Workspace")["" .. vu400.Name][pu399].Caught.Value == true or not (game.Workspace["" .. vu400.Name]["" .. pu399].Cast:FindFirstChild("Bobber") and game.Workspace["" .. vu400.Name]:FindFirstChild(pu399))
                        vu400.Character:FindFirstChild(pu399).Click:FireServer(Vector3.new(vu403))
                        repeat
                            task.wait()
                        until not (game.Workspace["" .. vu400.Name]["" .. pu399].Cast:FindFirstChild("Bobber") and game.Workspace["" .. vu400.Name]:FindFirstChild(pu399))
                    end
                    return
                end
            end
        end)
    until not game.Workspace["" .. vu400.Name]:FindFirstChild(pu399)
    local v408, v409, v410 = pairs(vu400.Backpack:GetChildren())
    while true do
        local v411
        v410, v411 = v408(v409, v410)
        if v410 == nil then
            break
        end
        if v411:IsA("Tool") and (not string.find(v411.Name, "Cooked") and string.find(v411.Name, "Large")) or (string.find(v411.Name, "Lubber") or (string.find(v411.Name, "Jawber") or (string.find(v411.Name, "Flooper") or (string.find(v411.Name, "Medium") or string.find(v411.Name, "Small"))))) then
            v402:EquipTool(v411)
            vu400.Character:WaitForChild(v411.Name)
            repeat
                task.wait()
                vu400.Character.HumanoidRootPart.CFrame = CFrame.new(- 1808, 223, 3356)
                local v412 = {
                    CFrame.new(- 1809.69348, 219.757462, 3357.40869, - 0.863100767, 0.218015403, - 0.455550551, - 1.49011594e-8, 0.902023613, 0.43168664, 0.505031645, 0.372589082, - 0.778537333),
                    workspace:WaitForChild("Firepit"):WaitForChild("Part")
                }
                vu400.Character:FindFirstChild(v411.Name):FindFirstChild("Click"):FireServer(unpack(v412))
            until vu400.Character[v411.Name]:WaitForChild("CookedFish").Value == true
        end
    end
    workspace:WaitForChild("Merchants"):WaitForChild("FishMerchant"):WaitForChild("Clickable"):WaitForChild("Retum"):FireServer()
end)
v64:NewKeybind("P to hide gui", "hiding gui", Enum.KeyCode.P, function()
    vu56:ToggleUI()
end)
v64:NewButton("Opl Newer Gui ", "Blue ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AltsegoD/script/master/OnePieceLegendary.lua"))()
end)
v64:NewButton("Opl Older Gui ", "Green Dark", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/c6KDRdxv"))()
end)
v64:NewButton("1 tap npc Gui ", "1tap", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/kGka1Dur", true))()
end)
v64:NewButton("Alts mini executor ", "alts", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/UniPYg8G", true))()
end)
v60:NewToggle("Expert Taker", "Expert", function(p413)
    if p413 then
        _G.Expert = true
        _G.Fuckingbug = true
        local v414 = tostring(game.Players.LocalPlayer.UserId)
        local v415 = {
            "None"
        }
        while _G.Expert do
            task.wait()
            if game.workspace.UserData["User_" .. v414].Data.MissionObjective.Value == "New" then
                game:GetService("TeleportService"):Teleport(3237168, game:GetService("Players").LocalPlayer)
            end
            repeat
                wait()
            until game.Workspace.UserData["User_" .. v414].Data.MissionObjective.Value == "None" and _G.Fuckingbug == true
            wait()
            if not table.find(v415, game:GetService("Workspace").UserData["User_" .. v414].Data.DevilFruit.Value) then
                workspace.Merchants.ExpertiseMerchant.Clickable.Retum:FireServer()
            end
        end
    else
        _G.Expert = false
        _G.Fuckingbug = false
    end
end)
v60:NewToggle("Auto Expertise", "ToggleInfo", function(p416)
    if p416 then
        local vu417 = game:GetService("Players")
        local vu418 = vu417.LocalPlayer
        local vu419 = game.Workspace.UserData["User_" .. vu418.UserId].Data.MissionObjective
        local vu420 = game:GetService("Workspace").UserData["User_" .. vu418.UserId].Data.MissionDifficulty
        _G.CannonExpertise = true
        local function vu428(p421)
            if vu418.Character:FindFirstChild("Cannon Ball") then
                if vu418.Character:FindFirstChild("HumanoidRootPart") and vu418.Character:FindFirstChild("Cannon Ball") then
                    local v422 = {
                        CFrame.new(0, 0, 0),
                        vu418.Character.HumanoidRootPart
                    }
                    vu418.Character:FindFirstChild("Cannon Ball").RemoteEvent:FireServer(unpack(v422))
                    local v423, v424, v425 = pairs(workspace.ResourceHolder["Resources_" .. vu418.UserId]:GetChildren())
                    while true do
                        local v426
                        v425, v426 = v423(v424, v425)
                        if v425 == nil then
                            break
                        end
                        if v426.Name == "CannonBall" and v426:FindFirstChild("TouchInterest") then
                            local v427 = Instance.new("BodyAngularVelocity")
                            v427.AngularVelocity = Vector3.new(1000000, 1000000, 1000000)
                            v427.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
                            v427.P = 1000000
                            v427.Parent = v426
                            v426.CFrame = p421.HumanoidRootPart.CFrame
                            task.wait()
                        end
                    end
                end
                return
            else
                while true do
                    task.wait()
                    repeat
                        task.wait()
                    until vu418.Backpack:FindFirstChildOfClass("Tool")
                    vu418.Backpack:FindFirstChild("Cannon Ball").Parent = vu418.Character
                    if vu418.Character:FindFirstChild("Cannon Ball") then
                    end
                end
            end
        end
        local vu429 = vu418
        while _G.CannonExpertise do
            wait()
            pcall(function()
                spawn(function()
                    repeat
                        wait()
                        pcall(function()
                            if vu429.PlayerGui.Load.Frame.Visible ~= true then
                                return
                            else
                                task.wait(1)
                                while true do
                                    wait()
                                    local v430, v431, v432 = pairs(getconnections(vu429.PlayerGui.Load.Frame.Load.MouseButton1Click))
                                    while true do
                                        local v433
                                        v432, v433 = v430(v431, v432)
                                        if v432 == nil then
                                            break
                                        end
                                        v433.Function()
                                    end
                                    if vu429.PlayerGui.Load.Frame.Visible == false then
                                    end
                                end
                            end
                        end)
                    until vu420.Value == "None"
                end)
                spawn(function()
                    repeat
                        wait()
                        pcall(function()
                            if vu429.Character.Humanoid.Sit == true then
                                wait(0)
                                vu429.Character.Humanoid.Jump = true
                            end
                        end)
                    until vu420.Value == "None"
                end)
                if vu419.Value == "Elite Kill" or vu419.Value == "Kill" then
                    local v434 = game:GetService("Workspace").UserData["User_" .. vu429.UserId].Data.MissionObjectiveTarget.Value
                    local v435, v436, v437 = pairs(workspace.Enemies:GetChildren())
                    local vu438 = {}
                    while true do
                        local v439
                        v437, v439 = v435(v436, v437)
                        if v437 == nil then
                            break
                        end
                        if v434 == "Freddy" and string.find(v439.Name, "Fr") then
                            table.insert(vu438, v439.Name)
                        end
                        if string.find(v439.Name, v434) then
                            table.insert(vu438, v439.Name)
                        end
                    end
                    repeat
                        task.wait()
                        pcall(function()
                            repeat
                                task.wait()
                            until vu429.Backpack:FindFirstChildOfClass("Tool")
                            local v440 = workspace:FindFirstChild("Enemies")
                            local v441, v442, v443 = pairs(v440:GetChildren())
                            while true do
                                local v444
                                v443, v444 = v441(v442, v443)
                                if v443 == nil then
                                    break
                                end
                                if v444:IsA("Model") and (v444.Humanoid.Health >= 1 and (table.find(vu438, v444.Name) and vu429.Character)) then
                                    vu428(v444)
                                end
                            end
                        end)
                    until vu420.Value == "None"
                end
                if vu419.Value == "Quests" then
                    baseplatee = Instance.new("Part", workspace)
                    baseplatee.Size = Vector3.new(50, 1, 50)
                    baseplatee.CFrame = CFrame.new(- 20479, 215, - 20479)
                    baseplatee.Anchored = true
                    repeat
                        wait()
                        pcall(function()
                            workspace.Merchants.QuestFishMerchant.Clickable.Retum:FireServer()
                            vu429.Character.HumanoidRootPart.CFrame = CFrame.new(- 2371, 216, 10990)
                            local v445, v446, v447 = pairs(vu429.Backpack:GetChildren())
                            while true do
                                local v448
                                v447, v448 = v445(v446, v447)
                                if v447 == nil then
                                    break
                                end
                                if v448:IsA("Tool") and string.find(v448.Name, "Package") then
                                    vu429.Character.Humanoid:EquipTool(v448)
                                    v448:Activate()
                                    wait(0.5)
                                    local v449, v450, v451 = pairs(game:GetService("Workspace").Merchants:GetDescendants())
                                    while true do
                                        local v452
                                        v451, v452 = v449(v450, v451)
                                        if v451 == nil then
                                            break
                                        end
                                        if v452:IsA("Model") and (string.find(v452.Name, "Merch") and not string.find(v452.Name, "Haki")) and vu429.Character:FindFirstChild("Package") then
                                            vu429.Character.HumanoidRootPart.CFrame = v452.Torso.CFrame
                                            wait(0.25)
                                        end
                                    end
                                    vu429.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                end
                            end
                        end)
                    until vu420.Value == "None"
                end
                if vu419.Value == "Damage" or vu419.Value == "Money" then
                    repeat
                        task.wait()
                        pcall(function()
                            repeat
                                task.wait()
                            until vu429.Backpack:FindFirstChildOfClass("Tool")
                            local v453 = workspace:FindFirstChild("Enemies")
                            local v454, v455, v456 = pairs(v453:GetChildren())
                            while true do
                                local v457
                                v456, v457 = v454(v455, v456)
                                if v456 == nil then
                                    break
                                end
                                if v457:IsA("Model") and (v457.Humanoid.Health >= 1 and (tonumber(string.split(string.split(v457.Name, "Lv")[2], " ")[1]) > 40 and vu429.Character)) then
                                    vu428(v457)
                                end
                            end
                        end)
                    until vu420.Value == "None"
                end
                if vu419.Value == "Player Kill" then
                    repeat
                        task.wait()
                        pcall(function()
                            repeat
                                task.wait()
                            until vu429.Backpack:FindFirstChildOfClass("Tool")
                            local v458 = vu417
                            local v459, v460, v461 = pairs(v458:GetChildren())
                            while true do
                                local v462
                                v461, v462 = v459(v460, v461)
                                if v461 == nil then
                                    break
                                end
                                if v462 ~= vu429 and (v462.Character.DamageScript.Enabled == true and v462.Character.Humanoid.Health == 100) then
                                    vu428(v462.Character)
                                end
                            end
                        end)
                    until vu420.Value == "None"
                end
                repeat
                    wait()
                until vu420.Value ~= "None" or _G.CannonExpertise == false
            end)
        end
    else
        _G.CannonExpertise = false
    end
end)
v61:NewDropdown("God Mode(Bomb)(Req 400 Defense)", "DropdownInf", {
    "On",
    "Off"
}, function(p463)
    local v464 = game:GetService("Players").LocalPlayer
    local v465 = getsenv(v464.Character.Powers.Bomb).VTCcpkghc
    if p463 == "On" then
        repeat
            wait()
        until v464.Character.DamageScript.Enabled == true
        v464.Character.Powers.Bomb.RemoteEvent:FireServer(v465, "BombPower6", "StartCharging", CFrame.new(0, 0, 0), workspace:WaitForChild("Rock"), 100)
        v464.Character.Powers.Bomb.RemoteEvent:FireServer(v465, "BombPower6", "StopCharging", CFrame.new(0, 0, 0), workspace:WaitForChild("Rock"), 0 / 0)
        v464.Character.CharacterTrait.Health.Changed:Wait()
        game.StarterGui:SetCore("SendNotification", {
            Title = "God Mode Bomb",
            Text = "Enabled",
            Duration = 5
        })
        while v464.Character.OpeSevered.Changed:Wait() do
            local v466 = v464.Character.HumanoidRootPart.CFrame
            while v464.Character.OpeSevered.Value == true do
                task.wait()
                v464.Character.HumanoidRootPart.CFrame = v466 + Vector3.new(0, 250, 0)
            end
            v464.Character.HumanoidRootPart.CFrame = v466
        end
    end
    if p463 == "Off" then
        workspace.UserData["User_" .. v464.UserId].III:FireServer("Off", 10000)
    end
end)
v61:NewDropdown("God Mode(Vamp)(Req 200 Sniper)", "DropdownInf", {
    "On",
    "Off"
}, function(p467)
    local v468 = game:GetService("Players").LocalPlayer
    local v469 = getsenv(v468.Character.Powers.Vampire).VTCjwf
    local v470 = v468.Character.HumanoidRootPart.CFrame
    if p467 == "On" then
        repeat
            wait()
        until v468.Character.DamageScript.Enabled == true
        v468.Character.HumanoidRootPart.CFrame = CFrame.new(- 1193, 210, - 1382)
        v468.Character.CharacterTrait.Health.Changed:Wait()
        v468.Character.Powers.Vampire.RemoteEvent:FireServer(v469, "VampirePower5", "StartCharging", v468.Character.HumanoidRootPart.CFrame, v468.Character.HumanoidRootPart, 100)
        v468.Character.Powers.Vampire.RemoteEvent:FireServer(v469, "VampirePower5", "StopCharging", v468.Character.HumanoidRootPart.CFrame, v468.Character.HumanoidRootPart, 0 / 0)
        v468.Character.CharacterTrait.Health.Changed:Wait()
        v468.Character.HumanoidRootPart.CFrame = v470
        game.StarterGui:SetCore("SendNotification", {
            Title = "God Mode Vamp",
            Text = "Enabled",
            Duration = 5
        })
        while v468.Character.OpeSevered.Changed:Wait() do
            local v471 = v468.Character.HumanoidRootPart.CFrame
            while v468.Character.OpeSevered.Value == true do
                task.wait()
                v468.Character.HumanoidRootPart.CFrame = v471 + Vector3.new(0, 250, 0)
            end
            v468.Character.HumanoidRootPart.CFrame = v471
        end
    end
    if p467 == "Off" then
        workspace.UserData["User_" .. v468.UserId].III:FireServer("Off", 10000)
    end
end)
v61:NewDropdown("Support List Fruits(info)", "yes", {
    "Light",
    "Vampire",
    "Dark Glitchy",
    "Magma",
    "Chilly",
    "Flare",
    "Bomb",
    "Quake"
}, function()
end)
local v472, v473, v474 = pairs(game:GetService("Players"):GetChildren())
local v475 = {}
while true do
    local v476, v477 = v472(v473, v474)
    if v476 == nil then
        break
    end
    v474 = v476
    if v477.Name ~= game.Players.LocalPlayer.Name then
        table.insert(v475, v477.Name)
    end
end
_G.KILL = {}
local vu483 = v61:NewDropdown("Select Guy", "", v475, function(p478)
    local v479, v480, v481 = pairs(game:GetService("Players"):GetChildren())
    while true do
        local v482
        v481, v482 = v479(v480, v481)
        if v481 == nil then
            break
        end
        if v482.Name == p478 then
            table.insert(_G.KILL, v482.Name)
        end
    end
end)
v61:NewButton("Refresh PLRK List", "Refreshes Dropdown", function(_)
    local v484, v485, v486 = pairs(game:GetService("Players"):GetChildren())
    local v487 = {}
    while true do
        local v488
        v486, v488 = v484(v485, v486)
        if v486 == nil then
            break
        end
        if v488.Name ~= game.Players.LocalPlayer.Name then
            table.insert(v487, v488.Name)
        end
    end
    vu483:Refresh(v487)
end)
v61:NewToggle("Kill Targets", "ToggleInfo", function(p489)
    if p489 then
        local vu490 = game:GetService("Players")
        local vu491 = vu490.LocalPlayer
        _G.Amongus = true
        while _G.Amongus do
            task.wait()
            pcall(function()
                local v492 = vu490
                local v493, v494, v495 = pairs(v492:GetChildren())
                while true do
                    local v496
                    v495, v496 = v493(v494, v495)
                    if v495 == nil then
                        break
                    end
                    if table.find(_G.KILL, v496.Name) and (v496.Character:WaitForChild("CharacterTrait"):WaitForChild("Health").Value > 0 and v496.Character:WaitForChild("DamageScript").Enabled == true) then
                        local vu497 = v496
                        local v498 = vu491.Character.HumanoidRootPart.CFrame
                        spawn(function()
                            repeat
                                task.wait()
                                pcall(function()
                                    vu491.Character.HumanoidRootPart.CFrame = vu497.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
                                end)
                            until vu497.Character.Humanoid.Health == 0
                        end)
                        local v499
                        if _G.TheFruit == "Quake" then
                            v499 = vu497
                        else
                            v499 = vu497
                            repeat
                                task.wait(0.125)
                                local v500 = vu491.Character or vu491.CharacterAdded:Wait()
                                local v501 = v500.Powers["" .. _G.TheFruit].RemoteEvent
                                local v502 = getsenv(v500.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash]
                                v501:FireServer(v502, _G.TheFruit .. "" .. _G.Skill, "StartCharging", v499.Character.HumanoidRootPart.CFrame, v499.Character.HumanoidRootPart, _G.OutPut)
                                v501:FireServer(v502, _G.TheFruit .. "" .. _G.Skill, "StopCharging", v499.Character.HumanoidRootPart.CFrame, v499.Character.HumanoidRootPart, _G.OutPut)
                            until v499.Character.Humanoid.Health == 0
                        end
                        if _G.TheFruit == "Quake" then
                            repeat
                                task.wait(0.145)
                                local v503 = vu491.Character or vu491.CharacterAdded:Wait()
                                local v504 = v503.Powers["" .. _G.TheFruit].RemoteEvent
                                local v505 = getsenv(v503.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash]
                                v504:FireServer(v505, _G.TheFruit .. "" .. _G.Skill, "StartCharging", v499.Character.HumanoidRootPart, v499.Character.HumanoidRootPart.CFrame, _G.OutPut, v499.Character.HumanoidRootPart.Position)
                                v504:FireServer(v505, _G.TheFruit .. "" .. _G.Skill, "StopCharging", v499.Character.HumanoidRootPart, v499.Character.HumanoidRootPart.CFrame, _G.OutPut, v499.Character.HumanoidRootPart.Position)
                            until v499.Character.Character.Humanoid.Health == 0
                        end
                        vu491.Character.HumanoidRootPart.CFrame = v498
                    end
                end
            end)
        end
    else
        _G.Amongus = false
        _G.KILL = {}
    end
end)
v61:NewToggle("Kill Targets(no tp)(use skill)", "ToggleInfo", function(p506)
    if p506 then
        local vu507 = game:GetService("Players")
        local vu508 = vu507.LocalPlayer
        _G.s = true
        while _G.s do
            task.wait()
            pcall(function()
                local v509 = vu507
                local v510, v511, v512 = pairs(v509:GetChildren())
                while true do
                    local v513
                    v512, v513 = v510(v511, v512)
                    if v512 == nil then
                        break
                    end
                    if table.find(_G.KILL, v513.Name) and v513.Character:WaitForChild("CharacterTrait"):WaitForChild("Health").Value > 0 then
                        local _ = vu508.Character.HumanoidRootPart.CFrame
                        if _G.TheFruit ~= "Quake" and _G.TheFruit ~= "Sand" then
                            repeat
                                task.wait(0.125)
                                vu508.Character.Powers["" .. _G.TheFruit].RemoteEvent:FireServer(getsenv(vu508.Character.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash], _G.TheFruit .. "" .. _G.Skill, "StopCharging", v513.Character.HumanoidRootPart.CFrame, v513.Character.HumanoidRootPart, _G.OutPut)
                            until v513.Character.Humanoid.Health == 0 or _G.s == false
                        end
                        if _G.TheFruit == "Quake" then
                            repeat
                                task.wait(0.13)
                                vu508.Character.Powers["" .. _G.TheFruit].RemoteEvent:FireServer(getsenv(vu508.Character.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash], _G.TheFruit .. "" .. _G.Skill, "StopCharging", v513.Character.HumanoidRootPart, v513.Character.HumanoidRootPart.CFrame, _G.OutPut, v513.Character.HumanoidRootPart.Position)
                            until v513.Character.Humanoid.Health == 0 or _G.s == false
                        end
                        if _G.TheFruit == "Sand" then
                            repeat
                                task.wait(0.125)
                                vu508.Character.Powers["" .. _G.TheFruit].RemoteEvent:FireServer(getsenv(vu508.Character.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash], _G.TheFruit .. "" .. _G.Skill, "Create", v513.Character.HumanoidRootPart.Position)
                            until v513.Character.Humanoid.Health == 0 or _G.s == false
                        end
                    end
                end
            end)
        end
    else
        _G.s = false
        _G.KILL = {}
    end
end)
v61:NewToggle("Kill(Cannon Ball)(Portable)", "Deez nuts", function(p514)
    if p514 then
        local vu515 = game:GetService("Players")
        local vu516 = vu515.LocalPlayer
        _G.CannonKill = true
        local function vu523(p517)
            if vu516.Character:FindFirstChild("Cannon Ball") then
                if vu516.Character:FindFirstChild("HumanoidRootPart") and vu516.Character:FindFirstChild("Cannon Ball") then
                    local v518 = {
                        CFrame.new(0, 0, 0),
                        vu516.Character.HumanoidRootPart
                    }
                    vu516.Character:FindFirstChild("Cannon Ball").RemoteEvent:FireServer(unpack(v518))
                    local v519, v520, v521 = pairs(workspace.ResourceHolder["Resources_" .. vu516.UserId]:GetChildren())
                    while true do
                        local v522
                        v521, v522 = v519(v520, v521)
                        if v521 == nil then
                            break
                        end
                        if v522.Name == "CannonBall" and v522:FindFirstChild("TouchInterest") then
                            v522.CFrame = p517.HumanoidRootPart.CFrame
                            task.wait()
                        end
                    end
                end
                return
            else
                while true do
                    task.wait()
                    repeat
                        task.wait()
                    until vu516.Backpack:FindFirstChildOfClass("Tool")
                    vu516.Backpack:FindFirstChild("Cannon Ball").Parent = vu516.Character
                    if vu516.Character:FindFirstChild("Cannon Ball") then
                    end
                end
            end
        end
        while _G.CannonKill do
            task.wait()
            pcall(function()
                local v524 = vu515
                local v525, v526, v527 = pairs(v524:GetChildren())
                while true do
                    local v528
                    v527, v528 = v525(v526, v527)
                    if v527 == nil then
                        break
                    end
                    if table.find(_G.KILL, v528.Name) and (v528.Character.CharacterTrait.Health.Value > 0 and v528.Character.DamageScript.Enabled == true) then
                        vu523(v528.Character)
                    end
                end
            end)
        end
    else
        _G.CannonKill = false
        _G.KILL = {}
    end
end)
v61:NewButton("Kill ALL", "Refreshes Dropdown", function(_)
    local vu529 = game:GetService("Players")
    local vu530 = vu529.LocalPlayer
    local _ = game:GetService("Workspace").UserData["User_" .. vu530.UserId].Data.DevilFruit
    local _ = game:GetService("Workspace").UserData["User_" .. vu530.UserId].Data.MissionObjective
    local v531 = workspace["" .. vu530.Name].HumanoidRootPart.CFrame
    local v532, v533, v534 = pairs(vu529:GetChildren())
    while true do
        local v535
        v534, v535 = v532(v533, v534)
        if v534 == nil then
            break
        end
        if v535.Name ~= vu530.Name and v535.Character.Humanoid.Health > 0 and v535.Backpack:FindFirstChildOfClass("Tool") then
            local vu536 = v535.Name
            spawn(function()
                repeat
                    task.wait()
                    pcall(function()
                        vu530.Character.HumanoidRootPart.CFrame = workspace["" .. vu536].HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
                    end)
                until vu529["" .. vu536].Character.Humanoid.Health == 0 or not vu529:FindFirstChild(vu536)
            end)
            local v537
            if _G.TheFruit == "Quake" then
                v537 = vu536
            else
                v537 = vu536
                repeat
                    wait(0.15)
                    local v538 = vu530.Character or vu530.CharacterAdded:Wait()
                    local v539 = v538.Powers["" .. _G.TheFruit].RemoteEvent
                    local v540 = getsenv(v538.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash]
                    v539:FireServer(v540, _G.TheFruit .. "" .. _G.Skill, "StartCharging", workspace["" .. v537].HumanoidRootPart.CFrame, workspace["" .. v537].HumanoidRootPart, 100)
                    v539:FireServer(v540, _G.TheFruit .. "" .. _G.Skill, "StopCharging", workspace["" .. v537].HumanoidRootPart.CFrame, workspace["" .. v537].HumanoidRootPart, 100)
                until vu529["" .. v537].Character.Humanoid.Health == 0
            end
            if _G.TheFruit == "Quake" then
                repeat
                    wait(0.15)
                    local v541 = vu530.Character or vu530.CharacterAdded:Wait()
                    local v542 = v541.Powers["" .. _G.TheFruit].RemoteEvent
                    local v543 = getsenv(v541.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash]
                    v542:FireServer(v543, _G.TheFruit .. "" .. _G.Skill, "StartCharging", workspace["" .. v537].HumanoidRootPart, workspace["" .. v537].HumanoidRootPart.CFrame, 100, workspace["" .. v537].HumanoidRootPart.Position)
                    v542:FireServer(v543, _G.TheFruit .. "" .. _G.Skill, "StopCharging", workspace["" .. v537].HumanoidRootPart, workspace["" .. v537].HumanoidRootPart.CFrame, 100, workspace["" .. v537].HumanoidRootPart.Position)
                until vu529["" .. v537].Character.Humanoid.Health == 0
            end
            vu530.Character.HumanoidRootPart.CFrame = v531
        end
    end
end)
if _G.AutoKillFaggot ~= nil then
    v61:NewToggle("Auto Kill(_G.AutoKillFaggot)", "ToggleInfo", function(p544)
        if p544 then
            local vu545 = game:GetService("Players")
            local vu546 = vu545.LocalPlayer
            _G.AmongusFaggot = true
            while _G.AmongusFaggot do
                task.wait()
                pcall(function()
                    local v547 = vu545
                    local v548, v549, v550 = pairs(v547:GetChildren())
                    while true do
                        local v551
                        v550, v551 = v548(v549, v550)
                        if v550 == nil then
                            break
                        end
                        if table.find(_G.AutoKillFaggot, v551.Name) and (v551.Character:WaitForChild("CharacterTrait"):WaitForChild("Health").Value > 0 and v551.Character:WaitForChild("DamageScript").Enabled == true) then
                            local vu552 = v551
                            local v553 = vu546.Character.HumanoidRootPart.CFrame
                            spawn(function()
                                repeat
                                    task.wait()
                                    pcall(function()
                                        vu546.Character.HumanoidRootPart.CFrame = vu552.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
                                    end)
                                until vu552.Character.Humanoid.Health == 0
                            end)
                            local v554
                            if _G.TheFruit == "Quake" then
                                v554 = vu552
                            else
                                v554 = vu552
                                repeat
                                    wait(0.125)
                                    local v555 = vu546.Character or vu546.CharacterAdded:Wait()
                                    local v556 = v555.Powers["" .. _G.TheFruit].RemoteEvent
                                    local v557 = getsenv(v555.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash]
                                    v556:FireServer(v557, _G.TheFruit .. "" .. _G.Skill, "StartCharging", v554.Character.HumanoidRootPart.CFrame, v554.Character.HumanoidRootPart, _G.OutPut)
                                    v556:FireServer(v557, _G.TheFruit .. "" .. _G.Skill, "StopCharging", v554.Character.HumanoidRootPart.CFrame, v554.Character.HumanoidRootPart, _G.OutPut)
                                until v554.Character.Humanoid.Health == 0
                            end
                            if _G.TheFruit == "Quake" then
                                repeat
                                    wait(0.145)
                                    local v558 = vu546.Character or vu546.CharacterAdded:Wait()
                                    local v559 = v558.Powers["" .. _G.TheFruit].RemoteEvent
                                    local v560 = getsenv(v558.Powers["" .. _G.TheFruit])["" .. _G.HarveyTrash]
                                    v559:FireServer(v560, _G.TheFruit .. "" .. _G.Skill, "StartCharging", v554.Character.HumanoidRootPart, v554.Character.HumanoidRootPart.CFrame, _G.OutPut, v554.Character.HumanoidRootPart.Position)
                                    v559:FireServer(v560, _G.TheFruit .. "" .. _G.Skill, "StopCharging", v554.Character.HumanoidRootPart, v554.Character.HumanoidRootPart.CFrame, _G.OutPut, v554.Character.HumanoidRootPart.Position)
                                until v554.Character.Character.Humanoid.Health == 0
                            end
                            vu546.Character.HumanoidRootPart.CFrame = v553
                        end
                    end
                end)
            end
        else
            _G.AmongusFaggot = false
        end
    end)
end
if game:GetService("Workspace"):WaitForChild("Merchants"):FindFirstChild("SantaMerchant") then
    v61:NewToggle("Auto Present", "ToggleInfo", function(p561)
        if p561 then
            local vu562 = game:GetService("Players")
            local vu563 = vu562.LocalPlayer
            _G.Santa = true
            while _G.Santa do
                wait()
                pcall(function()
                    local v564 = vu562
                    local v565, v566, v567 = pairs(v564:GetChildren())
                    while true do
                        local v568
                        v567, v568 = v565(v566, v567)
                        if v567 == nil then
                            break
                        end
                        if table.find(_G.KILL, v568.Name) and (v568.Backpack:FindFirstChildOfClass("Tool") and v568.Character.Humanoid.Health == 100) then
                            local vu569 = v568.Name
                            local v570 = vu563.Character.HumanoidRootPart.CFrame
                            repeat
                                wait(0)
                                workspace.Merchants.SantaMerchant.Clickable.Retum:FireServer()
                            until vu563.Backpack:FindFirstChild("Present") or _G.Santa == false
                            local v571, v572, v573 = pairs(vu563.Backpack:GetChildren())
                            while true do
                                local vu574
                                v573, vu574 = v571(v572, v573)
                                if v573 == nil then
                                    break
                                end
                                if vu574:IsA("Tool") and string.find(vu574.Name, "Present") then
                                    local v575 = vu574.Name
                                    vu563.Character.Humanoid:EquipTool(vu574)
                                    repeat
                                        task.wait()
                                        pcall(function()
                                            vu563.Character.HumanoidRootPart.CFrame = vu569.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 2.5)
                                            vu574:Activate()
                                        end)
                                    until not vu563.Character:FindFirstChild(v575)
                                    vu563.Character.HumanoidRootPart.CFrame = v570
                                end
                            end
                        end
                    end
                end)
            end
        else
            _G.Santa = false
            _G.KILL = {}
        end
    end)
end
v61:NewDropdown("----------------------------------------------------------------------------", "", {
    "Ignore it"
}, function()
end)
local v576, v577, v578 = pairs(game:GetService("Players"):GetChildren())
local v579 = {}
while true do
    local v580
    v578, v580 = v576(v577, v578)
    if v578 == nil then
        break
    end
    table.insert(v579, v580.Name)
end
local vu582 = v61:NewDropdown("Select Guy", "", v579, function(p581)
    Choose = p581
end)
v61:NewButton("Refresh PLR List", "Refreshes Dropdown", function(_)
    local v583, v584, v585 = pairs(game:GetService("Players"):GetChildren())
    local v586 = {}
    while true do
        local v587
        v585, v587 = v583(v584, v585)
        if v585 == nil then
            break
        end
        table.insert(v586, v587.Name)
    end
    vu582:Refresh(v586)
end)
v61:NewButton("Teleport", "", function()
    local v588, v589, v590 = pairs(game:GetService("Workspace"):GetChildren())
    while true do
        local v591
        v590, v591 = v588(v589, v590)
        if v590 == nil then
            break
        end
        if v591.Name == Choose then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v591.HumanoidRootPart.CFrame
        end
    end
end)
v61:NewButton("Printer Data", "", function()
    local v592, v593, v594 = pairs(game.Players:GetChildren())
    while true do
        local v595
        v594, v595 = v592(v593, v594)
        if v594 == nil then
            break
        end
        if v595.Name == Choose then
            local v596, v597, v598 = pairs(game.workspace.UserData["User_" .. v595.UserId].Data:GetDescendants())
            local v599 = {
                "DefenseLevel",
                "MeleeLevel",
                "SniperLevel",
                "SwordLevel",
                "HakiLevel"
            }
            local v600 = {
                "Cash",
                "Bounty",
                "Kills",
                "KaizuKills",
                "KaizuSoloKills",
                "Shop_RemoveDF",
                "GemsBought",
                "ExpertiseLevel",
                "Tea",
                "ZombiesKilled",
                "RewardDaily",
                "RewardHourly"
            }
            local v601 = {
                "DevilFruit",
                "DFT1Defense",
                "DFT1Melee",
                "DFT1Sniper",
                "DFT1Sword"
            }
            local v602 = {
                "DevilFruit2",
                "DFT2Defense",
                "DFT2Melee",
                "DFT2Sniper",
                "DFT2Sword"
            }
            local v603 = {
                "StoredDF6",
                "StoredDF5",
                "StoredDF4"
            }
            local v604 = {
                "StoredDF3",
                "StoredDF2",
                "StoredDF1"
            }
            local v605 = {
                "StoredDF12",
                "StoredDF11",
                "StoredDF10"
            }
            local v606 = {
                "StoredDF9",
                "StoredDF8",
                "StoredDF7"
            }
            while true do
                local v607
                v598, v607 = v596(v597, v598)
                if v598 == nil then
                    break
                end
                if table.find(v599, v607.Name) or (table.find(v600, v607.Name) or (table.find(v601, v607.Name) or table.find(v602, v607.Name))) then
                    print(Choose, v607.Name, v607.Value)
                end
            end
            local v608, v609, v610 = pairs(game.workspace.UserData["User_" .. v595.UserId].Data:GetDescendants())
            while true do
                local v611
                v610, v611 = v608(v609, v610)
                if v610 == nil then
                    break
                end
                if table.find(v605, v611.Name) or (table.find(v606, v611.Name) or (table.find(v603, v611.Name) or table.find(v604, v611.Name))) then
                    print(Choose, v611.Name, v611.Value)
                end
            end
        end
    end
end)
v61:NewButton("Copy Guy Outfit", "ButtonInfo", function()
    local v612, v613, v614 = pairs(game.workspace:GetChildren())
    while true do
        local v615
        v614, v615 = v612(v613, v614)
        if v614 == nil then
            return
        end
        if v615.Name == Choose then
            local v616 = game.Players["" .. Choose].UserId
            local v617 = tostring(game.Players.LocalPlayer.UserId)
            local v618 = Workspace.UserData["User_" .. v617].Data
            _G.lol = "Up"
            _G.Face = Workspace.UserData["User_" .. v616].Data.CC_Face.Value
            _G.Hair = Workspace.UserData["User_" .. v616].Data.CC_Hair.Value
            _G.HairColor = Workspace.UserData["User_" .. v616].Data.CC_Hair_Color.Value
            _G.Torso = Workspace.UserData["User_" .. v616].Data.CC_Torso.Value
            _G.TorsoColor = Workspace.UserData["User_" .. v616].Data.CC_Torso_Color.Value
            _G.Arms = Workspace.UserData["User_" .. v616].Data.CC_Arms.Value
            _G.ArmsColor = Workspace.UserData["User_" .. v616].Data.CC_Arms_Color.Value
            _G.Legs = Workspace.UserData["User_" .. v616].Data.CC_Legs.Value
            _G.LegsColor = Workspace.UserData["User_" .. v616].Data.CC_Legs_Color.Value
            _G.Hands = Workspace.UserData["User_" .. v616].Data.CC_Hands.Value
            _G.HandsColor = Workspace.UserData["User_" .. v616].Data.CC_Hands_Color.Value
            _G.Feet = Workspace.UserData["User_" .. v616].Data.CC_Feet.Value
            _G.FeetColor = Workspace.UserData["User_" .. v616].Data.CC_Feet_Color.Value
            _G.AccessoryA = Workspace.UserData["User_" .. v616].Data.CC_ExtrasA.Value
            _G.AccessoryColorA = Workspace.UserData["User_" .. v616].Data.CC_ExtrasA_Color.Value
            _G.AccessoryB = Workspace.UserData["User_" .. v616].Data.CC_ExtrasB.Value
            _G.AccessoryColorB = Workspace.UserData["User_" .. v616].Data.CC_ExtrasB_Color.Value
            _G.AccessoryC = Workspace.UserData["User_" .. v616].Data.CC_ExtrasC.Value
            _G.AccessoryColorC = Workspace.UserData["User_" .. v616].Data.CC_ExtrasC_Color.Value
            while true do
                task.wait()
                if v618.CC_Hair.Value ~= _G.Hair then
                    _G.nobug = v618.CC_Hair.Value
                    workspace.UserData["User_" .. v617].UpdateClothing_Hair:FireServer(_G.lol)
                    repeat
                        task.wait()
                    until v618.CC_Hair.Value ~= _G.nobug or v618.CC_Hair.Value == _G.Hair
                end
                if v618.CC_Hair.Value == _G.Hair then
                    while true do
                        task.wait()
                        if v618.CC_Hair_Color.Value ~= _G.HairColor then
                            _G.nobug = v618.CC_Hair_Color.Value
                            workspace.UserData["User_" .. v617].UpdateClothing_Hair_Color:FireServer(_G.lol)
                            repeat
                                task.wait()
                            until v618.CC_Hair_Color.Value ~= _G.nobug or v618.CC_Hair_Color.Value == _G.HairColor
                        end
                        if v618.CC_Hair_Color.Value == _G.HairColor then
                            while true do
                                task.wait()
                                if v618.CC_Torso.Value ~= _G.Torso then
                                    _G.nobug = v618.CC_Torso.Value
                                    workspace.UserData["User_" .. v617].UpdateClothing_Torso:FireServer(_G.lol)
                                    repeat
                                        task.wait()
                                    until v618.CC_Torso.Value ~= _G.nobug or v618.CC_Torso.Value == _G.Torso
                                end
                                if v618.CC_Torso.Value == _G.Torso then
                                    while true do
                                        task.wait()
                                        if v618.CC_Torso_Color.Value ~= _G.TorsoColor then
                                            _G.nobug = v618.CC_Torso_Color.Value
                                            workspace.UserData["User_" .. v617].UpdateClothing_Torso_Color:FireServer(_G.lol)
                                            repeat
                                                task.wait()
                                            until v618.CC_Torso_Color.Value ~= _G.nobug or v618.CC_Torso_Color.Value == _G.TorsoColor
                                        end
                                        if v618.CC_Torso_Color.Value == _G.TorsoColor then
                                            while true do
                                                task.wait()
                                                if v618.CC_Arms.Value ~= _G.Arms then
                                                    _G.nobug = v618.CC_Arms.Value
                                                    workspace.UserData["User_" .. v617].UpdateClothing_Arms:FireServer(_G.lol)
                                                    repeat
                                                        task.wait()
                                                    until v618.CC_Arms.Value ~= _G.nobug or v618.CC_Arms.Value == _G.Arms
                                                end
                                                if v618.CC_Arms.Value == _G.Arms then
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    task.wait()
    if v618.CC_Arms_Color.Value ~= _G.ArmsColor then
        _G.nobug = v618.CC_Arms_Color.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Arms_Color:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Arms_Color.Value ~= _G.nobug or v618.CC_Arms_Color.Value == _G.ArmsColor
    end
    if v618.CC_Arms_Color.Value ~= _G.ArmsColor then
    else
    end
    task.wait()
    if v618.CC_Legs.Value ~= _G.Legs then
        _G.nobug = v618.CC_Legs.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Legs:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Legs.Value ~= _G.nobug or v618.CC_Legs.Value == _G.Legs
    end
    if v618.CC_Legs.Value ~= _G.Legs then
    else
    end
    task.wait()
    if v618.CC_Legs_Color.Value ~= _G.LegsColor then
        _G.nobug = v618.CC_Legs_Color.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Legs_Color:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Legs_Color.Value ~= _G.nobug or v618.CC_Legs_Color.Value == _G.LegsColor
    end
    if v618.CC_Legs_Color.Value ~= _G.LegsColor then
    else
    end
    task.wait()
    if v618.CC_Face.Value ~= _G.Face then
        _G.nobug = v618.CC_Face.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Face:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Face.Value ~= _G.nobug or v618.CC_Face.Value == _G.Face
    end
    if v618.CC_Face.Value ~= _G.Face then
    else
    end
    task.wait()
    if v618.CC_Hands.Value ~= _G.Hands then
        _G.nobug = v618.CC_Hands.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Hands:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Hands.Value ~= _G.nobug or v618.CC_Hands.Value == _G.Hands
    end
    if v618.CC_Hands.Value ~= _G.Hands then
    else
    end
    task.wait()
    if v618.CC_Hands_Color.Value ~= _G.HandsColor then
        _G.nobug = v618.CC_Hands_Color.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Hands_Color:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Hands_Color.Value ~= _G.nobug or v618.CC_Hands_Color.Value == _G.HandsColor
    end
    if v618.CC_Hands_Color.Value ~= _G.HandsColor then
    else
    end
    task.wait()
    if v618.CC_Feet.Value ~= _G.Feet then
        _G.nobug = v618.CC_Feet.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Feet:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Feet.Value ~= _G.nobug or v618.CC_Feet.Value == _G.Feet
    end
    if v618.CC_Feet.Value ~= _G.Feet then
    else
    end
    task.wait()
    if v618.CC_Feet_Color.Value ~= _G.FeetColor then
        _G.nobug = v618.CC_Feet_Color.Value
        workspace.UserData["User_" .. v617].UpdateClothing_Feet_Color:FireServer(_G.lol)
        repeat
            task.wait()
        until v618.CC_Feet_Color.Value ~= _G.nobug or v618.CC_Feet_Color.Value == _G.FeetColor
    end
    if v618.CC_Feet_Color.Value ~= _G.FeetColor then
    end
    workspace.UserData["User_" .. v617].UpdateClothing_Extras:FireServer("A", _G.AccessoryA, _G.AccessoryColorA)
    workspace.UserData["User_" .. v617].UpdateClothing_Extras:FireServer("B", _G.AccessoryB, _G.AccessoryColorB)
    workspace.UserData["User_" .. v617].UpdateClothing_Extras:FireServer("C", _G.AccessoryC, _G.AccessoryColorC)
	
end)
v61:NewDropdown("Teleport Islands", "sex", {
    "SamHouse",
    "SamDisco",
    "FisherMan",
    "Expertise",
    "Lucy",
    "StarterIsland",
    "Emotes Seller",
    "StarterCave",
    "Bed in Mixer House",
    "Island Shaped Like Ur Dick",
    "Big Snow",
    "Small Snow",
    "Viet/Thai Home",
    "Marine Castle",
    "Purple Ass Island",
    "Forest",
    "Sand Castle",
    "Pursuer Island",
    "Kaizu",
    "Ur Mom"
}, function(p619)
    if p619 == "SamHouse" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1309, 218, - 1329)
    end
    if p619 == "SamDisco" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1543, 264, 2132)
    end
    if p619 == "FisherMan" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1698, 216, - 327)
    end
    if p619 == "Expertise" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(903, 270, 1219)
    end
    if p619 == "Lucy" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 278, 4949)
    end
    if p619 == "StarterIsland" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107, 265, - 37)
    end
    if p619 == "Emotes Seller" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1517, 260, 2168)
    end
    if p619 == "StarterCave" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 31, 246, - 917)
    end
    if p619 == "Forest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 6029, 402, 1)
    end
    if p619 == "Bed in Mixer House" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1988, 234, 577)
    end
    if p619 == "Island Shaped Like Ur Dick" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3202, 357, 1668)
    end
    if p619 == "Big Snow" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6646, 418, - 1479)
    end
    if p619 == "Small Snow" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1843, 222, 3408)
    end
    if p619 == "Viet/Thai Home" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 2600, 254, 1065)
    end
    if p619 == "Marine Castle" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 3011, 412, - 3969)
    end
    if p619 == "Purple Ass Island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 5215, 516, - 7765)
    end
    if p619 == "Sand Castle" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1005, 224, - 3338)
    end
    if p619 == "Pursuer Island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4855, 570, - 7131)
    e
