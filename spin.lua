pcall(function()
    getgenv().UI_CLOSED = false
    getgenv().AUTH_SUCCESS = false
    getgenv().SCRIPT_KEY = nil
    
    local coreGui = game:GetService("CoreGui")
    if coreGui:FindFirstChild("SalunaKeySystemUI") then
        coreGui.SalunaKeySystemUI:Destroy()
    end
    if coreGui:FindFirstChild("WindUI") then
        coreGui.WindUI:Destroy()
    end
    
    local lighting = game:GetService("Lighting")
    if lighting:FindFirstChild("SalunaUIBlur") then
        lighting.SalunaUIBlur:Destroy()
    end
end)

local result = (function()
    getgenv().UI_CLOSED = false
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    
    local Colors = {
        background = Color3.fromRGB(13, 17, 23),
        surface = Color3.fromRGB(22, 27, 34),
        surfaceLight = Color3.fromRGB(30, 36, 44),
        primary = Color3.fromRGB(80, 40, 180),
        primaryDark = Color3.fromRGB(60, 30, 140),
        primaryGlow = Color3.fromRGB(120, 80, 220),
        accent = Color3.fromRGB(136, 87, 224),
        success = Color3.fromRGB(47, 183, 117),
        successDark = Color3.fromRGB(37, 153, 97),
        successGlow = Color3.fromRGB(67, 203, 137),
        error = Color3.fromRGB(248, 81, 73),
        textPrimary = Color3.fromRGB(230, 237, 243),
        textSecondary = Color3.fromRGB(139, 148, 158),
        textMuted = Color3.fromRGB(110, 118, 129),
        border = Color3.fromRGB(48, 54, 61),
        borderLight = Color3.fromRGB(63, 71, 79),
        glass = Color3.fromRGB(255, 255, 255),
        neonBlue = Color3.fromRGB(0, 229, 255),
        neonPurple = Color3.fromRGB(187, 134, 252)
    }
    
    local function hasFileSystemSupport()
        local hasWritefile = pcall(function() return type(writefile) == "function" end)
        local hasReadfile = pcall(function() return type(readfile) == "function" end)
        local hasIsfile = pcall(function() return type(isfile) == "function" end)
        return hasWritefile and hasReadfile and hasIsfile
    end
    
    local fileSystemSupported = hasFileSystemSupport()
    local KEY_FILE = "SalunaHub_SavedKey.txt"
    
    local function saveVerifiedKey(key)
        if not fileSystemSupported then return false end
        return pcall(function() writefile(KEY_FILE, key) end)
    end
    
    local function loadVerifiedKey()
        if not fileSystemSupported then return nil end
        local ok, content = pcall(function() return readfile(KEY_FILE) end)
        return (ok and content) and content or nil
    end

    local function loadUIFactory()
        return function(Colors, Players, TweenService, UserInputService, Lighting)
            local IconAssets = {
                shield = 84528813312016, x = 73070135088117, key = 128426502701541,
                link = 73034596791310, check = 83827110621355
            }
            
            local function createIconImage(name, size, color)
                local id = IconAssets[name]
                if id then
                    local img = Instance.new("ImageLabel")
                    img.BackgroundTransparency = 1
                    img.Size = UDim2.new(0, size or 18, 0, size or 18)
                    img.Image = "rbxassetid://" .. tostring(id)
                    img.ImageColor3 = color or Color3.fromRGB(255, 255, 255)
                    img.ScaleType = Enum.ScaleType.Fit
                    return img
                end
                local lbl = Instance.new("TextLabel")
                lbl.BackgroundTransparency = 1
                lbl.Size = UDim2.new(0, size or 18, 0, size or 18)
                lbl.TextScaled = true
                lbl.Font = Enum.Font.SourceSansBold
                lbl.TextColor3 = color or Color3.fromRGB(255, 255, 255)
                lbl.Text = ({ shield = "🛡️", key = "🔑", link = "🔗", x = "✕", check = "✓" })[name] or "🔘"
                return lbl
            end

            return function(self)
                if self.gui then self.gui:Destroy() end
                
                self.gui = Instance.new("ScreenGui")
                self.gui.Name = "SalunaKeySystemUI"
                self.gui.ResetOnSpawn = false
                self.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                self.gui.IgnoreGuiInset = true
                
                local backdrop = Instance.new("Frame", self.gui)
                backdrop.Size = UDim2.new(1, 0, 1, 0)
                backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                backdrop.BackgroundTransparency = 0.4
                backdrop.BorderSizePixel = 0
                
                local blur = Instance.new("BlurEffect", Lighting)
                blur.Size = 16
                blur.Name = "SalunaUIBlur"
                
                local container = Instance.new("Frame", backdrop)
                container.Name = "Container"
                local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
                local viewportSize = workspace.CurrentCamera.ViewportSize
                
                if isMobile then
                    container.Size = UDim2.new(0.6, 0, 0, math.min(320, viewportSize.Y * 0.8))
                else
                    container.Size = UDim2.new(0, 580, 0, 320)
                end
                container.Position = UDim2.new(0.5, 0, 0.5, 0)
                container.AnchorPoint = Vector2.new(0.5, 0.5)
                container.BackgroundColor3 = Colors.surface
                Instance.new("UICorner", container).CornerRadius = UDim.new(0, 14)
                
                local containerStroke = Instance.new("UIStroke", container)
                containerStroke.Color = Colors.border
                containerStroke.Thickness = 1
                containerStroke.Transparency = 0.3
                
                local shadow = Instance.new("Frame", backdrop)
                shadow.Size = UDim2.new(1, 40, 1, 40)
                shadow.Position = UDim2.new(0.5, 0, 0.5, 6)
                shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                shadow.BackgroundTransparency = 0.7
                shadow.ZIndex = 0
                Instance.new("UICorner", shadow).CornerRadius = UDim.new(0, 18)
                
                local glowFrame = Instance.new("Frame", backdrop)
                glowFrame.Size = UDim2.new(1, 60, 1, 60)
                glowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                glowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                glowFrame.BackgroundColor3 = Colors.primary
                glowFrame.BackgroundTransparency = 0.95
                glowFrame.ZIndex = -1
                Instance.new("UICorner", glowFrame).CornerRadius = UDim.new(0, 30)

                TweenService:Create(glowFrame, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.9, Size = UDim2.new(1, 80, 1, 80)}):Play()
                
                local topBar = Instance.new("Frame", container)
                topBar.Size = UDim2.new(1, 0, 0, 45)
                topBar.BackgroundColor3 = Colors.background
                topBar.ZIndex = 10
                Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)

                local topBarFix = Instance.new("Frame", topBar)
                topBarFix.Size = UDim2.new(1, 0, 0, 10)
                topBarFix.Position = UDim2.new(0, 0, 1, -10)
                topBarFix.BackgroundColor3 = Colors.background
                
                local brandLogo = Instance.new("Frame", topBar)
                brandLogo.Size = UDim2.new(0, 200, 1, 0)
                brandLogo.Position = UDim2.new(0, 20, 0, 0)
                brandLogo.BackgroundTransparency = 1
                brandLogo.ZIndex = 11

                local brandLogoIcon = createIconImage("shield", 20, Colors.primary)
                brandLogoIcon.AnchorPoint = Vector2.new(0, 0.5)
                brandLogoIcon.Position = UDim2.new(0, 0, 0.5, 0)
                brandLogoIcon.ZIndex = 11
                brandLogoIcon.Parent = brandLogo

                local brandLogoText = Instance.new("TextLabel", brandLogo)
                brandLogoText.BackgroundTransparency = 1
                brandLogoText.Size = UDim2.new(1, -30, 1, 0)
                brandLogoText.Position = UDim2.new(0, 28, 0, 0)
                brandLogoText.Text = "SALUNA HUB KEY SYSTEM"
                brandLogoText.TextColor3 = Colors.textPrimary
                brandLogoText.TextSize = 15
                brandLogoText.Font = Enum.Font.GothamSemibold
                brandLogoText.TextXAlignment = Enum.TextXAlignment.Left
                brandLogoText.ZIndex = 11
                
                local closeButton = Instance.new("TextButton", topBar)
                closeButton.Size = UDim2.new(0, 30, 0, 30)
                closeButton.Position = UDim2.new(1, -40, 0.5, 0)
                closeButton.AnchorPoint = Vector2.new(0, 0.5)
                closeButton.BackgroundColor3 = Colors.error
                closeButton.BackgroundTransparency = 0.8
                closeButton.Text = ""
                closeButton.ZIndex = 11
                Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)

                local closeIcon = createIconImage("x", 16, Colors.textPrimary)
                closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                closeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
                closeIcon.ZIndex = 12
                closeIcon.Parent = closeButton
                
                local contentArea = Instance.new("Frame", container)
                contentArea.Size = UDim2.new(1, -40, 1, -65)
                contentArea.Position = UDim2.new(0, 20, 0, 55)
                contentArea.BackgroundTransparency = 1
                
                local titleSection = Instance.new("Frame", contentArea)
                titleSection.Size = UDim2.new(1, 0, 0, 85)
                titleSection.Position = UDim2.new(0, 0, 0, 5)
                titleSection.BackgroundTransparency = 1
                
                local iconFrame = Instance.new("Frame", titleSection)
                iconFrame.Size = UDim2.new(0, 52, 0, 52)
                iconFrame.Position = UDim2.new(0.5, -26, 0, 0)
                iconFrame.BackgroundColor3 = Colors.surfaceLight
                Instance.new("UICorner", iconFrame).CornerRadius = UDim.new(0, 12)
                
                local iconStroke = Instance.new("UIStroke", iconFrame)
                iconStroke.Color = Colors.primary
                iconStroke.Thickness = 2
                iconStroke.Transparency = 0.5
                
                local mainIcon = createIconImage("shield", 26, Color3.fromRGB(255, 255, 255))
                mainIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                mainIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
                mainIcon.Parent = iconFrame
                
                local titleText = Instance.new("TextLabel", titleSection)
                titleText.Size = UDim2.new(1, 0, 0, 24)
                titleText.Position = UDim2.new(0, 0, 0, 58)
                titleText.BackgroundTransparency = 1
                titleText.Text = self.title
                titleText.TextColor3 = Colors.textPrimary
                titleText.TextSize = 17
                titleText.Font = Enum.Font.GothamBold
                
                local subtitleText = Instance.new("TextLabel", titleSection)
                subtitleText.Size = UDim2.new(1, 0, 0, 18)
                subtitleText.Position = UDim2.new(0, 0, 0, 82)
                subtitleText.BackgroundTransparency = 1
                subtitleText.Text = self.subtitle
                subtitleText.TextColor3 = Colors.textSecondary
                subtitleText.TextSize = 13
                subtitleText.Font = Enum.Font.Gotham
                
                local inputSection = Instance.new("Frame", contentArea)
                inputSection.Size = UDim2.new(1, 0, 0, 46)
                inputSection.Position = UDim2.new(0, 0, 0, 115)
                inputSection.BackgroundColor3 = Colors.surfaceLight
                Instance.new("UICorner", inputSection).CornerRadius = UDim.new(0, 10)
                
                local inputStroke = Instance.new("UIStroke", inputSection)
                inputStroke.Color = Colors.border
                inputStroke.Thickness = 1
                inputStroke.Transparency = 0.5
                
                local keyIcon = createIconImage("key", 18, Colors.primary)
                keyIcon.AnchorPoint = Vector2.new(0, 0.5)
                keyIcon.Position = UDim2.new(0, 14, 0.5, 0)
                keyIcon.Parent = inputSection
                
                local keyInput = Instance.new("TextBox", inputSection)
                keyInput.Size = UDim2.new(1, -50, 1, 0)
                keyInput.Position = UDim2.new(0, 40, 0, 0)
                keyInput.BackgroundTransparency = 1
                keyInput.PlaceholderText = "Enter your verification key"
                keyInput.PlaceholderColor3 = Colors.textMuted
                keyInput.Text = ""
                keyInput.TextColor3 = Colors.textPrimary
                keyInput.TextSize = 14
                keyInput.TextXAlignment = Enum.TextXAlignment.Left
                keyInput.Font = Enum.Font.Gotham
                keyInput.ClearTextOnFocus = false
                
                local buttonSection = Instance.new("Frame", contentArea)
                buttonSection.Size = UDim2.new(1, 0, 0, 40)
                buttonSection.Position = UDim2.new(0, 0, 0, 175)
                buttonSection.BackgroundTransparency = 1
                
                local getLinkButton = Instance.new("TextButton", buttonSection)
                getLinkButton.Size = UDim2.new(0.48, 0, 1, 0)
                getLinkButton.BackgroundColor3 = Colors.primary
                getLinkButton.Text = ""  
                getLinkButton.AutoButtonColor = false
                Instance.new("UICorner", getLinkButton).CornerRadius = UDim.new(0, 10)

                local getLinkIcon = createIconImage("link", 16, Color3.fromRGB(255, 255, 255))
                getLinkIcon.AnchorPoint = Vector2.new(0, 0.5)
                getLinkIcon.Position = UDim2.new(0, 12, 0.5, 0)
                getLinkIcon.Parent = getLinkButton

                local getLinkText = Instance.new("TextLabel", getLinkButton)
                getLinkText.Name = "ButtonText"
                getLinkText.Size = UDim2.new(1, 0, 1, 0)
                getLinkText.BackgroundTransparency = 1
                getLinkText.Text = "Get Key Link"
                getLinkText.TextColor3 = Color3.fromRGB(255, 255, 255)
                getLinkText.Font = Enum.Font.GothamSemibold
                getLinkText.TextSize = 14
                
                local verifyButton = Instance.new("TextButton", buttonSection)
                verifyButton.Size = UDim2.new(0.48, 0, 1, 0)
                verifyButton.Position = UDim2.new(0.52, 0, 0, 0)
                verifyButton.BackgroundColor3 = Colors.success
                verifyButton.Text = ""
                verifyButton.AutoButtonColor = false
                Instance.new("UICorner", verifyButton).CornerRadius = UDim.new(0, 10)

                local verifyIcon = createIconImage("check", 16, Color3.fromRGB(255, 255, 255))
                verifyIcon.AnchorPoint = Vector2.new(0, 0.5)
                verifyIcon.Position = UDim2.new(0, 12, 0.5, 0)
                verifyIcon.Parent = verifyButton

                local verifyText = Instance.new("TextLabel", verifyButton)
                verifyText.Name = "ButtonText"
                verifyText.Size = UDim2.new(1, 0, 1, 0)
                verifyText.BackgroundTransparency = 1
                verifyText.Text = "Verify Key"
                verifyText.TextColor3 = Color3.fromRGB(255, 255, 255)
                verifyText.Font = Enum.Font.GothamSemibold
                verifyText.TextSize = 14
                
                local statusBar = Instance.new("Frame", container)
                statusBar.Size = UDim2.new(1, -40, 0, 2)
                statusBar.Position = UDim2.new(0.5, 0, 1, -14)
                statusBar.AnchorPoint = Vector2.new(0.5, 0)
                statusBar.BackgroundColor3 = Colors.border
                
                local statusText = Instance.new("TextLabel", container)
                statusText.BackgroundTransparency = 1
                statusText.Text = ""
                statusText.TextColor3 = Colors.textSecondary
                statusText.Font = Enum.Font.Gotham
                statusText.TextSize = 12
                statusText.Size = UDim2.new(1, -40, 0, 20)
                statusText.Position = UDim2.new(0.5, 0, 1, -38)
                statusText.AnchorPoint = Vector2.new(0.5, 0)
                statusText.Visible = false
                
                self.elements = {
                    backdrop = backdrop, container = container, iconFrame = iconFrame,
                    title = titleText, subtitle = subtitleText, getLinkButton = getLinkButton,
                    inputFrame = inputSection, keyInput = keyInput, verifyButton = verifyButton,
                    statusBar = statusBar, statusText = statusText, inputStroke = inputStroke,
                    closeButton = closeButton
                }
                
                local function setupAnimations()
                    local elements = self.elements
                    if elements.closeButton then
                        elements.closeButton.MouseEnter:Connect(function()
                            TweenService:Create(elements.closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
                        end)
                        elements.closeButton.MouseLeave:Connect(function()
                            TweenService:Create(elements.closeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.8}):Play()
                        end)
                    end
                    if elements.keyInput and elements.inputStroke then
                        elements.keyInput.Focused:Connect(function()
                            TweenService:Create(elements.inputStroke, TweenInfo.new(0.2), {Color = Colors.primary, Thickness = 2, Transparency = 0}):Play()
                        end)
                        elements.keyInput.FocusLost:Connect(function()
                            TweenService:Create(elements.inputStroke, TweenInfo.new(0.2), {Color = Colors.border, Thickness = 1, Transparency = 0.5}):Play()
                        end)
                    end
                end
                
                self.gui.Parent = game:GetService("CoreGui")
                self.gui.AncestryChanged:Connect(function(_, parent)
                    if parent == nil then
                        local uiBlur = Lighting:FindFirstChild("SalunaUIBlur")
                        if uiBlur then uiBlur:Destroy() end
                    end
                end)
                
                self.updateStatus = function(self, message, color, duration)
                    local st = self.elements.statusText
                    local sb = self.elements.statusBar
                    if st then
                        st.Text = message
                        st.TextColor3 = color or Colors.textSecondary
                        st.Visible = true
                        if sb then
                            TweenService:Create(sb, TweenInfo.new(0.2), {BackgroundColor3 = color or Colors.border}):Play()
                        end
                        if duration and duration > 0 then
                            task.delay(duration, function()
                                if st and st.Text == message then st.Visible = false end
                            end)
                        end
                    end
                end
                
                self.close = function(self)
                    if not self.gui then return end
                    getgenv().UI_CLOSED = true
                    TweenService:Create(self.elements.container, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(self.elements.backdrop, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    task.wait(0.2)
                    local uiBlur = Lighting:FindFirstChild("SalunaUIBlur")
                    if uiBlur then uiBlur:Destroy() end
                    self.gui:Destroy()
                    self.gui = nil
                end
                
                setupAnimations()
                return self.gui
            end
        end 
    end 
    
    local UI = {}
    UI.__index = UI
    
    function UI.new(options)
        local self = setmetatable({}, UI)
        self.options = options or {}
        self.title = self.options.title or "Saluna Hub Authentication"
        self.subtitle = self.options.subtitle or "Powered by Panda V3 Library"
        self.gui = nil
        self._connections = {}
        return self
    end
    
    UI.createUI = function(self)
        local UIFactory = loadUIFactory()
        if UIFactory then
            local uiBuilder = UIFactory(Colors, Players, TweenService, UserInputService, Lighting)
            uiBuilder(self)
        end
        
        if self.elements and self.elements.closeButton then
            table.insert(self._connections, self.elements.closeButton.MouseButton1Click:Connect(function()
                self:close()
            end))
        end
        
        if self.elements and self.elements.getLinkButton then
            table.insert(self._connections, self.elements.getLinkButton.MouseButton1Click:Connect(function()
                self:handleGetLink()
            end))
        end
        
        if self.elements and self.elements.verifyButton then
            table.insert(self._connections, self.elements.verifyButton.MouseButton1Click:Connect(function()
                self:handleVerifyKey()
            end))
        end
        
        return self.gui
    end

    -- ==============================================================
    -- TÍCH HỢP PANDA V3 LIBRARY (GET KEY LINK)
    -- ==============================================================
    function UI:handleGetLink()
        local link = Pelinda.GetKeyLink()
        if link then
            if setclipboard then
                setclipboard(link)
                self:updateStatus("Link copied to clipboard!", Colors.success, 3)
            else
                self:updateStatus("Check F9 Console for Link!", Colors.primary, 10)
                print("=======================================")
                print("GET YOUR SALUNA HUB KEY HERE:")
                print(link)
                print("=======================================")
            end
        else
            self:updateStatus("Failed to generate link!", Colors.error, 3)
        end
    end
    
    -- ==============================================================
    -- TÍCH HỢP PANDA V3 LIBRARY (VERIFY KEY)
    -- ==============================================================
    function UI:handleVerifyKey()
        local key = self.elements.keyInput.Text:gsub("%s+", "")
        
        if key == "" then
            self:updateStatus("Please enter a key", Colors.error, 3)
            return
        end
        
        self:updateStatus("Verifying with Panda V3...", Colors.primary, 0)
        self.elements.verifyButton.Interactable = false
        
        local result = Pelinda.Init({
            Key = key,
            Silent = true 
        })
        
        if result == "validated!!" then
            saveVerifiedKey(key)
            self:updateStatus("Key Verified Successfully! ✓", Colors.success, 0)
            
            getgenv().AUTH_SUCCESS = true
            getgenv().SCRIPT_KEY = key
            
            task.wait(1.5)
            self:close()
        elseif result == "error!!" then
            self:updateStatus("Connection error! Check your internet.", Colors.error, 3)
            self.elements.verifyButton.Interactable = true
        else
            self:updateStatus("Invalid Key or Wrong HWID!", Colors.error, 3)
            self.elements.verifyButton.Interactable = true
        end
    end

    -- ==============================================================
    -- HỆ THỐNG AUTO LOGIN & QUẢN LÝ KEY (V3)
    -- ==============================================================
    getgenv().AUTH_SUCCESS = false
    getgenv().UI_CLOSED = false

    local savedKey = loadVerifiedKey()
    local checkResult = Pelinda.Init({ Key = savedKey, Silent = true })

    if checkResult == "validated!!" then
        -- AUTO LOGIN THÀNH CÔNG -> BỎ QUA TẠO UI
        getgenv().AUTH_SUCCESS = true
        getgenv().UI_CLOSED = true 
        getgenv().SCRIPT_KEY = savedKey or "KEYLESS"
        print("Saluna Hub: Auto Login Successful! Key: " .. tostring(getgenv().SCRIPT_KEY))
    else
        -- CHƯA CÓ KEY HOẶC LỖI -> TẠO UI
        local ui = UI.new({})
        ui:createUI()

        if savedKey then
            ui:updateStatus("Saved key invalid. Please enter a valid key.", Colors.error, 3)
        else
            ui:updateStatus("Enter your key to continue.", Colors.textSecondary, 0)
        end

        while not getgenv().UI_CLOSED do
            task.wait(0.1)
        end
    end
    
    return getgenv().SCRIPT_KEY
end)()

if getgenv().AUTH_SUCCESS then
    print("Saluna Hub: Security Passed! Loading Main UI...")
-- ==============================================================
-- WorkPlaceForIrenStart
-- ==============================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
pcall(function()
    local userData = workspace:WaitForChild("UserData", 15)
    local store = userData and userData:WaitForChild("User_" .. LocalPlayer.UserId, 5)
    local finishedLoading = store and store:WaitForChild("FullyLoaded", 5)
    repeat 
        task.wait(0.2) 
    until finishedLoading 
        and finishedLoading.Value == true 
        and LocalPlayer.Character 
        and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
        and LocalPlayer:FindFirstChild("Backpack")
end)
local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local HttpService = cloneref(game:GetService("HttpService"))
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

everyClipboard = toclipboard
function toClipboard(txt)
if everyClipboard then
everyClipboard(tostring(txt))
end
end

local function getPlayerNames()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(names, player.Name)
        end
    end
    return names
end

local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
       vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
       task.wait(1)
       vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

Pedo = {
-- Lyla (59, 104), asa (56), exhausist (73) | Tester (57), Lead Mod (2)
-- CAIOHENRIQUEAL (178), utaaxghoul (82)
------------------ (Owner) ------------------
	2261590335, -- Chizewe
	451082957, -- leonardoe10
	621444804, -- leonardoe102
	7509929009, -- seijaye
------------------ (Mods And Lead) ------------------
	106625686, -- utaaxghoul
	630398541, -- CAIOHENRIQUEAL
	7429252089, -- fishemojii
------------------ (Scripter) ------------------
	4729622082, -- Szortks
	7124931877, -- NoUselessGuns
------------------ (Tester) ------------------
	2667971788, -- Ajediguy_101
	1214022304, -- ErikPhe
	2201988958, -- Only1_Elii
	5102955703, -- DaylightSparkIe
	1803111495, -- SumairuKarada
	899046300, -- Evil_Diabl01
	496472378, -- Evil_Diabl0
 	3581002119, -- AutumnThe10th
	4908183175, -- AutumnThe12th
	3237872631, -- Davidthehuy123 (wuis bò sữa Hào)
	3037580073, -- ZSuperHao (wuis bò sữa Hào)
	3683984680, -- CSM_OzWuisTrummOz (wuis bò sữa Hào)
	10284367056, -- ChimimiTuskAct5
	574279527, -- chuy50602
	350582998, -- atzayacatl
	3229877655, -- ingeNot
	1365802991, -- DavidElWaren
	70834888, -- Rafael67123
	302917261, -- Ethan7R9
	2216928244, -- YkzEthan
	2037887144, -- MigueljpcBR2020
	365816981, -- lilplayboybaby
	1509611573, -- IkkyMinecraft
	139928797, -- Chocolates607
	2450901579, -- ace4pika
	1899091513, -- NoobyMan0909
	1254019639, -- Infernatsuo
	1282966656, -- yMutucaPower
	446998191, -- sunvyer
	1028909461, -- GODoSLAYER
	30049170, -- Farquanetta
	2294161763, -- Hiroki_Ashima (Hiroki)
	1815878495, -- HirokiAshima
 	1016272655, -- Midoryaaaa_AllMight 
  	882319717, -- kisame_akatsu
------------------ (DayLightSparkIe friend) ------------------
	847736128, -- kingsallikingytytyt
	5578065256, -- toloveminty
	2631976445, -- MollaAmar
	1717671053, -- Trachead
	1625212519, -- AdrianTheLegacy
	1109396305, -- Unstoppable_YHbro
	4197121242, -- Abso_Delete
------------------ (lyla friend) ------------------
	218582549, -- Fectay 
	40562549, -- Apomyios
	1359959752, -- Ghilphea
	86830681, -- ocori
	1241926338, -- SealedArtemis
	311899311, -- NaIvatore
	2666569065, -- exhausist
	2008000886, -- COOKIE_HELMUT
	877606568, -- darkhert007
	611942699, -- xXAirNationXx
	3227009140, -- querocafeDEV
	2317759923, -- MTG_toojiikjsn1
	498827506, -- LuanRLF
	292418127, -- iikervin
	96400667, -- xDev_I
	1412131209, -- ArtoriaLawrence
	4150540156, -- Up2Pinn
	571687119, -- Jpblindaona
	2395869085, -- XD1rk_SenpaiX
	7688104097, -- dawayur
	934389490, -- Wand_Gui
	656022601, -- alphatoothlessrjj
	2365996236, -- Dtatapointsmeancoosl
	1379690013, -- Wxffuru
	389403845, -- mstrnavalha
	2939059468, -- ezbig008
	858965886, -- Meliodassrz
	589418401, -- Veabex
	916770647, -- igiveaccountsaway
	1515034415, -- SrGhostPolar67
	516171199, -- pantherarist
	4426276, -- ok7
	1042971374, -- Scirick02
	1001308673, -- theging058
	1352406537, -- Yecten
	427386850, -- sakuri020
	1686598326, -- crunch99x
	348932626, -- bigbigpapar9
	427895240, -- Zirenys
	1216587424, -- BTT_xXxZunChanXGsSs (Zun Thao)
	1118221366, -- Kaneki_KillYT
	2361317975, -- FenixFragmented
	1833865091, -- Uneepy
	381420950, -- NetoPTking
	1023831854, -- SeilaBRJ
	513583299, -- Crashneitor2D
------------------ (lyla2 friend) ------------------
	1264734877, -- ConstructionTaererr
	1131049700, -- Obscuv
	5155586085, -- Taquiomorfria
	5505857935, -- luckzinalt1 (luckzinalt)
	550878172, -- RayGamer1425
	3204457503, -- MikaelCBN
	3283431426, -- MeloettaPsychicType
	2450638200, -- jpblindaonae10
	403238427, -- kaveraso39
	1956336629, -- rareboxaccount431
	1427168873, -- x2Pedro3x
	3310559062, -- RagnaShiki
	1717237715, -- maxjoker3601
	193880287, -- pedrofox23
	1389939720, -- sofiagamere10
	1624521749, -- cleitin_alt
	154143633, -- binary2cris
	180203197, -- caique007oi
	1518198742, -- buggyzao
	493330518, -- lokigamer50983
	1543742591, -- Chafmp
	1491678866, -- de_bigodi
	1546978591, -- orderalt16
	946766920, -- OVOnitro
	1585691524, -- GonAltaa
	1749881719, -- GodsCreccc
	1601107090, -- barrierzin
	1567811777, -- LAWtheking_ope
	522408556, -- mercenario80
	1045892042, -- souf0da234
	1458339360, -- spinfolte
	1198968774, -- adrielv89
	1187154361, -- huntepiece
	439357590, -- ALMIRXSUPE
	561690899, -- viniogamerca
	183318778, -- tander2017
	1423518848, -- opeopeman
	1473690236, -- XxDarkBRxXz2
	810928776, -- renatoaraujo56
	529896346, -- wendellsecundario
	1059560143, -- swifitgaming3
	154433907, -- zanel56
	272085726, -- kaiwzx
	1194130017, -- poiatttt
	344532746, -- erick7111
	966134052, -- ManteigaGhouly
	647461177, -- luc4sggk
	376462257, -- Afronir
	277177717, -- MiguelBraitBr
	84687655, -- racecraftgamer17
	1012986257, -- ninjago_sm
	826470170, -- kmsjnm
	290093024, -- jonathan_bm
	1010492799, -- lorenzoeto123
	997732435, -- Ricardo4545q
	755897800, -- ligerinhobernardo456
	163710698, -- Garoto2008
	678201684, -- Prinze1545
	648889282, -- T0ris
	654736937, -- Hugo135791
------------------ (sei friend) ------------------
	1027085279, -- trungit2
	834790759, -- SpyMcPvP
	1812829477, -- MrPeab0dy1
	3242598122, -- gaggahnsggsbshgsvhah
	3112745239, -- pawering98
------------------ (asa friend) ------------------
	1870345378, -- wPeachy
	417759088, -- gxip
	1444848178, -- itachi132b
	3397491220, -- Saeriule
	1526152412, -- FlamingFastFlamingo
	2640524128, -- frr_q
	9030923308, -- Xawtasy
	3910413408, -- DKUWM_73YY
	9216136710, -- Sohrsanez384
	7891946741, -- Butter_bread0954
	3068478473, -- is_Nataliez
	9030955981, -- Oawtasy
	1717624523, -- FadeDeadz
	1281387877, -- maxkunGXDTH
	306838079, -- NorthernSeb
	3704969299, -- hopehopehopeo_o
	2395024022, -- Winchelleeee
	1832028650, -- its_ericaawxzyll
	4701508818, -- gufkjdzdglkzhbflzv
	199812849, -- crlflwrs
	3781426490, -- rinnqtt
	2778486749, -- Whoareyou4124
	2766836170, -- 27Numbers290
	3076337758, -- Whydidmy_accgetban
	1321040676, -- masterlegend0919
	5136460763, -- lokobebe2010
	1704669906, -- DylanOliverYT
	1133110596, -- BackyPlayer
	2744420573, -- Dream_oda
	1758654100, -- unlau1
	4177262608, -- roblox_user_4177262608
	1848774978, -- jtsityar
	1189522089, -- Zero_PlaysX
------------------ (asa friend) ------------------
	5043459468, -- Lennox_in20
	1784074863, -- ScroomIsGod
	136711426, -- ChaddenOne
	3464239388, -- jepoychir
------------------ (Helper Or Staff) ------------------
	17536163, -- izzyman5
	449255847, -- baconchaosblox
	38894087, -- TheDemonOfDemons
	2455897761, -- SIDER_Z1000
	7688104097 -- dawayur
}

local BlacklistedStrings = {
    "leonardoe",
	"AutumnThe",
	"Autumn",
    "toojiikjsn",
    "dogwalk",
	"Crashneitor",
	"Crash2D",
	"rareboxaccount",
	"rareboxalt",
	"Scirick",
	"crunch",
	"luckzinalt",
	"Butter_bread",
	"Fragmented",
	"Ajediguy",
	"sparkIe",
	"LuanRLF",
	"Evil_Diabl0",
	"CAIORIKE",
	"CAIOHENRI",
	"Chizewe",
	"Chizewa",
	"jpblindaona",
	"kaveraso",
	"maxjoker",
	"pedrofox",
	"sofiagamer",
	"cleitin",
	"caique00",
	"lokigamer",
	"orderalt",
	"mercenario",
	"StringFruit",
	"Kyur",
	"tolove",
	"souf0da",
	"adrielv",
	"XxDarkBRxX",
	"renatoaraujo",
	"swifitgaming",
	"racecraftgamer",
	"lorenzo",
	"trungit",
	"MrPeab0dy",
	"Sohrsanez",
	"Natali",
	"awtasy",
	"FadeDead",
	"Whoareyou",
	"izzyman",
	"Szort"
}
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local WebhookURL = "https://discord.com/api/webhooks/1504295535224557711/WnnJ1AsAua8M1iZNuZxhHMZmOFUxKRlKOKD5qwyTbVstjoBk7WADe-YQ8_MkDjbwVoZ0"
local function SendWebhookAndKick(adminName, kickReason)
    local data = {
        ["embeds"] = {
            {
                ["title"] = "🚨 Saluna Notify | Moderators Detected",
                ["description"] = "**Moderator or Tester:** `" .. adminName .. "` is Online!\n**GameID:** `" .. game.PlaceId .. "`\n**JobID:** `" .. game.JobId .. "`",
                ["type"] = "rich",
                ["color"] = tonumber(0xff8200),
            }
        }
    }
    if httprequest then
        pcall(function()
            httprequest({
                Url = WebhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end)
    end
if not getgenv().disableantimod then
    task.wait(0.2) 
    LocalPlayer:Kick(kickReason)
end
end
local function check(player)
    for _, id in pairs(Pedo) do
        if player.UserId == id then
            SendWebhookAndKick(player.Name, "Safety Kick: Moderator/Tester (" .. player.Name .. ") is in the server.")
            return true
        end
    end
    for _, str in pairs(BlacklistedStrings) do
        if string.find(string.lower(player.Name), string.lower(str)) then
            SendWebhookAndKick(player.Name, "Safety Kick: Moderator/Tester Clone (" .. str .. ") is in the server.")
            return true 
        end
    end
    return false
end
for _, v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        if check(v) then 
            break 
        end
    end
end
Players.PlayerAdded:Connect(function(v)
    check(v)
end)
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local WebhookURL = "https://discord.com/api/webhooks/1505506052345692222/dWWZkPmPcfZx_xf1hZUTi5lrbQIEppFfqtJyQb-i2kvSvd1Eb9ZoSW11MBF2vsTZwMnZ"
local lastJoinedName = "Unknown"
if getgenv().SalunaSusTracker then
    getgenv().SalunaSusTracker:Disconnect()
end
getgenv().SalunaSusTracker = Players.PlayerAdded:Connect(function(player)
    lastJoinedName = player.Name
end)
local function SendKickAlert(kickMessage)
    local requestFunc = request or http_request or (syn and syn.request)
    if not requestFunc then return end
    
    local localPlayer = Players.LocalPlayer
    local jobId = game.JobId
    local playerListStr = ""
    local currentPlayers = Players:GetPlayers()
    
    for i, p in ipairs(currentPlayers) do
        local marker = ""
        if p.Name == lastJoinedName then
            marker = " 🔴 **[SUS: Last Joined]**"
        end
        
        -- 🎯 Lấy số ngày tuổi tài khoản của từng người chơi (nếu lỗi thì mặc định là 0)
        local pAge = p.AccountAge or 0
        
        -- Thêm số ngày tuổi [Age: ... days] vào định dạng dòng của từng người
        playerListStr = playerListStr .. string.format("**[%d]** %s (@%s) - `[%d days]`%s\n", i, p.DisplayName, p.Name, pAge, marker)
    end
    
    local suspectNote = ""
    if lastJoinedName ~= "Unknown" then
        suspectNote = "\n**Primary Suspect (Last Joined):** @" .. lastJoinedName .. "\n"
    end
    
    local embedDescription = "**Account:** " .. localPlayer.Name .. "\n"
    embedDescription = embedDescription .. "**Reason:** " .. kickMessage .. "\n"
    embedDescription = embedDescription .. "**JobId:** `" .. jobId .. "`\n"
    embedDescription = embedDescription .. suspectNote
    embedDescription = embedDescription .. "\n**📋 Players in Server at time of kick:**\n" .. playerListStr
    
    if string.len(embedDescription) > 4000 then
        embedDescription = string.sub(embedDescription, 1, 4000) .. "\n... [List Truncated]"
    end
    
    local data = {
        ["embeds"] = {{
            ["title"] = "🚨 BANNED ALERT 🚨",
            ["description"] = embedDescription,
            ["color"] = 16711680, -- Red Alert
            ["footer"] = { ["text"] = "Saluna Hub Security System" },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }
    
    task.spawn(function()
        pcall(function()
            requestFunc({
                Url = WebhookURL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = HttpService:JSONEncode(data)
            })
        end)
    end)
end
GuiService.ErrorMessageChanged:Connect(function(errorMessage)
    if errorMessage and errorMessage ~= "" then
        local lowerMsg = string.lower(errorMessage)
        if string.find(lowerMsg, "administrator") or string.find(lowerMsg, "banned") or string.find(lowerMsg, "kicked by this experience") then
            SendKickAlert(errorMessage)
        end
    end
end)

    do  
     safezonedestroyspace =  game:GetService("Workspace"):FindFirstChild("SafeZoneOuterSpacePart")  
    if safezonedestroyspace then 
    safezonedestroyspace:Destroy() 
    end 
    end

    do  
     safezonedestroyspace2 =  game:GetService("Workspace"):FindFirstChild("SafeZoneOuterSpacePart2")  
    if safezonedestroyspace2 then 
    safezonedestroyspace2:Destroy() 
    end 
    end

	do
     fishingplace =  game:GetService("Workspace"):FindFirstChild("fishingplace")  
    if fishingplace then 
    fishingplace:Destroy() 
    end 
    end
     SafeZoneOuterSpace = Instance.new("Part",game:GetService("Workspace"))
    SafeZoneOuterSpace.Name = "SafeZoneOuterSpacePart"
    SafeZoneOuterSpace.Size = Vector3.new(200,3,200)
    SafeZoneOuterSpace.Position = Vector3.new(-200000, 10000, -200000)
    SafeZoneOuterSpace.Anchored = true

     SafeZoneOuterSpace2 = Instance.new("Part",game:GetService("Workspace"))
    SafeZoneOuterSpace2.Name = "SafeZoneOuterSpacePart2"
    SafeZoneOuterSpace2.Size = Vector3.new(200,3,200)
    SafeZoneOuterSpace2.Position = Vector3.new(200000, 10000, 200000)
    SafeZoneOuterSpace2.Anchored = true

     fishingplace = Instance.new("Part",game:GetService("Workspace"))
    fishingplace.Name = "fishingplace"
    fishingplace.Size = Vector3.new(2,1,2)
    fishingplace.Position = Vector3.new((math.random(30000, 40000)),208,(math.random(30000, 40000)))
    fishingplace.Anchored = true

local WindUI

do
	local ok, result = pcall(function()
		return require("./src/Init")
	end)
	if ok then
		WindUI = result
	else
		if cloneref(game:GetService("RunService")):IsStudio() then
			WindUI = require(cloneref(ReplicatedStorage:WaitForChild("WindUI"):WaitForChild("Init")))
		else
			WindUI =
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
		end
	end
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local noClipParts = {}

local function refreshNoClipCache(char)
    noClipParts = {} -- Xóa dữ liệu cũ
    if not char then return end
    
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") then
            table.insert(noClipParts, obj)
        end
    end
end

refreshNoClipCache(plr.Character)

plr.CharacterAdded:Connect(function(char)
    -- Đợi nhân vật load xong bộ khung cơ bản
    char:WaitForChild("HumanoidRootPart", 5)
    refreshNoClipCache(char)
    
    char.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("BasePart") then
            table.insert(noClipParts, descendant)
        end
    end)
end)

if getgenv().SalunaNoclipConnection then
    getgenv().SalunaNoclipConnection:Disconnect()
    getgenv().SalunaNoclipConnection = nil
end

getgenv().SalunaNoclipConnection = RunService.Stepped:Connect(function()
    if getgenv().AutoFindCompassV2 or getgenv().afhaki or getgenv().compassboolean or getgenv().apac or getgenv().bringMobs or getgenv().afarmbounty or getgenv().aafarm or getgenv().autoSquareTP then
        -- Chỉ lặp qua mảng BasePart đã được dọn sẵn bằng ipairs (nhanh hơn pairs)
        for _, part in ipairs(noClipParts) do
            if part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

local Window = WindUI:CreateWindow({
	Title = "Saluna Hub | WindUI",
	Author = "Made by Irenkiss",
	Folder = "SalunaData",
	Icon = "rbxassetid://88270735565435",
	IconSize = 22*2,
	NewElements = true,
	Size = UDim2.fromOffset(700,700),

	HideSearchBar = false,

	OpenButton = {
		Title = "Saluna HUB", 
		CornerRadius = UDim.new(1, 0), 
		StrokeThickness = 3, 
		Enabled = true, 
		Draggable = true,
		OnlyMobile = false,
		Scale = 0.5,
		Color = ColorSequence.new( 
			Color3.fromHex("#30FF6A"),
			Color3.fromHex("#e7ff2f")
		),
	},
	Topbar = {
		Height = 44,
		ButtonsType = "Mac", 
	},
})

local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Green = Color3.fromHex("#10C550")
local Grey = Color3.fromHex("#83889E")
local Blue = Color3.fromHex("#257AF7")
local Red = Color3.fromHex("#EF4F1D")

local function parseJSON(luau_table, indent, level, visited)
	indent = indent or 2
	level = level or 0
	visited = visited or {}
	local currentIndent = string.rep(" ", level * indent)
	local nextIndent = string.rep(" ", (level + 1) * indent)
	if luau_table == nil then
		return "null"
	end
	local dataType = type(luau_table)
	if dataType == "table" then
		if visited[luau_table] then
			return '"[Circular Reference]"'
		end
		visited[luau_table] = true
		local isArray = true
		local maxIndex = 0
		for k, _ in pairs(luau_table) do
			if type(k) == "number" and k > maxIndex then
				maxIndex = k
			end
			if type(k) ~= "number" or k <= 0 or math.floor(k) ~= k then
				isArray = false
				break
			end
		end
		local count = 0
		for _ in pairs(luau_table) do
			count = count + 1
		end
		if count ~= maxIndex and isArray then
			isArray = false
		end
		if count == 0 then
			return "{}"
		end
		if isArray then
			if count == 0 then
				return "[]"
			end
			local result = "[\n"
			for i = 1, maxIndex do
				result = result .. nextIndent .. parseJSON(luau_table[i], indent, level + 1, visited)
				if i < maxIndex then
					result = result .. ","
				end
				result = result .. "\n"
			end
			result = result .. currentIndent .. "]"
			return result
		else
			local result = "{\n"
			local first = true
			local keys = {}
			for k in pairs(luau_table) do
				table.insert(keys, k)
			end
			table.sort(keys, function(a, b)
				if type(a) == type(b) then
					return tostring(a) < tostring(b)
				else
					return type(a) < type(b)
				end
			end)
			for _, k in ipairs(keys) do
				local v = luau_table[k]
				if not first then
					result = result .. ",\n"
				else
					first = false
				end
				if type(k) == "string" then
					result = result .. nextIndent .. '"' .. k .. '": '
				else
					result = result .. nextIndent .. '"' .. tostring(k) .. '": '
				end
				result = result .. parseJSON(v, indent, level + 1, visited)
			end
			result = result .. "\n" .. currentIndent .. "}"
			return result
		end
	elseif dataType == "string" then
		local escaped = luau_table:gsub("\\", "\\\\")
		escaped = escaped:gsub('"', '\\"')
		escaped = escaped:gsub("\n", "\\n")
		escaped = escaped:gsub("\r", "\\r")
		escaped = escaped:gsub("\t", "\\t")
		return '"' .. escaped .. '"'
	elseif dataType == "number" then
		return tostring(luau_table)
	elseif dataType == "boolean" then
		return luau_table and "true" or "false"
	elseif dataType == "function" then
		return '"function"'
	else
		return '"' .. dataType .. '"'
	end
end

local function tableToClipboard(luau_table, indent)
	indent = indent or 4
	local jsonString = parseJSON(luau_table, indent)
	setclipboard(jsonString)
	return jsonString
end

	local AboutTab = Window:Tab({
		Title = "About",
		Desc = "Information",
		Icon = "solar:info-square-bold",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	local SalunaSection = AboutTab:Section({
		Title = "About Saluna",
	})

	SalunaSection:Space()

	SalunaSection:Section({
		Title = "Saluna",
		TextSize = 24,
		FontWeight = Enum.FontWeight.SemiBold,
	})

	SalunaSection:Section({
		Title = "Saluna (a.k.a Irenkiss Trần)\nOwner and Developer of Saluna Hub for OPL.\n Any pronouns are fine.",
		TextSize = 18,
		TextTransparency = 0.35,
		FontWeight = Enum.FontWeight.Medium,
	})

	SalunaSection:Space()

	AboutTab:Space()

	local AboutSection = AboutTab:Section({
		Title = "About WindUI",
	})
	AboutSection:Space()
	AboutSection:Section({
		Title = "What is WindUI?",
		TextSize = 24,
		FontWeight = Enum.FontWeight.SemiBold,
	})

	AboutSection:Space()

	AboutTab:Space()

	AboutSection:Section({
		Title = "WindUI is a stylish, open-source UI (User Interface) library specifically designed for Roblox Script Hubs.\nDeveloped by Footagesus (.ftgs, Footages).\nIt aims to provide developers with a modern, customizable, and easy-to-use toolkit for creating visually appealing interfaces within Roblox.\nThe project is primarily written in Lua (Luau), the scripting language used in Roblox.",
		TextSize = 18,
		TextTransparency = 0.35,
		FontWeight = Enum.FontWeight.Medium,
	})

	AboutSection:Space()

	local BanSection = AboutTab:Section({
		Title = "Ban Alert",
	})

	BanSection:Space()

	BanSection:Section({
		Title = "What can get you banned?",
		TextSize = 24,
		FontWeight = Enum.FontWeight.SemiBold,
	})

	BanSection:Space()

	AboutTab:Space()

	BanSection:Section({
		Title = "1. Fast mixer farming / Teleporting (TP).\n2. Fast Merlin package farming.\n3. Suspicious Remote Event firing and exploits.\n4. Being reported by other players or moderators.\n5. Dog Walkers (Moderator alt accounts/clones).\n...\n\nUse at your own risk. I am not responsible for any bans or account suspensions resulting from the use of this script.",
		TextSize = 18,
		TextTransparency = 0.35,
		FontWeight = Enum.FontWeight.Medium,
	})

do
    local InviteCode = "gUe8TabHmF"
    local DiscordAPI = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=true&with_expiration=true"
    local Response = WindUI.cloneref(game:GetService("HttpService"))
        :JSONDecode(WindUI.Creator.Request and WindUI.Creator.Request({
            Url = DiscordAPI,
            Method = "GET",
            Headers = {
                ["User-Agent"] = "WindUI/Saluna",
                ["Accept"] = "application/json",
            },
        }).Body or "{}")

AboutTab:Section({
        Title = "Community & Support",
    })

    if Response and Response.guild then
        AboutTab:Paragraph({
            Title = tostring(Response.guild.name),
            Desc = tostring(Response.guild.description or "Join Our Discord Server For Newest Infomation!"),
            Image = "https://cdn.discordapp.com/icons/"
                .. Response.guild.id
                .. "/"
                .. Response.guild.icon
                .. ".png?size=1024",
            Thumbnail = "https://cdn.discordapp.com/banners/" .. Response.guild.id .. "/" .. (Response.guild.banner or "") .. ".png?size=512",
            ImageSize = 48,
            Buttons = {
                {
                    Title = "Join Discord",
                    Icon = "link",
                    Variant = "Primary",
                    Callback = function()
                        setclipboard("https://discord.gg/" .. InviteCode)
                        WindUI:Notify({
                            Title = "Discord",
                            Content = "Copied Link",
				Icon = "solar:bell-bold",
                            Duration = 3,
				CanClose = false,
                        })
                    end,
                },
            },
        })
    else
        AboutTab:Paragraph({
            Title = "Saluna Hub Discord",
            Desc = "Mã mời: " .. InviteCode .. "\nClick to copy the link.",
            Image = "solar:share-circle-bold",
            Buttons = {
                {
                    Title = "Copy Invite Link",
                    Icon = "link",
                    Callback = function()
                        setclipboard("https://discord.gg/" .. InviteCode)
                    end,
                },
            },
        })
    end
end

	local PassiveTab = Window:Tab({
		Title = "Passive",
		Desc = "Passive Function Running In Background",
		Icon = "rbxassetid://115696377709394",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	local AntiMods = PassiveTab:Section({
		Title = "Anti-Mods",
Desc = "Instantly disconnects you if server moderation (Moderator/Tester) is detected. This protection runs automatically in the background."
	})

PassiveTab:Space()

PassiveTab:Toggle({
		Title = "Disable Anti-Mods",
		Flag = "Saluna_DisableAntiMods",
		Desc = "Disable auto-kick if moderator/tester joined your server.",
		Callback = function(anti)
			getgenv().disableantimod = anti
			if getgenv().SalunaAntiModThread then
				task.cancel(getgenv().SalunaAntiModThread)
				getgenv().SalunaAntiModThread = nil
			end
			if getgenv().disableantimod then return end
			if not getgenv().disableantimod then
				getgenv().SalunaAntiModThread = task.spawn(function()
					for _, v in pairs(Players:GetPlayers()) do
						if v ~= LocalPlayer then
							if check(v) then 
								break 
							end
						end
					end
				end)
			end
		end,
	})

PassiveTab:Space()

	local AntiAFK = PassiveTab:Section({
		Title = "Anti-AFK",
		Desc = "Disables the standard 20-minute idle timeout."
	})

PassiveTab:Space({ Columns = 4 })

	local HideName = PassiveTab:Section({
		Title = "Stats Privacy Mode",
		Desc = "Hide your username in the stats tab."
	})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function GetLvl(statName)
    local userData = workspace:FindFirstChild("UserData")
    local userFolder = userData and userData:FindFirstChild("User_" .. LocalPlayer.UserId)
    local data = userFolder and userFolder:FindFirstChild("Data")
    local statObj = data and data:FindFirstChild(statName)
    return statObj and statObj.Value or 0
end
local function GetCharAndRemote(powerName)
    local char = LocalPlayer.Character
    if not char then return nil, nil end -- Đang chờ hồi sinh thì trả về nil
    local powers = char:FindFirstChild("Powers")
    local powerFolder = powers and powers:FindFirstChild(powerName)
    local remote = powerFolder and powerFolder:FindFirstChild("RemoteEvent")
    return char, remote
end

local function FarmSmelt()
    local swordLvl = GetLvl("SwordLvl")
    local defLvl = GetLvl("DefenseLvl")
    if swordLvl >= 50 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Smelt" do 
                task.wait(0.1)
                local char, remote = GetCharAndRemote("Smelt")
                if char and remote then
                    local rightArm = char:FindFirstChild("Right Arm")
                    if rightArm and not rightArm:FindFirstChild("SmeltSword") then
                        remote:FireServer("SmeltPower1")
                        task.wait(1)
                    else
                        remote:FireServer("SmeltAnim1")
                    end
                end
            end
        end)
    end
    if defLvl >= 20 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Smelt" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Smelt")
                if char and remote then
                    local usingSmelt = char:FindFirstChild("SmeltBody")
                    if usingSmelt and usingSmelt.Value == false then
                        remote:FireServer("SmeltPower2")
                    end
                end
            end
        end)
    end
    if defLvl >= 50 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Smelt" do 
                task.wait(0.3)
                local char, remote = GetCharAndRemote("Smelt")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("SmeltPower3", "Attempt", root.CFrame * CFrame.new(0, 0, -5))
                    end
                end
            end
        end)
    end
end

local function BodySmelt()
local defLvl = GetLvl("DefenseLvl")
	if defLvl >= 20 then
        task.spawn(function()
            while getgenv().abody and getgenv().bodymethod == "Smelt" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Smelt")
                if char and remote then
                    local usingSmelt = char:FindFirstChild("SmeltBody")
                    if usingSmelt and usingSmelt.Value == false then
                        remote:FireServer("SmeltPower2")
                    end
                end
            end
        end)
	end
end

local function BodyHot()
local defLvl = GetLvl("DefenseLvl")
	if defLvl >= 50 then
        task.spawn(function()
            while (getgenv().abody and getgenv().bodymethod == "Hot") or (getgenv().aafarm and getgenv().fmethod == "Hot") do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Hot")
                if char and remote then
                    local usingHot = char:FindFirstChild("HotBody")
                    if usingHot and usingHot.Value == false then
                        remote:FireServer("HotPower2")
                    end
                end
            end
        end)
	end
end

local function FarmDiamond()
local swordLvl = GetLvl("SwordLvl")
local defLvl = GetLvl("DefenseLvl")
     if swordLvl >= 50 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Diamond" do 
                task.wait(0.1)
                local char, remote = GetCharAndRemote("Diamond")
                if char and remote then
                    local rightArm = char:FindFirstChild("Right Arm")
                    if rightArm and not rightArm:FindFirstChild("DiamondSword") then
                        remote:FireServer("DiamondPower1")
                        task.wait(1)
                    else
                        remote:FireServer("DiamondAnim1")
                    end
                end
            end
        end)
    end

    if defLvl >= 20 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Diamond" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Diamond")
                if char and remote then
                    local usingDiamond = char:FindFirstChild("DiamondBody")
                    if usingDiamond and usingDiamond.Value == false then
                        remote:FireServer("DiamondPower2")
                    end
                end
            end
        end)
    end

    if defLvl >= 80 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Diamond" do 
                task.wait(0.3)
                local char, remote = GetCharAndRemote("Diamond")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("DiamondPower3", "StartCharging", root.CFrame * CFrame.new(0, 0, -5))
						task.wait(4.2)
                        remote:FireServer("DiamondPower3", "StopCharging", root.CFrame * CFrame.new(0, 0, -5),100)
                    end
                end
            end
        end)
    end
end

local function FarmCandy()
    local swordLvl = GetLvl("SwordLvl")
    local defLvl = GetLvl("DefenseLvl")
    local meleeLvl = GetLvl("MeleeLvl")
    if swordLvl >= 50 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Candy" do 
                task.wait(0.1)
                local char, remote = GetCharAndRemote("Candy")
                if char and remote then
                    local rightArm = char:FindFirstChild("Right Arm")
                    if rightArm and not rightArm:FindFirstChild("CandyBlade1") then
                        remote:FireServer("CandyPower1")
                        task.wait(1)
                    else
                        remote:FireServer("CandyAnim1")
                    end
                end
            end
        end)
    end

    if defLvl >= 75 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Candy" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Candy")
                if char and remote then
                    local usingCandy = char:FindFirstChild("UsingCandyBody")
                    if usingCandy and usingCandy.Value == false then
                        remote:FireServer("CandyPower2")
                    end
                end
            end
        end)
    end

    if defLvl >= 125 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Candy" do 
                task.wait(0.3)
                local char, remote = GetCharAndRemote("Candy")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("CandyPower4", "Start")
                    end
                end
            end
        end)
    end

    if meleeLvl >= 150 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Candy" do 
                task.wait(0.3)
                local char, remote = GetCharAndRemote("Candy")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("CandyPower5", "", root.CFrame * CFrame.new(0, 0, -5))
                    end
                end
            end
        end)
    end
end

local function BodyCandy()
    local defLvl = GetLvl("DefenseLvl")
    if defLvl >= 75 then
        task.spawn(function()
            while getgenv().abody and getgenv().bodymethod == "Candy" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Candy")
                if char and remote then
                    local usingCandy = char:FindFirstChild("UsingCandyBody")
                    if usingCandy and usingCandy.Value == false then
                        remote:FireServer("CandyPower2")
                    end
                end
            end
        end)
    end
end

local function BodySnow()
    local defLvl = GetLvl("DefenseLvl")
    if defLvl >= 100 then
        task.spawn(function()
            while getgenv().abody and getgenv().bodymethod == "Snow" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Snow")
                if char and remote then
                    local usingSnow = char:FindFirstChild("UsingSnowBody")
                    if usingSnow and usingSnow.Value == false then
                        remote:FireServer("SnowPower2")
                    end
                end
            end
        end)
    end
end

local function FarmBarrier()
    local meleeLvl = GetLvl("MeleeLvl")
    if meleeLvl >= 200 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Barrier" do 
                task.wait(0.1)
                local char, remote = GetCharAndRemote("Barrier")
                if char and remote then
                    local rightArm = char:FindFirstChild("Right Arm")
                    if rightArm and not rightArm:FindFirstChild("BarrierBlade") then
                        remote:FireServer("BarrierPower5")
                        task.wait(1)
                    else
                        remote:FireServer("BarrierAnim5")
                    end
                end
            end
        end)
    end
    if meleeLvl >= 50 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Barrier" do 
                task.wait(0.3)
                local char, remote = GetCharAndRemote("Barrier")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("BarrierPower2", root.CFrame * CFrame.new(0, 0, -5))
                    end
                end
            end
        end)
    end
end

local function FarmGum()
    local meleeLvl = GetLvl("MeleeLvl")
    if meleeLvl >= 75 then
        task.spawn(function()
            while (getgenv().aafarm and getgenv().fmethod == "Gum") or (getgenv().ddmg and (getgenv().hakimethod1 == "Gum" or getgenv().hakimethod2 == "Gum")) do 
                task.wait()
                local char, remote = GetCharAndRemote("Gum")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("GumPower3", "2", root.CFrame * CFrame.new(0, 0, -1000))
                    end
                end
            end
        end)
    end
end

local function HakiSlash()
    local swordLvl = GetLvl("SwordLvl")
    if swordLvl >= 50 then
        task.spawn(function()
            while getgenv().ddmg and (getgenv().hakimethod1 == "Slash" or getgenv().hakimethod2 == "Slash") do 
                task.wait()
                local char, remote = GetCharAndRemote("Slash")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        local targetVector = (root.CFrame * CFrame.new(0, 0, -1000)).Position
                        remote:FireServer("SlashPower2", "StopCharging", targetVector)
                    end
                end
            end
        end)
    end
end

local function FarmMagma()
    local defLvl = GetLvl("DefenseLvl")
    local meleeLvl = GetLvl("MeleeLvl")
    if defLvl >= 200 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Magma" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Magma")
                if char and remote then
                    local usingMagma = char:FindFirstChild("UsingMagmaBody")
                    if usingMagma and usingMagma.Value == false then
                        remote:FireServer("MagmaPower2")
                    end
                end
            end
        end)
    end
    if defLvl >= 20 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Magma" do 
                task.wait(0.3)
                local char, remote = GetCharAndRemote("Magma")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("MagmaPower3", "Create")
                    end
                end
            end
        end)
    end
    if meleeLvl >= 50 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Magma" do 
                task.wait(0.15)
                local char, remote = GetCharAndRemote("Magma")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("MagmaPower1", "StopCharging", root.CFrame * CFrame.new(0, 0, -5))
                        task.wait(4)
                    end
                end
            end
        end)
    end
end

local function BodyMagma()
    local defLvl = GetLvl("DefenseLvl")
    if defLvl >= 200 then
        task.spawn(function()
            while getgenv().abody and getgenv().bodymethod == "Magma" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Magma")
                if char and remote then
                    local usingMagma = char:FindFirstChild("UsingMagmaBody")
                    if usingMagma and usingMagma.Value == false then
                        remote:FireServer("MagmaPower2")
                    end
                end
            end
        end)
    end
end

local function FarmVenom()
    local defLvl = GetLvl("DefenseLvl")
    local snipLvl = GetLvl("SniperLvl")
    if defLvl >= 200 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Venom" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Venom")
                if char and remote then
                    local usingVenom = char:FindFirstChild("UsingVenomBody")
                    if usingVenom and usingVenom.Value == false then
                        remote:FireServer("VenomPower2")
                    end
                end
            end
        end)
    end
    if defLvl >= 500 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Venom" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Venom")
                if char and remote then
                    local usingDemon = char:FindFirstChild("UsingVenomDemon")
                    if usingDemon and usingDemon.Value == false then
                        remote:FireServer("VenomPower6")
                    end
                end
            end
        end)
    end
    if snipLvl >= 400 then
        task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Venom" do 
                task.wait(0.15)
                local char, remote = GetCharAndRemote("Venom")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("VenomPower4", "StopCharging", root.CFrame * CFrame.new(0, 0, -5))
                        task.wait(4)
                    end
                end
            end
        end)
       task.spawn(function()
            while getgenv().aafarm and getgenv().fmethod == "Venom" do 
                task.wait(0.25)
                local char, remote = GetCharAndRemote("Venom")
                if char and remote then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        remote:FireServer("VenomPower3", "StopCharging", root.CFrame * CFrame.new(0, 0, -2))
                    end
                end
            end
        end)
    end
end

local function BodyVenom()
    local defLvl = GetLvl("DefenseLvl")
    if defLvl >= 200 then
        task.spawn(function()
            while getgenv().abody and getgenv().bodymethod == "Venom" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Venom")
                if char and remote then
                    local usingVenom = char:FindFirstChild("UsingVenomBody")
                    if usingVenom and usingVenom.Value == false then
                        remote:FireServer("VenomPower2")
                    end
                end
            end
        end)
    end
    if defLvl >= 500 then
        task.spawn(function()
            while getgenv().abody and getgenv().bodymethod == "Venom" do 
                task.wait(1)
                local char, remote = GetCharAndRemote("Venom")
                if char and remote then
                    local usingDemon = char:FindFirstChild("UsingVenomDemon")
                    if usingDemon and usingDemon.Value == false then
                        remote:FireServer("VenomPower6")
                    end
                end
            end
        end)
    end
end

local OPDList = Window:Section({
	Title = "OPD",
})

local GodModeSection = OPDList:Tab({
		Title = "Godmode",
		Icon = "rbxassetid://103071140529593",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	GodModeSection:Button({
		Title = "God Mode (Use Before Spawn)",
		Desc = "Invincible, but cannot deal damage without script. You still take water damage.",
		Callback = function()
			WindUI:Notify({
				Title = "Saluna Notify",
				Content = "God-mode Turned On",
				Icon = "solar:bell-bold",
				Duration = 3,
				CanClose = false,
			})
plr = game.Players.LocalPlayer
task.spawn(function()
    pcall(function()
        repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        local gui = plr:WaitForChild("PlayerGui")
        local loadFrame = gui:WaitForChild("Load", 5)
        if loadFrame and loadFrame.Enabled == true then
          loadFrame.Enabled = false
          workspace.CurrentCamera:remove()
task.wait(.1)
repeat task.wait() until game:GetService("Players").LocalPlayer.Character ~= nil
workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
workspace.CurrentCamera.CameraType = "Custom"
game:GetService("Players").LocalPlayer.CameraMinZoomDistance = 0.5
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 400
game:GetService("Players").LocalPlayer.CameraMode = "Classic"
game:GetService("Players").LocalPlayer.Character.Head.Anchored = false   
          end
    end)
end)
game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-1281.49988, 217.999985, -1352.99963, 1, 2.24093561e-08, -0.000126375235, -2.2418801e-08, 1, -7.47421396e-08, 0.000126375235, 7.47449675e-08, 1)
		end,
	})

local CompassSection = OPDList:Tab({
		Title = "Compass",
		Icon = "rbxassetid://127291858435618",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	CompassSection:Button({
		Title = "Claim AFK Reward",
		Callback = function()
local args = {
	"Claim"
}
workspace:WaitForChild("Merchants"):WaitForChild("AFK_NPC"):WaitForChild("Clickable"):WaitForChild("Remote"):FireServer(unpack(args))
		end,
	})

CompassSection:Space()

	CompassSection:Button({
		Title = "Claim Sam's Compasses",
		Callback = function()
local args = {
	"Claim10"
}
game:GetService("ReplicatedStorage"):WaitForChild("Connections"):WaitForChild("Claim_Sam"):FireServer(unpack(args))
		end,
	})

CompassSection:Toggle({
	Title = "Auto Claim Sam's Compasses",
	Flag = "Saluna_AutoClaimSam",
	Desc = "Only claim if the distance is under 5,000 studs.",
	Callback = function(autocs)
		getgenv().autocs = autocs
		if getgenv().SalunaAutoClaimSamThread then
			task.cancel(getgenv().SalunaAutoClaimSamThread)
			getgenv().SalunaAutoClaimSamThread = nil
		end
		if autocs then
			getgenv().SalunaAutoClaimSamThread = task.spawn(function()
				local plr = game.Players.LocalPlayer
				while getgenv().autocs do 
					task.wait(1) 
					pcall(function()
						local char = plr.Character
						local npc = workspace.Merchants:FindFirstChild("QuestMerchant2")
						if char and char:FindFirstChild("HumanoidRootPart") and npc and npc:FindFirstChild("HumanoidRootPart") then
							local pPos = char.HumanoidRootPart.Position
							local nPos = npc.HumanoidRootPart.Position
							local distance = (pPos - nPos).Magnitude
							local tokens = workspace.UserData["User_"..plr.UserId].Data.CompassTokens.Value
							if tokens > 0 and distance < 5000 then
								local args = {"Claim1"}
								game:GetService("ReplicatedStorage").Connections.Claim_Sam:FireServer(unpack(args))
								WindUI:Notify({
									Title = "Saluna Notify: Compasses",
									Content = "Claimed Compass (Distance: "..math.floor(distance) ..")",
									Icon = "solar:bell-bold",
									Duration = 3,
									CanClose = false,
								})
								task.wait(1) 
							end
						end
					end)
				end
			end)
		end
	end,
})

CompassSection:Space()

local stopYUntil = 0
CompassSection:Toggle({
    Title = "Auto Find Compass",
    Flag = "Saluna_AutoFindCompass",
    Desc = "Recommended to use with God Mode.",
    Callback = function(cpbl)
        getgenv().compassboolean = cpbl
        if getgenv().SalunaAutoFindCompassThread1 then
            task.cancel(getgenv().SalunaAutoFindCompassThread1)
            getgenv().SalunaAutoFindCompassThread1 = nil
        end
        if getgenv().SalunaAutoFindCompassThread2 then
            task.cancel(getgenv().SalunaAutoFindCompassThread2)
            getgenv().SalunaAutoFindCompassThread2 = nil
        end
        if not cpbl then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and hrp.Position.Y < 217 then
                    hrp.CFrame = CFrame.new(hrp.Position.X, 217, hrp.Position.Z) * hrp.CFrame.Rotation
                end
            end)
            return
        end
        getgenv().SalunaAutoFindCompassThread1 = task.spawn(function()
            while getgenv().compassboolean do 
                task.wait(0.2)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetChildren()) do
                            if v:IsA("Tool") and string.find(v.Name, "Compass") then
                                v:Activate()
                            end
                        end
                    end
                end)
            end
        end)
        getgenv().SalunaAutoFindCompassThread2 = task.spawn(function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local speedFast = 11.5     
            local speedSlow = 0.4    
            local minY, maxY = 215.9, 800
            local yStep = 2
            local tool = nil
            local arrow = nil
            local GOC_XOAY = -90
            local checkingHeight = false
            local calibrated = false
            local lastDir = nil
            local warmup = 0
            local yMode = 1
            local autoReverse = 1 
            local stopYUntil = 0 
            local function findCompass()
                for _, item in ipairs(plr.Backpack:GetChildren()) do
                    if item:IsA("Tool") and string.find(item.Name, "Compass") then return item end
                end
                for _, item in ipairs(char:GetChildren()) do
                    if item:IsA("Tool") and string.find(item.Name, "Compass") then return item end
                end
                return nil
            end
            local function resetTarget()
                tool = nil
                arrow = nil
                checkingHeight = false
                calibrated = false
                lastDir = nil
                warmup = 0
                autoReverse = 1
                stopYUntil = 0
            end
            while getgenv().compassboolean do
                task.wait()
                if not char or not char.Parent or not char:FindFirstChild("HumanoidRootPart") then
                    char = plr.Character or plr.CharacterAdded:Wait()
                    hrp = char:WaitForChild("HumanoidRootPart")
                end
                if not tool or not tool.Parent or not arrow then
                    if hrp then
                        hrp.CFrame = CFrame.new(hrp.Position.X, 800, hrp.Position.Z) * hrp.CFrame.Rotation
                        task.wait(0.1) 
                    end
                    resetTarget()
                    tool = findCompass()
                    if tool then
                        char.Humanoid:EquipTool(tool)
                        for i = 1, 10 do
                            arrow = tool:FindFirstChild("CompassArrow")
                            if arrow then break end
                            task.wait(0.2)
                        end
                        if arrow then
                            local tc = 0
                            pcall(function() tc = arrow.TriangleCount end)
                            GOC_XOAY = (tc == 42) and 90 or -90
                            task.wait(0.3) 
                        else
                            tool = nil 
                        end
                    end
                end
                if tool and arrow then
                    local rawDir = arrow.CFrame.LookVector
                    local baseDir = Vector3.new(rawDir.X, 0, rawDir.Z).Unit
                    local moveDir = (CFrame.Angles(0, math.rad(GOC_XOAY), 0) * baseDir).Unit * autoReverse
                    local currentSpeed = speedFast
                    warmup = warmup + 1
                    if not calibrated and warmup > 25 and warmup < 45 then
                        local visualNeedleDir = (CFrame.Angles(0, math.rad(GOC_XOAY), 0) * baseDir).Unit
                        if moveDir:Dot(visualNeedleDir) < 0.5 then 
                            autoReverse = -autoReverse
                            moveDir = -moveDir
                        end
                        calibrated = true
                        lastDir = moveDir
                    end
                    if calibrated and lastDir then
                        local dot = moveDir:Dot(lastDir)
                        if dot < 0.5 then 
                            checkingHeight = true
                        end
                    end
                    if checkingHeight then
                        currentSpeed = speedSlow 
                        local currentY = hrp.Position.Y
                        if currentY >= maxY then 
                            yMode = -1 
                            stopYUntil = 0
                        elseif currentY <= minY then 
                            yMode = 1 
                            if stopYUntil == 0 then
                                stopYUntil = tick() + 0.5
                            end
                        end
                        if stopYUntil > 0 and tick() <= stopYUntil then
                            hrp.CFrame = CFrame.new(hrp.Position.X, 211.8, hrp.Position.Z) * hrp.CFrame.Rotation
                        else
                            hrp.CFrame = hrp.CFrame + Vector3.new(0, yStep * yMode, 0)
                            if currentY > 213 then stopYUntil = 0 end
                        end
                    else
                        lastDir = moveDir
                        stopYUntil = 0
                    end
                    hrp.CFrame = hrp.CFrame + (moveDir * currentSpeed)
                else
                    task.wait(0.5)
                end
            end
        end)
    end,
})

CompassSection:Toggle({
    Title = "Auto Find Compass (v2.10)",
    Flag = "Saluna_AutoFindCompassV2",
    Desc = "Radial Sorting, Smart Delay. Recommended to use with God Mode.",
    Callback = function(state)
        getgenv().AutoFindCompassV2 = state
        
        -- 🛡️ CHỐNG LUỒNG MA
        if getgenv().CompassMainThread then task.cancel(getgenv().CompassMainThread) getgenv().CompassMainThread = nil end
        if getgenv().CompassClickThread then task.cancel(getgenv().CompassClickThread) getgenv().CompassClickThread = nil end
        
        -- Panic Button: Tắt tay là ép lên độ cao an toàn 217
        if not state then
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and hrp.Position.Y < 217 then
                    hrp.CFrame = CFrame.new(hrp.Position.X, 217, hrp.Position.Z) * hrp.CFrame.Rotation
                end
            end)
            return
        end
        
        -- 🚀 LUỒNG PHỤ: Activate Tool
        getgenv().CompassClickThread = task.spawn(function()
            while getgenv().AutoFindCompassV2 do
                task.wait(0.2)
                pcall(function()
                    local char = game.Players.LocalPlayer.Character
                    local tool = char and char:FindFirstChildOfClass("Tool")
                    if tool and string.find(tool.Name, "Compass") then
                        tool:Activate()
                    end
                end)
            end
        end)
        
        -- 🚀 LUỒNG CHÍNH
        getgenv().CompassMainThread = task.spawn(function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local humanoid = char:WaitForChild("Humanoid")
            
            local sectors = { {}, {}, {}, {}, {}, {}, {}, {} }
            local allCompasses = {}
            
            for _, item in ipairs(plr.Backpack:GetChildren()) do
                if item:IsA("Tool") and string.find(item.Name, "Compass") then table.insert(allCompasses, item) end
            end
            for _, item in ipairs(char:GetChildren()) do
                if item:IsA("Tool") and string.find(item.Name, "Compass") then table.insert(allCompasses, item) end
            end
            
            if #allCompasses == 0 then
                return
            end
            
            -- Bay lên trạm quét
            hrp.CFrame = CFrame.new(500.287994, 800, -2201.29785)
            task.wait(1) 
            
            -- ==========================================
            -- 🎯 KHÂU 2 (QUÉT): ÁP DỤNG LOGIC DELAY THÔNG MINH
            -- ==========================================
            for _, tool in ipairs(allCompasses) do
                if not getgenv().AutoFindCompassV2 then return end
                
                humanoid:EquipTool(tool)
                task.wait(0.15) 
                
                local oldArrow = tool:FindFirstChild("CompassArrow")
                tool:Activate() 
                
                if oldArrow then
                    task.wait(1) 
                else
                    task.wait(0.1) 
                    local timeout = tick()
                    while not tool:FindFirstChild("CompassArrow") and getgenv().AutoFindCompassV2 and (tick() - timeout) < 2 do
                        task.wait()
                    end
                end
                
                local arrow = nil
                for _, child in ipairs(tool:GetChildren()) do
                    if child.Name == "CompassArrow" then
                        arrow = child
                    end
                end
                
                if arrow then
                    local rawDir = arrow.CFrame.LookVector
                    local baseDir = Vector3.new(rawDir.X, 0, rawDir.Z).Unit
                    
                    local angle = math.atan2(baseDir.Z, baseDir.X)
                    if angle < 0 then angle = angle + (2 * math.pi) end
                    
                    local sectorIndex = math.clamp(math.floor(angle / (math.pi / 4)) + 1, 1, 8)
                    table.insert(sectors[sectorIndex], tool)
                end
            end
            
            humanoid:UnequipTools()
            task.wait(0.2)
            
            -- ==========================================
            -- 🎯 KHÂU 3 (ĐI ĐÀO)
            -- ==========================================
            for sectorId = 1, 8 do
                local currentGroup = sectors[sectorId]
                
                for _, tool in ipairs(currentGroup) do
                    if not getgenv().AutoFindCompassV2 then return end
                    if not tool or not tool:IsDescendantOf(game) then continue end
                    
                    humanoid:EquipTool(tool)
                    
                    local arrow = tool:WaitForChild("CompassArrow", 3)
                    
                    if arrow then
                        local speedFast = 11.5     
                        local speedSlow = 0.4    
                        local minY, maxY = 215.9, 800
                        local yStep = 2
                        
                        local tc = 0
                        pcall(function() tc = arrow.TriangleCount end)
                        local GOC_XOAY = (tc == 42) and 90 or -90
                        
                        local checkingHeight = false
                        local calibrated = false
                        local lastDir = nil
                        local warmup = 0
                        local yMode = 1
                        local autoReverse = 1 
                        local stopYUntil = 0
                        
                        while getgenv().AutoFindCompassV2 and tool.Parent == char and arrow.Parent do
                            task.wait()
                            
                            if not char or not char.Parent or not char:FindFirstChild("HumanoidRootPart") then
                                char = plr.Character or plr.CharacterAdded:Wait()
                                hrp = char:WaitForChild("HumanoidRootPart")
                                humanoid = char:WaitForChild("Humanoid")
                                humanoid:EquipTool(tool)
                            end
                            
                            local rawDir = arrow.CFrame.LookVector
                            local baseDir = Vector3.new(rawDir.X, 0, rawDir.Z).Unit
                            local moveDir = (CFrame.Angles(0, math.rad(GOC_XOAY), 0) * baseDir).Unit * autoReverse
                            local currentSpeed = speedFast
                            warmup = warmup + 1
                            if not calibrated and warmup > 5 then 
                                local visualNeedleDir = (CFrame.Angles(0, math.rad(GOC_XOAY), 0) * baseDir).Unit
                                if moveDir:Dot(visualNeedleDir) < 0.5 then 
                                    autoReverse = -autoReverse
                                    moveDir = -moveDir
                                end
                                calibrated = true
                                lastDir = moveDir
                            end
                            
                            if calibrated and lastDir then
                                local dot = moveDir:Dot(lastDir)
                                if dot < 0.5 then 
                                    if not checkingHeight then
                                        task.wait(0.1) 
                                        hrp.CFrame = CFrame.new(hrp.Position.X, 800, hrp.Position.Z) * hrp.CFrame.Rotation
                                        task.wait(0.1)
                                        checkingHeight = true 
                                    end
                                end
                            end
                            
                            if checkingHeight then
                                currentSpeed = speedSlow 
                                local currentY = hrp.Position.Y
                                if currentY >= maxY then 
                                    yMode = -1 
                                    stopYUntil = 0
                                elseif currentY <= minY then 
                                    yMode = 1 
                                    if stopYUntil == 0 then stopYUntil = tick() + 0.5 end
                                end
                                
                                if stopYUntil > 0 and tick() <= stopYUntil then
                                    hrp.CFrame = CFrame.new(hrp.Position.X, 211.8, hrp.Position.Z) * hrp.CFrame.Rotation
                                else
                                    hrp.CFrame = hrp.CFrame + Vector3.new(0, yStep * yMode, 0)
                                    if currentY > 213 then stopYUntil = 0 end
                                end
                            else
                                lastDir = moveDir
                                stopYUntil = 0
                            end
                            
                            hrp.CFrame = hrp.CFrame + (moveDir * currentSpeed)
                        end
                    end
                end
            end
        end)
    end,
})

CompassSection:Space()

	CompassSection:Button({
		Title = "Drop Compasses",
		Desc = "Drop all compasses from your inventory.",
		Callback = function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if string.find(v.Name, "Compass") then
v.Parent = game.Players.LocalPlayer.Character
v.Parent = workspace
end
end
		end,
	})

CompassSection:Toggle({
    Title = "Auto Grab Compasses",
    Flag = "Saluna_AutoGrabCompass",
    Desc = "Automatically pick up dropped compasses.",
    Callback = function(cpg)
        getgenv().cpg = cpg
        
        -- 🛡️ CHỐNG LUỒNG MA: Trảm luồng cũ ngay lập tức nếu nó đang chạy
        if getgenv().SalunaAutoGrabCompassThread then
            task.cancel(getgenv().SalunaAutoGrabCompassThread)
            getgenv().SalunaAutoGrabCompassThread = nil
        end
        
        if cpg then
            -- Gán luồng mới vào biến toàn cục để quản lý
            getgenv().SalunaAutoGrabCompassThread = task.spawn(function()
                while getgenv().cpg do 
                    task.wait() -- Tăng delay nhẹ để giảm áp lực CPU cho vòng lặp
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character
                        if char and char:FindFirstChild("Humanoid") then
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            
                            for _, child in ipairs(workspace:GetChildren()) do
                                if not getgenv().cpg then break end -- Thoát nhanh nếu tắt toggle
                                
                                if child:IsA("BackpackItem") and string.find(child.Name, "Compass") and child:FindFirstChild("Handle") then
                                    humanoid:EquipTool(child)
                                    task.wait() -- Delay nhỏ giữa mỗi lần equip để tránh nghẽn Remote
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

local DrinkSection = OPDList:Tab({
		Title = "Drinks",
		Icon = "rbxassetid://571306073",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	DrinkSection:Dropdown({
		Title = "Select Drink Type",
		Flag = "Saluna_DropdownDrinkType",
		Values = {
			"Cider+",
			"Juice+",
			"Lemonade+",
			"Smoothie+",
		},
		Value = nil,
		Callback = function(sld)
getgenv().drinktype = sld
if triggernotify == true then
WindUI:Notify({
				Title = "Saluna Notify: Drinks",
				Content = "Selected: "..sld,
				Icon = "solar:bell-bold",
				Duration = 2,
				CanClose = false,
			})
end
		end,
	})

	DrinkSection:Input({
		Title = "Drink Quantity",
		Flag = "Saluna_InputDrinkQuantity",
		Icon = "mouse",
		Desc = "Enter the number of drinks to purchase.",
		Callback = function(ipdrink)
getgenv().amountdrink = tonumber(ipdrink)
if triggernotify == true then
WindUI:Notify({
				Title = "Saluna Notify: Drinks",
				Content = "Amount: "..getgenv().amountdrink,
				Icon = "solar:bell-bold",
				Duration = 2,
				CanClose = false,
			})
end
end,
	})

	DrinkSection:Button({
		Title = "Buy Drinks",
		Desc = "Purchase the selected quantity of drinks.",
		Callback = function()
for i = 1, getgenv().amountdrink do
local args = {
	getgenv().drinktype
    }
    
workspace.Merchants.BetterDrinkMerchant.Clickable.ShopDrinksPlus.Clicked.Retum:FireServer(unpack(args))
end
		end,
	})

DrinkSection:Space()

	DrinkSection:Button({
		Title = "Instant Drink",
		Desc = "Consume drinks instantly.",
		Callback = function()
local char = game:GetService("Players").LocalPlayer.Character
char.Humanoid:UnequipTools() 
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if string.find(v.Name, "Juice") or string.find(v.Name, "Milk") or string.find(v.Name, "Cider") or string.find(v.Name, "Lemonade") or string.find(v.Name, "Smoothie") or string.find(v.Name, "Golden Apple") then
v.Parent = game:GetService("Players").LocalPlayer.Character
task.wait()
v:Activate()
v:Activate()
v:Activate()
end
end
		end,
	})

DrinkSection:Toggle({
    Title = "Auto Instant Drink",
    Desc = "Automatically detects and instantly drinks beverages from your inventory.",
    Callback = function(state)
        getgenv().autoDrink = state
        
        -- 🛡️ CHỐNG LUỒNG MA
        if getgenv().SalunaAutoDrinkThread then
            task.cancel(getgenv().SalunaAutoDrinkThread)
            getgenv().SalunaAutoDrinkThread = nil
        end
        
        if state then
            getgenv().SalunaAutoDrinkThread = task.spawn(function()
                local plr = game:GetService("Players").LocalPlayer
                local drinkKeywords = {"Juice", "Milk", "Cider", "Lemonade", "Smoothie", "Golden Apple"}
                
                while getgenv().autoDrink do 
                    task.wait(0.3) 
                    pcall(function()
                        local char = plr.Character
                        local backpack = plr:FindFirstChild("Backpack")
                        
                        if char and backpack then
                            local drinksToDrink = {}
                            
                            -- 1. Gom tất cả đồ uống vào một danh sách
                            for _, v in pairs(backpack:GetChildren()) do
                                for _, keyword in ipairs(drinkKeywords) do
                                    if string.find(v.Name, keyword) then
                                        table.insert(drinksToDrink, v)
                                        break
                                    end
                                end
                            end
                            
                            -- 2. Kích hoạt đồng loạt bằng task.spawn
                            for _, v in ipairs(drinksToDrink) do
                                task.spawn(function()
                                    if not v or v.Parent ~= backpack then return end
                                    
                                    v.Parent = char 
                                    task.wait() 
                                    
                                    -- Vòng lặp Activate cho từng món
                                    repeat
                                        task.wait()
                                        if v and v.Parent == char then
                                            v:Activate()
                                        end
                                    until not v or v.Parent ~= char
                                end)
                            end
                        end
                    end)
                end
            end)
        end
    end,
})
DrinkSection:Space()
	DrinkSection:Button({
		Title = "Drop Drinks",
		Desc = "Drop all drinks from your inventory.",
		Callback = function()
local char = game:GetService("Players").LocalPlayer.Character
char.Humanoid:UnequipTools()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if string.find(v.Name, "Juice") or string.find(v.Name, "Milk") or string.find(v.Name, "Cider") or string.find(v.Name, "Lemonade") or string.find(v.Name, "Smoothie") or string.find(v.Name, "Golden Apple") then
v.Parent = game.Players.LocalPlayer.Character
v.Parent = workspace
end
end
		end,
	})

DrinkSection:Toggle({
		Title = "Auto Drop Drinks",
		Flag = "Saluna_AutoDropDrink",
		Desc = "Automatically drops unneeded beverages to the ground.",
		Callback = function(state)
			getgenv().autoDropDrink = state
			if getgenv().SalunaAutoDropDrinkThread then
				task.cancel(getgenv().SalunaAutoDropDrinkThread)
				getgenv().SalunaAutoDropDrinkThread = nil
			end
			if state then
				getgenv().SalunaAutoDropDrinkThread = task.spawn(function()
					local plr = game:GetService("Players").LocalPlayer
					local drinkKeywords = {"Juice", "Milk", "Cider", "Lemonade", "Smoothie", "Golden Apple"}
					while getgenv().autoDropDrink do task.wait()
						pcall(function()
							local char = plr.Character
							local backpack = plr:FindFirstChild("Backpack")
							if char and backpack then
								for _, v in pairs(backpack:GetChildren()) do
									if v:IsA("Tool") then
										local isBeverage = false
										for _, keyword in ipairs(drinkKeywords) do
											if string.find(v.Name, keyword) then
												isBeverage = true
												break
											end
										end
										if isBeverage then
											v.Parent = char 
											task.wait()
											v.Parent = workspace
										end
									end
								end
							end
						end)
					end
				end)
			end
		end,
	})

DrinkSection:Toggle({
    Title = "Auto Grab Drinks",
    Flag = "Saluna_AutoGrabDrink",
    Desc = "Automatically pick up dropped drinks",
    Callback = function(dg)
        getgenv().dg = dg
        
        -- 🛡️ CHỐNG LUỒNG MA: Hủy luồng cũ nếu nó đang tồn tại
        if getgenv().SalunaAutoGrabDrinkThread then
            task.cancel(getgenv().SalunaAutoGrabDrinkThread)
            getgenv().SalunaAutoGrabDrinkThread = nil
        end
        
        if dg then
            -- Gán luồng mới vào biến toàn cục để quản lý
            getgenv().SalunaAutoGrabDrinkThread = task.spawn(function()
                while getgenv().dg do 
                    task.wait() -- Giữ nguyên delay của đồng môn
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character
                        if char then
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            if humanoid then
                                for _, child in ipairs(workspace:GetChildren()) do
                                    -- Kiểm tra nếu toggle đã bị tắt thì dừng nhanh
                                    if not getgenv().dg then break end
                                    
                                    if child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
                                        local name = child.Name
                                        if string.find(name, "Smoothie") or string.find(name, "Cider") or string.find(name, "Lemonade") or string.find(name, "Juice") then
                                            humanoid:EquipTool(child)
                                            task.wait() -- Giữ nguyên delay của đồng môn
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

	local FruitSection = OPDList:Tab({
		Title = "Fruit/Box",
		Icon = "rbxassetid://130882646",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

FruitSection:Toggle({
    Title = "Auto Grab Devil Fruit",
    Flag = "Saluna_AutoGrabDevilFruit",
    Desc = "Automatic pick up dropped devil fruit.",
    Callback = function(gdf)
        getgenv().gdf = gdf
        
        -- 🛡️ CHỐNG LUỒNG MA: Trảm luồng cũ ngay lập tức nếu nó đang chạy
        if getgenv().SalunaAutoGrabFruitThread then
            task.cancel(getgenv().SalunaAutoGrabFruitThread)
            getgenv().SalunaAutoGrabFruitThread = nil
        end
        
        if gdf then
            -- Gán luồng mới vào biến toàn cục để quản lý
            getgenv().SalunaAutoGrabFruitThread = task.spawn(function()
                while getgenv().gdf do 
                    task.wait() -- Giữ nguyên tốc độ của bạn
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character
                        if char and char:FindFirstChild("Humanoid") then
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            
                            for _, child in ipairs(workspace:GetChildren()) do
                                if not getgenv().gdf then break end -- Thoát nhanh nếu tắt toggle
                                
                                -- Thay đổi logic: Kiểm tra " Fruit" (có dấu cách) như bạn muốn
                                if child:IsA("BackpackItem") and string.find(child.Name, " Fruit") and child:FindFirstChild("Handle") then
                                    humanoid:EquipTool(child)
                                    task.wait() -- Delay nhỏ tránh nghẽn remote
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FruitSection:Space()

FruitSection:Toggle({
    Title = "Grab Common/Uncommon Boxes",
    Flag = "Saluna_AutoGrabCommonBox",
    Desc = "Automatic pick up dropped common/uncommon boxes.",
    Callback = function(bg)
        getgenv().bg = bg
        
        -- 🛡️ CHỐNG LUỒNG MA: Trảm luồng cũ ngay lập tức
        if getgenv().SalunaAutoGrabBoxThread then
            task.cancel(getgenv().SalunaAutoGrabBoxThread)
            getgenv().SalunaAutoGrabBoxThread = nil
        end
        
        if bg then
            -- Gán luồng mới
            getgenv().SalunaAutoGrabBoxThread = task.spawn(function()
                while getgenv().bg do 
                    task.wait() -- Giữ nguyên tốc độ của bạn
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character
                        if char and char:FindFirstChild("Humanoid") then
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            
                            for _, child in ipairs(workspace:GetChildren()) do
                                if not getgenv().bg then break end -- Thoát nhanh nếu tắt toggle
                                
                                -- Kiểm tra rương bằng chuỗi con "ommon Box"
                                if child:IsA("BackpackItem") and string.find(child.Name, "ommon Box") and child:FindFirstChild("Handle") then
                                    humanoid:EquipTool(child)
                                    task.wait() -- Delay nhỏ tránh nghẽn remote
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FruitSection:Toggle({
    Title = "Grab Rare/Ultra Boxes",
    Flag = "Saluna_AutoGrabRareBox",
    Desc = "Automatic pick up dropped rare/ultra rare boxes.",
    Callback = function(rbg)
        getgenv().rbg = rbg
        
        -- 🛡️ CHỐNG LUỒNG MA: Trảm luồng cũ ngay lập tức
        if getgenv().SalunaAutoGrabRareBoxThread then
            task.cancel(getgenv().SalunaAutoGrabRareBoxThread)
            getgenv().SalunaAutoGrabRareBoxThread = nil
        end
        
        if rbg then
            -- Gán luồng mới
            getgenv().SalunaAutoGrabRareBoxThread = task.spawn(function()
                while getgenv().rbg do 
                    task.wait() 
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character
                        if char and char:FindFirstChild("Humanoid") then
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            
                            for _, child in ipairs(workspace:GetChildren()) do
                                if not getgenv().rbg then break end -- Thoát nhanh nếu tắt toggle
                                
                                -- Kiểm tra bằng chuỗi "Rare Box" (Khớp cả Rare và Ultra Rare)
                                if child:IsA("BackpackItem") and string.find(child.Name, "Rare Box") and child:FindFirstChild("Handle") then
                                    humanoid:EquipTool(child)
                                    task.wait() -- Delay nhỏ tránh nghẽn remote
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FruitSection:Space()

	FruitSection:Button({
		Title = "Open Common/Uncommon Boxes",
		Callback = function()
for i,v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
if v:IsA("Tool") and string.find(v.Name, "ommon Box") then wait()
v.Parent = game.Players.LocalPlayer.Character
v:Activate()
end
end
end,
	})

FruitSection:Space()
	FruitSection:Button({
		Title = "Open Rare/Ultra Boxes",
		Callback = function()
for i,v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
if v:IsA("Tool") and string.find(v.Name, "Rare Box") then wait()
v.Parent = game.Players.LocalPlayer.Character
v:Activate()
end
end
		end,
	})

FruitSection:Space()

	FruitSection:Button({
		Title = "Aura Detector",
Desc = "Find and automatically equip Aura Fruits from your inventory.",
		Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character
local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
local backpack = player:FindFirstChild("Backpack")
if humanoid and backpack then
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
            local dataObj = tool:FindFirstChild("Data")
            if dataObj and type(dataObj.Value) == "string" then
                if string.sub(dataObj.Value, -2) == ",1" then
                    humanoid:EquipTool(tool)
                    break 
                end
            end
        end
    end
end
		end,
	})

	local FishSection = OPDList:Tab({
		Title = "Fishing",
		Icon = "rbxassetid://515816713",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})
FishSection:Section({
		Title = "Use at your own risk. Teleport to fishing place to avoid being recorded by other players (Ban Risk)",
		Icon = "solar:danger-triangle-bold"
	})
FishSection:Space()
	FishSection:Button({
		Title = "Safe Fishing Place",
		Callback = function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["fishingplace"].CFrame * CFrame.new(0, 3.5, 0)
		end,
	})

FishSection:Toggle({
		Title = "Auto TP To Fishing Place (Outer Sea Safe Place)",
		Flag = "Saluna_AutoTeleportToFishingPlace",
		Desc = "Requires Auto Spawn to be enabled (Farming Tab).",
		Callback = function(state)
			getgenv().autotpfishing = state
			if getgenv().SalunaAutoTpFishingThread then
				task.cancel(getgenv().SalunaAutoTpFishingThread)
				getgenv().SalunaAutoTpFishingThread = nil
			end
			if state then
				getgenv().SalunaAutoTpFishingThread = task.spawn(function()
					local plr = game:GetService("Players").LocalPlayer
					local workspaceSvc = game:GetService("Workspace")
					while getgenv().autotpfishing do task.wait(0.5)
						pcall(function()
							local fishingPlace = workspaceSvc:FindFirstChild("fishingplace")
							local char = plr.Character
							local hrp = char and char:FindFirstChild("HumanoidRootPart")
							local backpack = plr:FindFirstChild("Backpack")
							if fishingPlace and hrp and hrp.Position.Y < 211000 then
								hrp.CFrame = fishingPlace.CFrame * CFrame.new(0, 3.5, 0)
							end
						end)
					end
				end)
			end
		end,
	})

local function GetRandomSpawnPos()
    local possiblePositions = {}
possiblePositions = {
            function() return CFrame.new(math.random(4834, 4971), 216.000107, -7655.1167, -1, 0, 0, 0, 1, 0, 0, 0, -1) end,
            function() return CFrame.new(math.random(-5399, -5191), 216.000107, -7896.06641, 0.999094486, 0, 0.0425471179, 0, 1, 0, -0.0425471179, 0, 0.999094486) end,
            function() return CFrame.new(math.random(-1999, -1744), 216.000107, 3846.42578, -0.9998281, 0, -0.018558437, 0, 1, 0, 0.018558437, 0, -0.9998281) end,
            function() return CFrame.new(7144.01514, 216.000107, math.random(-1870, -1707), 0.0147169232, 0, -0.999891698, 0, 1, 0, 0.999891698, 0, 0.0147169232) end,
            function() return CFrame.new(-6466.75293, 216.000107, math.random(-190, 317), -0.0367674828, 0, 0.999323964, 0, 1, 0, -0.999323964, 0, -0.0367674828) end,
            function() return CFrame.new(-4001.06836, 216.000107, -2187.07324, -0.999902248, 0, 0.0139838243, 0, 1, 0, -0.0139838243, 0, -0.999902248) end,
			function() return CFrame.new(math.random(187, 222), 216.000107, 5266.17822, -1, 0, 0, 0, 1, 0, 0, 0, -1) end,
            function() return CFrame.new(math.random(3150, 3247), 216.000107, 1459.35425, 0.99985975, 0, 0.016745884, 0, 1, 0, -0.016745884, 0, 0.99985975) end,
            function() return CFrame.new(math.random(4310, 4536), 216.000107, 5851.68652, -0.999912739, 0, -0.0132069802, 0, 1, 0, 0.0132069802, 0, -0.999912739) end,
            function() return CFrame.new(math.random(-6742, -6650), 215.000107, 5886.92871, -0.9998281, 0, -0.018558437, 0, 1, 0, 0.018558437, 0, -0.9998281) end
        }
local randomFunc = possiblePositions[math.random(1, #possiblePositions)]
    return randomFunc()
end

local plr = game.Players.LocalPlayer

plr.CharacterAdded:Connect(function()
        local newPos = GetRandomSpawnPos()
        getgenv().RandomFishingPos = newPos
end)

getgenv().RandomFishingPos = getgenv().RandomFishingPos or GetRandomSpawnPos()

FishSection:Toggle({
		Title = "Auto TP To Fishing Place (Island)",
		Flag = "Saluna_AutoTeleportToFishingIsland",
		Desc = "Requires Auto Spawn to be enabled (Farming Tab).",
		Callback = function(state)
			getgenv().autotpfishingisland = state
			if getgenv().SalunaAutoTpFishingThread then
				task.cancel(getgenv().SalunaAutoTpFishingThread)
				getgenv().SalunaAutoTpFishingThread = nil
			end
			if state then
				getgenv().SalunaAutoTpFishingThread = task.spawn(function()
					local plr = game:GetService("Players").LocalPlayer
					local workspaceSvc = game:GetService("Workspace")
					while getgenv().autotpfishingisland do task.wait(0.5)
						pcall(function()
							local fishingPlace = workspaceSvc:FindFirstChild("fishingplace")
							local char = plr.Character
							local hrp = char and char:FindFirstChild("HumanoidRootPart")
							local backpack = plr:FindFirstChild("Backpack")
							if fishingPlace and hrp and hrp.Position.Y < 211000 then
								hrp.CFrame = getgenv().RandomFishingPos
							end
						end)
					end
				end)
			end
		end,
	})

FishSection:Space()

FishSection:Toggle({
    Title = "Auto Upgrade Rod",
	Flag = "Saluna_AutoUpgradeRod",
    Desc = "Automatically buys the Super Rod or equips the Sturdy Rod.",
    Callback = function(upgraderod)
        getgenv().upgraderod = upgraderod
        if getgenv().SalunaAutoUpgradeRodThread then
            task.cancel(getgenv().SalunaAutoUpgradeRodThread)
            getgenv().SalunaAutoUpgradeRodThread = nil
        end
        if not upgraderod then return end
        getgenv().SalunaAutoUpgradeRodThread = task.spawn(function()
            local plr = game.Players.LocalPlayer
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local buyRemote = workspace:WaitForChild("Merchants"):WaitForChild("QuestFishMerchant"):WaitForChild("FishRemote")
            local equipRemote = ReplicatedStorage:WaitForChild("Connections"):WaitForChild("UpdateWeapon")
            local userFolder = workspace.UserData:WaitForChild("User_"..plr.UserId)
            local dataFolder = userFolder.Data
            local itemsFolder = dataFolder.Items
            local sturdyEquippedOnce = false
            while getgenv().upgraderod do
                task.wait(1)
                pcall(function()
                    local hasSuper = itemsFolder["Own_Super Rod"].Value
                    local hasSturdy = itemsFolder["Own_Sturdy Rod"].Value
                    local currentBeli = dataFolder.Beri.Value
                    if hasSuper then
                        equipRemote:FireServer("Super Rod")
                        task.wait(1)
                        getgenv().upgraderod = false 
                        return
                    end
                    if hasSturdy then
                        if not sturdyEquippedOnce then
                            equipRemote:FireServer("Sturdy Rod")
                            sturdyEquippedOnce = true
                        end
                        if currentBeli >= 1000000 then
                            buyRemote:FireServer()
                            local timeout = 0
                            repeat 
                                task.wait(0.5)
                                timeout = timeout + 0.5
                            until itemsFolder["Own_Super Rod"].Value == true or timeout > 5
                            if itemsFolder["Own_Super Rod"].Value == true then
                                equipRemote:FireServer("Super Rod")
                            end
                        end
                    end
                end)
                if not getgenv().upgraderod then break end
            end
        end)
    end,
})

FishSection:Toggle({
		Title = "Auto Up Buff-Fishing Expertise",
		Flag = "Saluna_AutoUpBuffFishing",
		Callback = function(state)
			getgenv().upexpfish = state
			if getgenv().SalunaAutoUpBuffFishingThread then
				task.cancel(getgenv().SalunaAutoUpBuffFishingThread)
				getgenv().SalunaAutoUpBuffFishingThread = nil
			end
			if state then
				getgenv().SalunaAutoUpBuffFishingThread = task.spawn(function()
					local plr = game:GetService("Players").LocalPlayer
					while getgenv().upexpfish do 
						task.wait(1)
						pcall(function()
							local labelText = plr.PlayerGui.MenuNew.Frame.D.Frame.H.Frame.Points.Label.Text
							local points = tonumber(labelText)
							if points and points > 0 then
								local userIdString = "User_" .. plr.UserId
								local userData = workspace:FindFirstChild("UserData")
								local userFolder = userData and userData:FindFirstChild(userIdString)
								local remote = userFolder and userFolder:FindFirstChild("ExpertisePointsRemote")
								if remote then
									for i = 1, points do
										if not getgenv().upexpfish then break end 
										remote:FireServer("BuffFishing")
										task.wait(0.1) 
									end
								end
							end
						end)
					end
				end)
			end
		end,
	})

FishSection:Space()

FishSection:Toggle({
    Title = "Auto Fishing (v2.2)",
	Flag = "Saluna_AutoFishingv1",
    Desc = "Time-driven execution with static delays. Automatically disables native Fishing UI for clean background farming.",
    Callback = function(fish)
        getgenv().fishingv1 = fish
        local bobberSpawnTime = nil

        local fishingGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Fishing")
        if fishingGui then
            fishingGui.Enabled = not fish
        end
if fish then
task.spawn(function()
while getgenv().fishingv1 do task.wait(0.5)
pcall(function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if string.find(v.Name, "Rod") then
v.Parent = game:GetService("Players").LocalPlayer.Character
end
end
end)
end
end)

        task.spawn(function()
            while getgenv().fishingv1 do 
                task.wait(0.5)
                pcall(function()
                    local char = game:GetService("Players").LocalPlayer.Character
                    if not char then return end
                    
                    local tool = char:FindFirstChildWhichIsA("Tool")
                    if not tool or not string.find(tool.Name, "Rod") then 
                        bobberSpawnTime = nil 
                        return 
                    end

                    local bobber = nil
                    for _, v in pairs(char:GetDescendants()) do
                        if v.Name == "Bobber" then
                            bobber = v
                            break
                        end
                    end

                    if bobber then
                        if not bobberSpawnTime then 
                            bobberSpawnTime = tick() 
                        end
                        
                        local timeElapsed = tick() - bobberSpawnTime
                        if timeElapsed > 40 then
                            char.Humanoid:UnequipTools() 
                            bobberSpawnTime = nil 
                            task.wait(1.5)
                            return
                        end
                        local effect = bobber:FindFirstChild("Effect")
                        if effect and effect.Enabled == true then
                            local args = {[1] = Vector3.new(20837,-3000017,-4390)}
                            tool.Click:FireServer(unpack(args))
                            task.wait(1.5)
                            for i = 1, 10 do
                                if not getgenv().fishingv1 then break end
                                game:GetService("ReplicatedStorage"):WaitForChild("Fishing"):FireServer("Running", "Default")
                                task.wait(0.25) 
                            end
                            task.wait(0.1) 
                            game:GetService("ReplicatedStorage"):WaitForChild("Fishing"):FireServer("Finish", 10)
                            task.wait(0.5)
                        end
                    else
                        bobberSpawnTime = nil
                        local args = {[1] = Vector3.new(20837,-3000017,-4390)}
                        tool.Click:FireServer(unpack(args))
                        task.wait(.6)
                    end
                end)
            end
        end)
end
    end,
})

FishSection:Toggle({
	Title = "Auto Fishing (v3.3 - Fast Bypass & Instant Cast)",
	Flag = "Saluna_AutoFishingv2",
	Desc = "Event-driven mechanics optimized via real-time FishingGUI tracking. Features dynamic synchronization and instant recasting.",
	Callback = function(fish)
		getgenv().fishingv2 = fish
		
		if getgenv().SalunaAutoFishingV2Thread1 then task.cancel(getgenv().SalunaAutoFishingV2Thread1) getgenv().SalunaAutoFishingV2Thread1 = nil end
		if getgenv().SalunaAutoFishingV2Thread2 then task.cancel(getgenv().SalunaAutoFishingV2Thread2) getgenv().SalunaAutoFishingV2Thread2 = nil end
		
		local bobberSpawnTime = nil
		local plr = game:GetService("Players").LocalPlayer
		
		if fish then
			-- Luồng 1: Giữ cần câu trên tay
			getgenv().SalunaAutoFishingV2Thread1 = task.spawn(function()
				while getgenv().fishingv2 do
					pcall(function()
						local backpack = plr:FindFirstChild("Backpack")
						if backpack then
							for _, v in ipairs(backpack:GetChildren()) do
								if string.find(v.Name, "Rod") then
									v.Parent = plr.Character
								end
							end
						end
					end)
					task.wait(0.5)
				end
			end)
			
			-- Luồng 2: Quăng cần, giật cá và TỰ CHƠI MINIGAME
			getgenv().SalunaAutoFishingV2Thread2 = task.spawn(function()
				while getgenv().fishingv2 do 
					task.wait(0.1)
					pcall(function()
						local char = plr.Character
						if not char then return end
						
						local hrp = char:FindFirstChild("HumanoidRootPart")
						local tool = char:FindFirstChildWhichIsA("Tool")
						
						if not tool or not hrp or not string.find(tool.Name, "Rod") then 
							bobberSpawnTime = nil 
							return 
						end
						
						local isBlueScreen = false
						local minigameFrame = nil
						local playerGui = plr:FindFirstChild("PlayerGui")
						local fishingGui = playerGui and playerGui:FindFirstChild("Fishing")
						
						if fishingGui then
							for _, frame in ipairs(fishingGui:GetChildren()) do
								if frame:IsA("Frame") and frame:FindFirstChild("Count") then
									minigameFrame = frame
									if frame.Visible == true then
										isBlueScreen = true
									end
									break
								end
							end
						end
						
						local safeCastVector = hrp.Position + (hrp.CFrame.LookVector * 30) - Vector3.new(0, 5, 0)
						local bobber = char:FindFirstChild("Bobber", true)
						
						if bobber then
							if not bobberSpawnTime then bobberSpawnTime = tick() end
							
							local maxWaitTime = 40
							
							if tick() - bobberSpawnTime > maxWaitTime then
								local hum = char:FindFirstChildWhichIsA("Humanoid")
								if hum then hum:UnequipTools() end 
								bobberSpawnTime = nil 
								task.wait(1.5)
								return
							end
							
							local effect = bobber:FindFirstChild("Effect")
							
							if effect and effect.Enabled == true then
								if not isBlueScreen then
									-- 1. CLICK KÉO CÁ
									tool.Click:FireServer(safeCastVector)
									bobberSpawnTime = nil 
									
									-- 2. ĐỒNG BỘ PING
									local minigameReady = false
									if minigameFrame then
										for w = 1, 40 do
											task.wait(0.1)
											if minigameFrame.Visible == true then
												minigameReady = true
												break
											end
										end
									else
										task.wait(2) 
										minigameReady = true
									end
									
									-- 3. CHƠI MINIGAME VÀ QUĂNG LUÔN LƯỠI CÂU MỚI
									if minigameReady then
										task.wait(0.2) 
										local fishingRemote = game:GetService("ReplicatedStorage"):WaitForChild("Fishing")
										if fishingRemote then
											
											-- 🚀 Spam đúng 0.25s theo công thức của bạn
											for i = 1, 10 do
												if not getgenv().fishingv2 then break end
												fishingRemote:FireServer("Running", "Default")
												task.wait(0.25)
											end
											
											task.wait(0.1) 
											fishingRemote:FireServer("Finish", 10)
											
											-- 🚀 QUĂNG CẦN INSTANT CAST: Mặc kệ màn hình xanh, ném luôn mẻ mới!
											task.wait(0.3) -- Nghỉ nửa nhịp chờ server tính thưởng
											if getgenv().fishingv2 then
												tool.Click:FireServer(safeCastVector)
												bobberSpawnTime = tick() -- Đặt lại đồng hồ luôn để đếm giờ mẻ mới
											end
										end
									end
								end
							end
						else
							-- 🎣 CHỈ QUĂNG CẦN TỰ DO KHI MÀN HÌNH KHÔNG XANH (Để tránh quăng đúp)
							if not isBlueScreen then
								bobberSpawnTime = nil
								tool.Click:FireServer(safeCastVector)
								task.wait(1)
							end
						end
					end)
				end
			end)
		end
	end,
})
FishSection:Space()

FishSection:Toggle({
    Title = "Auto Grill + Sell Fish",
    Flag = "Saluna_AutoGrillSell",
    Callback = function(grillsell)
        getgenv().grill = grillsell
        
        -- 🛡️ CHỐNG LUỒNG MA: Trảm luồng cũ ngay lập tức
        if getgenv().SalunaAutoGrillSellThread then 
            task.cancel(getgenv().SalunaAutoGrillSellThread) 
            getgenv().SalunaAutoGrillSellThread = nil 
        end
        
        if grillsell then
            getgenv().SalunaAutoGrillSellThread = task.spawn(function()
                local plr = game:GetService("Players").LocalPlayer
                
                -- Caching đối tượng để không phải quét Workspace liên tục
                local kitchen = workspace:WaitForChild("Island8", 10):WaitForChild("Kitchen", 10)
                local fishMerchant = workspace:WaitForChild("Merchants", 10):WaitForChild("FishMerchant", 10)
                
                while getgenv().grill do 
                    task.wait(0.5) -- Tăng delay lên một chút để tránh spam Server quá đà
                    pcall(function()
                        local backpack = plr:FindFirstChild("Backpack")
                        if not backpack then return end

                        local hasFish = false
                        for _, v in ipairs(backpack:GetChildren()) do
                            if string.find(v.Name, "Small") or string.find(v.Name, "Medium") or string.find(v.Name, "Large") or string.find(v.Name, "Huge") then
                                hasFish = true
                                break
                            end
                        end

                        if hasFish then
                            -- Tìm PartC từ cache đã lưu, không cần quét lại từ đầu
                            local selectedPart = nil
                            for _, item in ipairs(kitchen:GetChildren()) do
                                if item:IsA("Folder") then
                                    selectedPart = item:FindFirstChild("PartC")
                                    if selectedPart then break end
                                end
                            end

                            if selectedPart then
                                fireclickdetector(selectedPart.ClickDetector)
                                task.wait(0.3)
                                -- Bắn lệnh Sell
                                local sellRemote = fishMerchant:FindFirstChild("Clickable", true) and fishMerchant.Clickable.ChefGUI.Clicked.Retum
                                if sellRemote then
                                    sellRemote:FireServer("Sell")
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FishSection:Space()

FishSection:Toggle({
    Title = "Auto Delete Copper, Silver, Gold Cache",
    Flag = "Saluna_AutoDeleteCopperCache",
    Callback = function(autodelcac)
        getgenv().autodelcac = autodelcac
        
        -- 🛡️ CHỐNG LUỒNG MA: Khai tử luồng cũ ngay lập tức nếu nó đang tồn tại
        if getgenv().SalunaAutoDeleteCacheThread then
            task.cancel(getgenv().SalunaAutoDeleteCacheThread)
            getgenv().SalunaAutoDeleteCacheThread = nil
        end

        if autodelcac then
            -- Bắt đầu luồng mới và gán vào biến toàn cục để quản lý
            getgenv().SalunaAutoDeleteCacheThread = task.spawn(function()
                while getgenv().autodelcac do 
                    task.wait(1)
                    pcall(function()
                        local plr = game:GetService("Players").LocalPlayer
                        local backpack = plr:FindFirstChild("Backpack")
                        
                        if backpack then
                            for i, v in pairs(backpack:GetChildren()) do
                                if string.find(v.Name, "Cache") and not string.find(v.Name, "Platinum") then
                                    v:Destroy()
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FishSection:Toggle({
	Title = "Auto Delete Trash",
	Flag = "Saluna_AutoDeleteTrash",
	Desc = "Warning: This will also delete drinks. Use with caution!",
	Callback = function(autodeltrash)
		getgenv().autodeltrash = autodeltrash
		
		-- 🛡️ CHỐNG LUỒNG MA: Khai tử luồng cũ ngay lập tức nếu nó đang chạy
		if getgenv().SalunaAutoDeleteTrashThread then
			task.cancel(getgenv().SalunaAutoDeleteTrashThread)
			getgenv().SalunaAutoDeleteTrashThread = nil
		end
		
		if autodeltrash then
			getgenv().SalunaAutoDeleteTrashThread = task.spawn(function()
				while getgenv().autodeltrash do 
					task.wait(1)
					pcall(function()
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if string.find(v.Name, "Juice") or string.find(v.Name, "Milk") or string.find(v.Name, "Cider") or string.find(v.Name, "Lemonade") or string.find(v.Name, "Smoothie") or string.find(v.Name, "Golden Apple") or string.find(v.Name, "Pumpkin") or string.find(v.Name, "Melon") or string.find(v.Name, "Apple") or string.find(v.Name, "Banana") or string.find(v.Name, "Cantaloupe") or string.find(v.Name, "Pear") or string.find(v.Name, "Coconut") then
								v:Destroy()
							end
						end
					end)
				end
			end)
		end
	end,
})

FishSection:Toggle({
	Title = "Auto Delete Fishes",
	Flag = "Saluna_AutoDeleteFishes",
	Callback = function(autodelfish)
		getgenv().autodelfish = autodelfish
		
		-- 🛡️ CHỐNG LUỒNG MA: Khai tử luồng cũ ngay lập tức nếu nó đang chạy
		if getgenv().SalunaAutoDeleteFishesThread then
			task.cancel(getgenv().SalunaAutoDeleteFishesThread)
			getgenv().SalunaAutoDeleteFishesThread = nil
		end
		
		if autodelfish then
			getgenv().SalunaAutoDeleteFishesThread = task.spawn(function()
				while getgenv().autodelfish do 
					task.wait(1)
					pcall(function()
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if string.find(v.Name, "Small") or string.find(v.Name, "Medium") or string.find(v.Name, "Large") or string.find(v.Name, "Huge") then
								v:Destroy()
							end
						end
					end)
				end
			end)
		end
	end,
})

FishSection:Space()

FishSection:Toggle({
    Title = "Auto Use Copper, Silver, Gold Cache",
    Flag = "Saluna_AutoUseCopperCache",
    Callback = function(autouseothers)
        getgenv().autouseothers = autouseothers
        
        -- 🛡️ CHỐNG LUỒNG MA
        if getgenv().SalunaAutoUseCacheThread then 
            task.cancel(getgenv().SalunaAutoUseCacheThread) 
            getgenv().SalunaAutoUseCacheThread = nil 
        end
        
        if autouseothers then
            getgenv().SalunaAutoUseCacheThread = task.spawn(function()
                while getgenv().autouseothers do 
                    task.wait(1)
                    pcall(function()
                        local plr = game.Players.LocalPlayer
                        local backpack = plr:FindFirstChild("Backpack")
                        local char = plr.Character
                        
                        if backpack and char then
                            local cachesToUse = {}
                            
                            -- 1. Gom tất cả rương hợp lệ vào danh sách
                            for _, v in pairs(backpack:GetChildren()) do
                                if string.find(v.Name, "Copper Cache") or string.find(v.Name, "Silver Cache") or string.find(v.Name, "Gold Cache") then
                                    table.insert(cachesToUse, v)
                                end
                            end
                            
                            -- 2. Kích hoạt đồng loạt bằng task.spawn
                            for _, v in ipairs(cachesToUse) do
                                task.spawn(function()
                                    if not v or v.Parent ~= backpack then return end
                                    
                                    v.Parent = char
                                    task.wait()
                                    
                                    -- Vòng lặp chờ mở xong
                                    repeat
                                        task.wait()
                                        if v and v.Parent == char then
                                            v:Activate()
                                        end
                                    until not v or v.Parent ~= char
                                end)
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FishSection:Toggle({
    Title = "Auto Use Platinum Cache",
    Flag = "Saluna_AutoUsePlatinumCache",
    Callback = function(autousepla)
        getgenv().autousepla = autousepla
        
        -- 🛡️ CHỐNG LUỒNG MA: Trảm luồng cũ
        if getgenv().SalunaAutoUsePlatThread then 
            task.cancel(getgenv().SalunaAutoUsePlatThread) 
            getgenv().SalunaAutoUsePlatThread = nil 
        end
        
        if autousepla then
            getgenv().SalunaAutoUsePlatThread = task.spawn(function()
                while getgenv().autousepla do 
                    task.wait(1)
                    pcall(function()
                        local plr = game.Players.LocalPlayer
                        local backpack = plr:FindFirstChild("Backpack")
                        local char = plr.Character
                        
                        if backpack and char then
                            local cachesToUse = {}
                            
                            -- 1. Gom tất cả Platinum Cache vào danh sách
                            for _, v in pairs(backpack:GetChildren()) do
                                if string.find(v.Name, "Platinum") then
                                    table.insert(cachesToUse, v)
                                end
                            end
                            
                            -- 2. Kích hoạt đồng loạt bằng task.spawn
                            for _, v in ipairs(cachesToUse) do
                                task.spawn(function()
                                    if not v or v.Parent ~= backpack then return end
                                    
                                    v.Parent = char
                                    task.wait()
                                    
                                    -- Vòng lặp chờ mở xong
                                    repeat
                                        task.wait()
                                        if v and v.Parent == char then
                                            v:Activate()
                                        end
                                    until not v or v.Parent ~= char
                                end)
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

	local FarmSection = OPDList:Tab({
		Title = "Farming",
		Icon = "rbxassetid://15667131313",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

FarmSection:Toggle({
		Title = "Auto Get Exp Quest",
		Flag = "Saluna_AutoGetExpQuest",
		Callback = function(expq)
			getgenv().expq = expq
			if getgenv().SalunaAutoGetExpQuestThread then
				task.cancel(getgenv().SalunaAutoGetExpQuestThread)
				getgenv().SalunaAutoGetExpQuestThread = nil
			end
			if expq then
				getgenv().SalunaAutoGetExpQuestThread = task.spawn(function()
					while getgenv().expq do 
						pcall(function()
							if workspace:WaitForChild("UserData"):WaitForChild("User_"..game.Players.LocalPlayer.UserId):WaitForChild("Data"):WaitForChild("ExpertiseTokens").Value > 0 then
								workspace:WaitForChild("Merchants"):WaitForChild("ExpertiseMerchant"):WaitForChild("Clickable"):WaitForChild("ExpertiseShop"):WaitForChild("Clicked"):WaitForChild("Retum"):FireServer()
								task.wait(30)
							end
						end)
						task.wait(10)
					end
				end)
			end
		end,
	})

FarmSection:Toggle({
		Title = "Auto Use Hourly Reward For Exp Quest",
		Flag = "Saluna_AutoUseHourly",
		Desc = "Recommend to use it when fishing in vip server.",
		Callback = function(state)
			getgenv().autoRollMission = state
			if getgenv().SalunaAutoRollMissionThread then
				task.cancel(getgenv().SalunaAutoRollMissionThread)
				getgenv().SalunaAutoRollMissionThread = nil
			end
			if state then
				getgenv().SalunaAutoRollMissionThread = task.spawn(function()
					local plr = game.Players.LocalPlayer
					local userFolder = workspace:WaitForChild("UserData"):WaitForChild("User_"..plr.UserId)
					local dataFolder = userFolder:WaitForChild("Data")
					local expertiseFolder = dataFolder:WaitForChild("Expertise")
					local claimRemote = userFolder:WaitForChild("ClaimRewardHourly", 5)
					local missionTarget = expertiseFolder:WaitForChild("MissionObjective")
					local hourlyCount = dataFolder:WaitForChild("HourlyRewardN")
					while getgenv().autoRollMission do
						local canRun = false
						pcall(function()
							if missionTarget.Value == "Money" and hourlyCount.Value > 0 then
								canRun = true
							end
						end)
						if canRun then
							pcall(function()
								if claimRemote then
									local args = {
										"RewardMark"
									}
									claimRemote:FireServer(unpack(args))
									WindUI:Notify({
										Title = "Saluna Notify: Quest",
										Content = "Claimed Hourly Reward",
										Icon = "solar:refresh-bold",
										Duration = 2,
										CanClose = false,
									})
								end
							end)
							task.wait(.3)
						else
							task.wait(1)
						end
					end
				end)
			end
		end,
	})

FarmSection:Space()

FarmSection:Toggle({
    Title = "Auto Claim Challenges",
    Flag = "Saluna_ClaimChallenge",
    Callback = function(challenge)
        getgenv().challenge = challenge
        if getgenv().SalunaAutoClaimChallengesThread then
            task.cancel(getgenv().SalunaAutoClaimChallengesThread)
            getgenv().SalunaAutoClaimChallengesThread = nil
        end
        if challenge then
            getgenv().SalunaAutoClaimChallengesThread = task.spawn(function()
                local plr = game:GetService("Players").LocalPlayer
                local userId = tostring(plr.UserId)
                local userData = workspace:WaitForChild("UserData", 5)
                local userFolder = userData and userData:FindFirstChild("User_"..userId)
                local remote = userFolder and userFolder:FindFirstChild("ChallengesRemote")
                local challengeTypes = {
                    { frameName = "DailyFrame",      remotePrefix = "Daily",     completionArg = "AllDaily" },
                    { frameName = "WeeklyFrame",     remotePrefix = "Weekly",    completionArg = "AllWeekly" },
                    { frameName = "LevelUpFrame",    remotePrefix = "Level",     completionArg = "AllLevel" },
                    { frameName = "ChallengesFrame", remotePrefix = "Challenge", completionArg = "AllChallenge" }
                }
                while getgenv().challenge do 
                    task.wait(3)
                    pcall(function()
                        local playerGui = plr:FindFirstChild("PlayerGui")
                        local baseGui = playerGui and playerGui:FindFirstChild("Challenges")
                        if not baseGui or not remote then return end
                        local frameContainer = baseGui.Frame.Frame
                        for _, config in ipairs(challengeTypes) do
                            if not getgenv().challenge then break end -- Dừng khẩn cấp nếu tắt toggle
                            local targetFrame = frameContainer:FindFirstChild(config.frameName)
                            if not targetFrame then continue end
                            local scrollFrame = targetFrame:FindFirstChild("ScrollingFrame")
                            if scrollFrame then
                                for _, child in ipairs(scrollFrame:GetChildren()) do
                                    if not getgenv().challenge then break end
                                    if child:IsA("Frame") and string.find(child.Name, "Challenge_") then
                                        local claimBtn = child:FindFirstChild("Claim")
                                        if claimBtn and claimBtn.AutoButtonColor == true then
                                            local challengeNum = string.match(child.Name, "%d+")
                                            if challengeNum then
                                                remote:FireServer("Claim", config.remotePrefix .. challengeNum)
                                                task.wait(0.05) -- Delay nhỏ tránh spam phá remote
                                            end
                                        end
                                    end
                                end
                            end
                            local completionFrame = targetFrame:FindFirstChild("CompletionFrame")
                            local compClaimBtn = completionFrame and completionFrame:FindFirstChild("Claim")
                            if compClaimBtn and compClaimBtn.AutoButtonColor == true then
                                remote:FireServer("Claim", config.completionArg)
                                task.wait(0.05)
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

FarmSection:Space()

local Spawn = {
			"(1) Sand",
			"(2) Cave's Port",
			"(3) Windmill",
			"(4) Cave's Fountain",
			"(5) Five House",
			"(6) Cave",
			"(7) Thug House",
			"(8) Cave's Slope",
			"(9) Near Bar Island",
			"(10) Sam Island"
		}
FarmSection:Dropdown({
		Title = "Select Spawn Place",
		Flag = "Saluna_DropdownSpawnPlace",
		Values = Spawn,
		Value = 1,
		Callback = function(splace)
for i,v in pairs(Spawn) do
if v == splace then
getgenv().spawn = i
end
end
if triggernotify == true then
WindUI:Notify({
				Title = "Saluna Notify: Spawn",
				Content = "Selected: "..splace,
				Icon = "solar:bell-bold",
				Duration = 2,
				CanClose = false,
			})
end
		end,
	})

FarmSection:Toggle({
	Title = "Auto Spawn",
	Flag = "Saluna_AutoSpawn",
	Callback = function(aspawn)
		getgenv().aspawn = aspawn
		if getgenv().SalunaAutoSpawnThread then
			task.cancel(getgenv().SalunaAutoSpawnThread)
			getgenv().SalunaAutoSpawnThread = nil
		end
		if not aspawn then return end
		getgenv().SalunaAutoSpawnThread = task.spawn(function()
			local plr = game.Players.LocalPlayer
			while getgenv().aspawn do
				task.wait(0.5) 
				pcall(function()
					local gui = plr:FindFirstChild("PlayerGui")
					local loadGui = gui and gui:FindFirstChild("Load")
					if loadGui and loadGui.Enabled == true then
						local frame = loadGui:FindFirstChild("Frame")
						if frame and frame.Visible == true then
							local userFolder = workspace.UserData:FindFirstChild("User_" .. plr.UserId)
							if userFolder and userFolder.Data:FindFirstChild("SpawnNumber") then
								userFolder.Data.SpawnNumber.Value = getgenv().spawn or 1
							end
							local spawnButton = frame:FindFirstChild("Load") or frame:FindFirstChildOfClass("TextButton")
							if spawnButton then
								local connections = getconnections(spawnButton.MouseButton1Click)
								for _, connection in pairs(connections) do
									connection:Function()
								end
								repeat task.wait(0.5) 
								until not getgenv().aspawn or not loadGui.Enabled or not frame.Visible
							end
						end
					end
				end)
			end
		end)
	end,
})

FarmSection:Space()

FarmSection:Section({
		Title = "Use At Your Own Risk (Visible to Others - Ban Risk)",
		Icon = "solar:danger-triangle-bold"
	})

FarmSection:Toggle({
		Title = "Auto Get Merlin Quest",
		Flag = "Saluna_AutoGetMerlinQuest",
		Callback = function(merq)
			getgenv().merq = merq
			if getgenv().SalunaAutoGetMerlinQuestThread then
				task.cancel(getgenv().SalunaAutoGetMerlinQuestThread)
				getgenv().SalunaAutoGetMerlinQuestThread = nil
			end
			if merq then
				getgenv().SalunaAutoGetMerlinQuestThread = task.spawn(function()
					local plr = game:GetService("Players").LocalPlayer
					local merchants = workspace:WaitForChild("Merchants", 5)
					local npc = merchants and merchants:FindFirstChild("QuestFishMerchant")
					if not npc then return end
					local clickable = npc:FindFirstChild("Clickable")
					local billboardGui = clickable and clickable:FindFirstChild("BillboardGui")
					local textLabel = billboardGui and billboardGui:FindFirstChild("TextLabel")
					local remote = clickable and clickable:FindFirstChild("Retum")
					if not textLabel or not remote then return end
					local function hasPackageItem(parent)
						if not parent then return false end
						for _, item in ipairs(parent:GetChildren()) do
							if string.find(item.Name, "Package") then
								return true
							end
						end
						return false
					end
					while getgenv().merq do
						task.wait(1)
						pcall(function()
							local backpack = plr:FindFirstChild("Backpack")
							local char = plr.Character
							local hasPackage = hasPackageItem(backpack) or hasPackageItem(char)
							local billboardText = textLabel.Text
							if (billboardText == "" or billboardText == nil) and not hasPackage then
								remote:FireServer("Package")
							end
						end)
					end
				end)
			end
		end,
	})

FarmSection:Toggle({
    Title = "Auto Package",
    Flag = "Saluna_AutoPackage",
    Desc = "Automatically farm packages if available in your inventory.",
    Callback = function(apac)
        getgenv().apac = apac
        if getgenv().SalunaAutoPackageThread then
            task.cancel(getgenv().SalunaAutoPackageThread)
            getgenv().SalunaAutoPackageThread = nil
        end
        if not apac then return end
        getgenv().SalunaAutoPackageThread = task.spawn(function()
            local plr = game.Players.LocalPlayer
            local speed = 40
            local merchantsSvc = workspace:WaitForChild("Merchants", 5)
            local merchantsList = merchantsSvc and merchantsSvc:GetChildren() or {}
            while getgenv().apac do
                task.wait(0.1)
                pcall(function()
                    local char = plr.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
                    if not hrp or not humanoid then return end
                    local backpack = plr:FindFirstChild("Backpack")
                    if backpack then
                        local equippedAny = false
                        for _, v in ipairs(backpack:GetChildren()) do
                            if v:IsA("Tool") and string.find(v.Name, "Package") then
                                v.Parent = char 
                                v:Activate()
                                equippedAny = true
                            end
                        end
                        if equippedAny then
                            task.wait(0.3)
                        end
                    end
                    local currentPackages = {}
                    for _, v in ipairs(char:GetChildren()) do
                        if v:IsA("Tool") and string.find(v.Name, "Package") then
                            table.insert(currentPackages, v)
                        end
                    end
                    if #currentPackages == 0 then return end 
                    for _, sr in ipairs(merchantsList) do
                        if not getgenv().apac or #currentPackages == 0 then break end
                        local targetHRP = sr:FindFirstChild("HumanoidRootPart")
                        if targetHRP then
                            humanoid.Sit = false
                            local targetPos = targetHRP.Position + Vector3.new(0, 0, 2)
                            while getgenv().apac and #currentPackages > 0 and (hrp.Position - targetPos).Magnitude > 1 do
                                local currentPos = hrp.Position
                                local distance = (targetPos - currentPos).Magnitude
                                local direction = (targetPos - currentPos).Unit
                                local nextStep = currentPos + (direction * math.min(speed, distance))
                                hrp.CFrame = (hrp.CFrame - hrp.Position) + nextStep
                                for i = #currentPackages, 1, -1 do
                                    local pkg = currentPackages[i]
                                    if not (pkg and pkg.Parent == char) then
                                        table.remove(currentPackages, i)
                                    end
                                end
                                task.wait() 
                            end
                        end
                    end
                    task.wait(0.4) 
                end)
            end
        end)
    end,
})

	local HakiTab = OPDList:Tab({
		Title = "Haki",
		Icon = "rbxassetid://101768148216668",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

HakiTab:Toggle({
    Title = "Auto Obtain Haki (Lvl 1000+)",
    Flag = "Saluna_AutoObtainHaki",
    Desc = "Automatically acquire Haki when Rayleigh spawns.",
    Callback = function(state)
        getgenv().gethaki = state
        if getgenv().SalunaAutoObtainHakiThread then
            task.cancel(getgenv().SalunaAutoObtainHakiThread)
            getgenv().SalunaAutoObtainHakiThread = nil
        end
        if state then
            getgenv().SalunaAutoObtainHakiThread = task.spawn(function()
                local plr = game.Players.LocalPlayer
                local userFolderName = "User_" .. tostring(plr.UserId)
                while getgenv().gethaki do
                    task.wait(2)
                    pcall(function()
                        local userData = workspace:FindFirstChild("UserData")
                        local userFolder = userData and userData:FindFirstChild(userFolderName)
                        local data = userFolder and userFolder:FindFirstChild("Data")
                        if not data then return end 
                        local hakiLvl = data:FindFirstChild("HakiLvl")
                        if hakiLvl then
                            if hakiLvl.Value > 0 then
                                getgenv().gethaki = false
                                return
                            end
                            local melee = data:FindFirstChild("MeleeLvl")
                            local sword = data:FindFirstChild("SwordLvl")
                            local def = data:FindFirstChild("DefenseLvl")
                            local sniper = data:FindFirstChild("SniperLvl")
                            if melee and sword and def and sniper then
                                local totalLvl = melee.Value + sword.Value + def.Value + sniper.Value
                                if totalLvl >= 1000 then
                                    local merchants = workspace:FindFirstChild("Merchants")
                                    local rayleigh = merchants and merchants:FindFirstChild("QuestHakiMerchant")
                                    local clickable = rayleigh and rayleigh:FindFirstChild("Clickable")
                                    local retum = clickable and clickable:FindFirstChild("Retum")
                                    
                                    if retum then
                                        retum:FireServer("III")
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

HakiTab:Space()

HakiTab:Space()
	HakiTab:Toggle({
		Title = "Auto On Haki",
		Flag = "Saluna_AutoTurnOnHaki",
		Desc = "Automatic turn on haki if haki is full recovered)",
		Callback = function(ahaki)
			getgenv().ahaki = ahaki
			if getgenv().SalunaAutoTurnOnHakiThread then
				task.cancel(getgenv().SalunaAutoTurnOnHakiThread)
				getgenv().SalunaAutoTurnOnHakiThread = nil
			end
			if ahaki then
				getgenv().SalunaAutoTurnOnHakiThread = task.spawn(function()
					local player = game.Players.LocalPlayer
					local userData = workspace:WaitForChild("UserData"):WaitForChild("User_"..player.UserId)
					local hakiBar = userData:WaitForChild("HakiBar")
					local hakiLvl = userData.Data:WaitForChild("HakiLvl")
					local remote = userData:WaitForChild("III")
					local updateHakiRemote = userData:WaitForChild("UpdateHaki", 5)
					while getgenv().ahaki do task.wait(0.5)
						pcall(function()
							if hakiBar.Value >= hakiLvl.Value then
								local currentLvl = hakiLvl.Value
								remote:FireServer("On", currentLvl)
								if currentLvl >= 200 and updateHakiRemote then
									updateHakiRemote:FireServer()
								end
								task.wait(1)
							end
						end)
					end
				end)
			end
		end,
	})

HakiTab:Space()

HakiTab:Section({
		Title = "Haki Farming (Luck Method)",
		Icon = "rbxassetid://11999300014"
	})

HakiTab:Space()

HakiTab:Toggle({
    Title = "Rejoin Current Server If Haki Drained Out \n(Non-Luck Method)",
    Flag = "Saluna_RejoinIfHaki0",
    Desc = "Automatically rejoins the current server when your Haki is drained out. (For non-Luck user)",
    Callback = function(state)
        getgenv().rejoinifhaki0 = state
        if getgenv().SalunaHakiRejoinThread then
            task.cancel(getgenv().SalunaHakiRejoinThread)
            getgenv().SalunaHakiRejoinThread = nil
        end
        if state then
            getgenv().SalunaHakiRejoinThread = task.spawn(function()
                local TeleportService = game:GetService("TeleportService")
                local LocalPlayer = game:GetService("Players").LocalPlayer
                local userId = LocalPlayer.UserId
				local userData = workspace:FindFirstChild("UserData")
				local userFolder = userData and userData:FindFirstChild("User_" ..userId)
                while getgenv().rejoinifhaki0 do 
                    task.wait(0.5)
                    pcall(function()
                        if userFolder then
                            local hakiLevelObj = userFolder:FindFirstChild("Data") and userFolder.Data:FindFirstChild("HakiLvl")
                            local hakiBarObj = userFolder:FindFirstChild("HakiBar")
                            if hakiLevelObj and hakiBarObj then
                                local zxm = hakiLevelObj.Value
                                local zcc = (zxm / 100) * 2
                                if hakiBarObj.Value < zcc then
                                    pcall(function()
                                        WindUI:Notify({
                                            Title = "Saluna Notify: Haki",
                                            Content = "Haki is empty! Rejoining the server...",
											Icon = "solar:bell-bold",
                                            Duration = 3,
											CanClose = false
                                        })
                                    end)
                                    task.wait(0.5)
                                    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

HakiTab:Space()

HakiTab:Section({
		Title = "Luck Account Settings",
		Icon = "rbxassetid://117391655140076"
	})

HakiTab:Toggle({
    Title = "Auto Slot Machine Spin (Luck)",
	Flag = "Saluna_AutoSlotMachine",
    Desc = "Higher defense affinity yields higher speed to get jackpot.",
    Callback = function(state)
        getgenv().autoLuckSpin = state
        if getgenv().SalunaAutoLuckSpinThread then
            task.cancel(getgenv().SalunaAutoLuckSpinThread)
            getgenv().SalunaAutoLuckSpinThread = nil
        end
        if state then
            getgenv().SalunaAutoLuckSpinThread = task.spawn(function()
                local plr = game:GetService("Players").LocalPlayer
                while getgenv().autoLuckSpin do task.wait(0.3)
                    pcall(function()
                        local char = plr.Character
                        if char then
                            local powers = char:FindFirstChild("Powers")
                            local luckFruit = powers and powers:FindFirstChild("Luck")
                            local remote = luckFruit and luckFruit:FindFirstChild("RemoteEvent")
                            if remote then
                                remote:FireServer("LuckPower2")
                            end
                        end
                    end)
                end
            end)
        end
    end,
})

HakiTab:Space()

local HakiDropdown = HakiTab:Dropdown({
    Title = "Select Damage-Dealer Account",
	Flag = "Saluna_DropdownDamageDealerAccount",
	Desc = "Select the account to deal damage. The luck account will teleport to it.",
    Values = getPlayerNames(),
    Value = nil,
    Callback = function(selectedHaki)
        getgenv().selectedHaki = selectedHaki
    end
})

HakiTab:Toggle({
    Title = "Auto Farm Haki",
    Flag = "Saluna_AutoFarmHakiLuck",
    Desc = "Highly recommended to use alongside Luck and a Logia fruit to prevent dying constantly.",
    Callback = function(state)
        getgenv().afhaki = state
        
        -- 🧹 DỌN DẸP LUỒNG & KẾT NỐI CŨ (BAO GỒM CẢ CÁI HOOK ANIMATION)
        if getgenv().SalunaHakiFarmThread then task.cancel(getgenv().SalunaHakiFarmThread) getgenv().SalunaHakiFarmThread = nil end
        if getgenv().SalunaHakiTPConn then getgenv().SalunaHakiTPConn:Disconnect() getgenv().SalunaHakiTPConn = nil end
        if getgenv().DodgeAnimConn then getgenv().DodgeAnimConn:Disconnect() getgenv().DodgeAnimConn = nil end
        if getgenv().DodgeCharAddedConn then getgenv().DodgeCharAddedConn:Disconnect() getgenv().DodgeCharAddedConn = nil end

        if state then
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local player = Players.LocalPlayer
            local playerGui = player:WaitForChild("PlayerGui", 5)
            local userIdStr = "User_" .. tostring(player.UserId)
            local userDataFolder = workspace:WaitForChild("UserData", 5)
            local myUserData = userDataFolder and userDataFolder:FindFirstChild(userIdStr)
            
            local OFFSET_ATTACK = CFrame.new(0, 0, -2)
            local OFFSET_IDLE = CFrame.new(0, 0, 10)

            -- ==========================================
            -- 🛡️ CHỐNG LAG: CHỈ TẠO HOOK ANIMATION KHI BẬT TOGGLE
            -- ==========================================
            local function ChokeDodgeAnimation(track)
                local anim = track.Animation
                if anim then
                    local name = anim.Name
                    if name == "Dodge1" or name == "Dodge2" or name == "Dodge3" or name == "Dodge4" then
                        track:Stop(0)
                    end
                end
            end

            local function ApplyDodgeHook(char)
                local humanoid = char:WaitForChild("Humanoid", 5)
                if not humanoid then return end
                local animator = humanoid:WaitForChild("Animator", 5)
                if not animator then return end

                -- Cắt kết nối cũ nếu có trước khi gắn cho nhân vật mới
                if getgenv().DodgeAnimConn then getgenv().DodgeAnimConn:Disconnect() end
                
                -- Tạo kết nối mới và lưu lại để sau này tắt
                getgenv().DodgeAnimConn = animator.AnimationPlayed:Connect(ChokeDodgeAnimation)
                
                -- Ngắt ngay mấy cái đang chạy dở
                for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                    ChokeDodgeAnimation(track)
                end
            end

            -- Chạy cho nhân vật hiện tại
            if player.Character then task.spawn(ApplyDodgeHook, player.Character) end

            -- Chạy mỗi khi hồi sinh (Lưu connection lại để tắt)
            getgenv().DodgeCharAddedConn = player.CharacterAdded:Connect(function(char)
                task.spawn(ApplyDodgeHook, char)
            end)
            -- ==========================================

            -- 🚀 LUỒNG AUTO NHẤN NÚT LOAD / BẬT HAKI
            getgenv().SalunaHakiFarmThread = task.spawn(function()
                while getgenv().afhaki do
                    task.wait(0.5) 
                    pcall(function()
                        local char = player.Character
                        local spawned = char and char:FindFirstChild("Spawned")
                        if not char or (spawned and spawned.Value == false) then
                            local loadGui = playerGui and playerGui:FindFirstChild("Load")
                            if loadGui and loadGui.Enabled == true then
                                local frame = loadGui:FindFirstChild("Frame")
                                if frame and frame.Visible == true then
                                    if myUserData then
                                        local dataFolder = myUserData:FindFirstChild("Data")
                                        local spawnNumber = dataFolder and dataFolder:FindFirstChild("SpawnNumber")
                                        if spawnNumber then
                                            spawnNumber.Value = getgenv().spawn or 1
                                        end
                                    end
                                    local btn = frame:FindFirstChild("Load") or frame:FindFirstChildOfClass("TextButton")
                                    if btn then
                                        for _, c in pairs(getconnections(btn.MouseButton1Click)) do c:Function() end
                                    end
                                end
                            end
                        end
                        if myUserData then
                            local hBar = myUserData:FindFirstChild("HakiBar")
                            local dFolder = myUserData:FindFirstChild("Data")
                            local hLvl = dFolder and dFolder:FindFirstChild("HakiLvl")
                            local remote = myUserData:FindFirstChild("III")
                            if hBar and hLvl and remote and hBar.Value >= hLvl.Value then
                                local currentLvl = hLvl.Value
                                remote:FireServer("On", currentLvl)
                                if currentLvl >= 200 then
                                    local updateRemote = myUserData:FindFirstChild("UpdateHaki")
                                    if updateRemote then updateRemote:FireServer() end
                                end
                            end
                        end
                    end)
                end
            end)

            -- 🚀 LUỒNG DỊCH CHUYỂN BÁM MỤC TIÊU
            getgenv().SalunaHakiTPConn = RunService.Heartbeat:Connect(function()
                if not getgenv().afhaki then return end -- (Dự phòng thêm, thường thì đã bị gỡ ở trên r)
                pcall(function()
                    local char = player.Character
                    local spawned = char and char:FindFirstChild("Spawned")
                    if char and spawned and spawned.Value == true then
                        local myHRP = char:FindFirstChild("HumanoidRootPart")
                        if not myHRP then return end
                        local usingObs = char:FindFirstChild("UsingObs")
                        local isAttacking = usingObs and usingObs.Value == true
                        local targetName = getgenv().selectedHaki
                        local targetPlr = targetName and Players:FindFirstChild(targetName)
                        if targetPlr and targetPlr.Character then
                            local targetHRP = targetPlr.Character:FindFirstChild("HumanoidRootPart")
                            if targetHRP then
                               if isAttacking then
                                    myHRP.CFrame = targetHRP.CFrame * OFFSET_ATTACK
                                else
                                    myHRP.CFrame = targetHRP.CFrame * OFFSET_IDLE
                                end
                            end
                        end
                    end
                end)
            end)
        end
    end,
})

HakiTab:Space()

HakiTab:Section({
		Title = "Damage-Dealing Account Settings",
		Icon = "rbxassetid://117391655140076"
	})

HakiTab:Button({
		Title = "Teleport To Farm Place",
		Desc = "Use for main account to teleport to safe place.",
		Callback = function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneOuterSpacePart2"].CFrame * CFrame.new(0, 3.5, 0)
		end,
	})

HakiTab:Space()

HakiTab:Dropdown({
    Title = "Farming Method (Fruit 1)",
	Flag = "Saluna_DropdownFarmingMethodFruit1",
    Values = {"Gum","Slash"},
    Value = nil,
    Callback = function(state)
        getgenv().hakimethod1 = state
    end,
})

HakiTab:Dropdown({
    Title = "Farming Method (Fruit 2)",
	Flag = "Saluna_DropdownFarmingMethodFruit2",
    Values = {"Gum","Slash"},
    Value = nil,
    Callback = function(state)
        getgenv().hakimethod2 = state
    end,
})

HakiTab:Toggle({
    Title = "Auto Deal Damage",
	Flag = "Saluna_AutoDealDamage",
	Desc = "Multi fruits supported.",
    Callback = function(state)
        getgenv().ddmg = state
        if getgenv().SalunaAutoDealDamageThread then
            task.cancel(getgenv().SalunaAutoDealDamageThread)
            getgenv().SalunaAutoDealDamageThread = nil
        end
        if getgenv().SalunaMethodThreads then
            for method, thread in pairs(getgenv().SalunaMethodThreads) do
                if thread then pcall(task.cancel, thread) end
            end
            getgenv().SalunaMethodThreads = nil
        end
        if state then
            getgenv().SalunaMethodThreads = {}
            getgenv().SalunaAutoDealDamageThread = task.spawn(function()
                local currentMethods = {} 
                while getgenv().ddmg do
                    table.clear(currentMethods)
                    local m1 = getgenv().hakimethod1
                    local m2 = getgenv().hakimethod2
                    if m1 and m1 ~= "" then currentMethods[m1] = true end
                    if m2 and m2 ~= "" then currentMethods[m2] = true end
                    for method, _ in pairs(currentMethods) do
                        if not getgenv().SalunaMethodThreads[method] then
                            getgenv().SalunaMethodThreads[method] = task.spawn(function()
                                pcall(function()
                                    if method == "Gum" then 
                                        FarmGum()
                                    elseif method == "Slash" then 
                                        HakiSlash()
                                    end
                                end)
                            end)
                        end
                    end
                    for method, thread in pairs(getgenv().SalunaMethodThreads) do
                        if not currentMethods[method] then
                            if thread then 
                                pcall(task.cancel, thread)
                            end
                            getgenv().SalunaMethodThreads[method] = nil
                        end
                    end
                    task.wait(0.5) 
                end
            end)
        end
    end,
})

	local AltTab = OPDList:Tab({
		Title = "Alt Farming\n(Bounty)",
		Icon = "rbxassetid://11577689639",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

AltTab:Section({
		Title = "Use At Your Own Risk (Visible to Others - Ban Risk)",
		Icon = "solar:danger-triangle-bold"
	})

AltTab:Space()

AltTab:Section({
		Title = "Main Account Settings",
		Icon = "rbxassetid://117391655140076"
	})
AltTab:Space()

AltTab:Button({
		Title = "Teleport To Farm Place",
		Desc = "Use for main account to teleport to safe place.",
		Callback = function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["SafeZoneOuterSpacePart"].CFrame * CFrame.new(0, 3.5, 0)
		end,
	})

AltTab:Space()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local WeaponDropdown = AltTab:Dropdown({
    Title = "Select Weapon",
	Flag = "Saluna_DropdownWeaponType",
    Values = {"Melee", "Sword", "Sniper", "Utility"},
    Value = nil,
    Callback = function(weapon)
        getgenv().weapon = weapon
    end,
})

AltTab:Toggle({
    Title = "Auto Equip Selected Tool",
    Flag = "Saluna_AutoEquipSelectedTool",
    Callback = function(aequiptool)
        getgenv().aequiptool = aequiptool
        if getgenv().SalunaAutoEquipToolThread then
            task.cancel(getgenv().SalunaAutoEquipToolThread)
            getgenv().SalunaAutoEquipToolThread = nil
        end
        if aequiptool then
            getgenv().SalunaAutoEquipToolThread = task.spawn(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local userIdStr = "User_" .. tostring(LocalPlayer.UserId)
                local userData = workspace:WaitForChild("UserData", 5)
                local userFolder = userData and userData:FindFirstChild(userIdStr)
                local weaponsFolder = userFolder and userFolder:WaitForChild("Data", 5) and userFolder.Data:FindFirstChild("Weapons")
                while getgenv().aequiptool do 
                    task.wait(0.1)
                    pcall(function()
                        local weaponType = getgenv().weapon
                        if not weaponType or not weaponsFolder then return end
                        local character = LocalPlayer.Character
                        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                        if not humanoid or humanoid.Health <= 0 then return end
                        local weaponObj = weaponsFolder:FindFirstChild(weaponType .. "Using")
                        local toolName = weaponObj and weaponObj.Value
                        if not toolName or toolName == "" then return end 
                        if character:FindFirstChild(toolName) then return end
                        local backpack = LocalPlayer:FindFirstChild("Backpack")
                        local toolToEquip = backpack and backpack:FindFirstChild(toolName)
                        if toolToEquip then
                            humanoid:EquipTool(toolToEquip)
                        end
                    end)
                end
            end)
        end
    end,
})

AltTab:Toggle({
		Title = "Auto Use Equipped Tool",
		Flag = "Saluna_AutoUseEquippedTool",
		Desc = "Functions as an auto-clicker for your currently equipped tool.",
		Callback = function(aclick)
			getgenv().aclick = aclick
			if getgenv().SalunaAutoClickThread then
				task.cancel(getgenv().SalunaAutoClickThread)
				getgenv().SalunaAutoClickThread = nil
			end
			if aclick then
				getgenv().SalunaAutoClickThread = task.spawn(function()
					local player = game:GetService("Players").LocalPlayer
					while getgenv().aclick do
						pcall(function()
							local char = player.Character
							local tool = char and char:FindFirstChildWhichIsA("Tool")
							if tool then
								tool:Activate()
							end
						end)
						task.wait(0.1)
					end
				end)
			end
		end,
	})

AltTab:Space()

AltTab:Dropdown({
    Title = "Farming Method",
	Flag = "Saluna_DropdownFarmingMethodAlt",
    Values = {"Smelt","Candy","Magma","Venom","Gum","Hot","Barrier","Diamond"},
    Value = nil,
    Callback = function(fmethod)
        getgenv().fmethod = fmethod
    end,
})

AltTab:Toggle({
    Title = "Auto Alt Farming",
    Flag = "Saluna_AutoAltFarming",
    Callback = function(aafarm)
        getgenv().aafarm = aafarm
        if getgenv().SalunaAutoAltFarmMainThread then
            task.cancel(getgenv().SalunaAutoAltFarmMainThread)
            getgenv().SalunaAutoAltFarmMainThread = nil
        end
        if getgenv().SalunaAltFarmSubThread then
            pcall(task.cancel, getgenv().SalunaAltFarmSubThread)
            getgenv().SalunaAltFarmSubThread = nil
        end
        if aafarm then
            local farmMethods = {
                Smelt   = FarmSmelt,
                Diamond = FarmDiamond,
                Candy   = FarmCandy,
                Barrier = FarmBarrier,
                Gum     = FarmGum,
                Magma   = FarmMagma,
                Venom   = FarmVenom,
                Hot     = BodyHot
            }
            getgenv().SalunaAutoAltFarmMainThread = task.spawn(function()
                local lastMethod = nil
                while getgenv().aafarm do
                    local currentMethod = getgenv().fmethod
                    if currentMethod ~= lastMethod then
                        lastMethod = currentMethod
                        if getgenv().SalunaAltFarmSubThread then
                            pcall(task.cancel, getgenv().SalunaAltFarmSubThread)
                            getgenv().SalunaAltFarmSubThread = nil
                        end
                        local targetFarmFunc = farmMethods[currentMethod]
                        if targetFarmFunc then
                            getgenv().SalunaAltFarmSubThread = task.spawn(function()
                                pcall(targetFarmFunc)
                            end)
                        end
                    end
                    task.wait(0.5) 
                end
                lastMethod = nil
            end)
        end
    end,
})

AltTab:Space()

AltTab:Section({
		Title = "Bounty Feeder Alt Settings",
		Icon = "rbxassetid://117391655140076"
	})

AltTab:Space()

local AltDropdown = AltTab:Dropdown({
    Title = "Select Main Account",
	Flag = "Saluna_DropdownMainAccount",
	Desc = "Select the main account to farm bounty. The other alts will teleport to it.",
    Values = getPlayerNames(),
    Value = nil,
    Callback = function(selectedAlt)
        getgenv().selectedAlt = selectedAlt
    end
})


AltTab:Slider({
    Title = "Feed Distance",
	Flag = "Saluna_SliderFeed",
    Step = 1,
    Value = {
        Min = -15, 
        Max = 15, 
        Default = 2
    },
    Callback = function(v)
        getgenv().feeddis = v
    end,
})

AltTab:Toggle({
    Title = "Auto Feed Bounty",
	Flag = "Saluna_AutoFeedBounty",
    Desc = "Turn this on for the alt accounts that will be killed to give bounty.",
    Callback = function(afarmbounty)
getgenv().afarmbounty = afarmbounty
local plr = game.Players.LocalPlayer
local targetName = getgenv().selectedAlt
if afarmbounty then
task.spawn(function()
    while getgenv().afarmbounty do task.wait()
        pcall(function()
            local char = plr.Character
            local targetPlr = game.Players:FindFirstChild(targetName)
            if char and targetPlr and targetPlr.Character then
                local myHRP = char:FindFirstChild("HumanoidRootPart")
                local targetHRP = targetPlr.Character:FindFirstChild("HumanoidRootPart")
                if myHRP and targetHRP then
					distance = getgenv().feeddis or 2
                    myHRP.CFrame = targetHRP.CFrame * CFrame.new(0,0,-distance)
                end
            end
        end)
    end
end)

task.spawn(function()
    while getgenv().afarmbounty do task.wait(.3)
        pcall(function()
            local gui = plr:FindFirstChild("PlayerGui")
            local loadFrame = gui and gui:FindFirstChild("Load") and gui.Load:FindFirstChild("Frame")
            if loadFrame and loadFrame.Visible then
                for _, v in pairs(getconnections(loadFrame.Load.MouseButton1Click)) do
                    v.Function()
                end
            end
        end)
    end
end)
end
    end,
})

	local KillTab = OPDList:Tab({
		Title = "Mobs Farming\n(Kills/Raid)",
		Icon = "rbxassetid://7485051715",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

KillTab:Section({
		Title = "Use At Your Own Risk (Visible to Others - Ban Risk)",
		Icon = "solar:danger-triangle-bold"
	})

KillTab:Space()
local rng = Random.new()
KillTab:Toggle({
    Title = "Random TP (Raid)",
    Desc = "Teleports randomly to evade damage. Required when using Bring Mobs.",
    Flag = "Saluna_RandomTPRaid",
    Callback = function(state)
        getgenv().RandomTPRaid = state
        if getgenv().SalunaRandomTPRaidThread then
            task.cancel(getgenv().SalunaRandomTPRaidThread)
            getgenv().SalunaRandomTPRaidThread = nil
        end
        if state then
            getgenv().SalunaRandomTPRaidThread = task.spawn(function()
                local plr = game:GetService("Players").LocalPlayer
                while getgenv().RandomTPRaid do
                    task.wait(0.5)
                    pcall(function()
                        local char = plr.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local randomX = rng:NextNumber(-966, 943)
                            local randomZ = rng:NextNumber(-621, 358)
                            local fixedY = 1500 
                            hrp.CFrame = CFrame.new(randomX, fixedY, randomZ)
                        end
                    end)
                end
            end)
        end
    end,
})
KillTab:Space()
KillTab:Toggle({
    Title = "Auto Random TP (Use Before Spawn)",
    Flag = "Saluna_AutoRandomTP",
    Desc = "Teleports randomly to evade detection. Required when using Bring Mobs.",
    Callback = function(state)
        getgenv().autoSquareTP = state
        if getgenv().SalunaAutoSquareTPSubThread then
            task.cancel(getgenv().SalunaAutoSquareTPSubThread)
            getgenv().SalunaAutoSquareTPSubThread = nil
        end
        if getgenv().SalunaAutoSquareTPMainThread then
            task.cancel(getgenv().SalunaAutoSquareTPMainThread)
            getgenv().SalunaAutoSquareTPMainThread = nil
        end 
        if state then
            local Players = game:GetService("Players")
            local plr = Players.LocalPlayer
            getgenv().SalunaAutoSquareTPSubThread = task.spawn(function()
                pcall(function()
                    repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    local gui = plr:WaitForChild("PlayerGui")
                    local loadFrame = gui:WaitForChild("Load", 5)
                    if loadFrame and loadFrame.Enabled == true then
                        loadFrame.Enabled = false
                        workspace.CurrentCamera:Destroy()
                        task.wait(0.1)
                        repeat task.wait() until plr.Character ~= nil
                        local humanoid = plr.Character:FindFirstChildWhichIsA('Humanoid')
                        if humanoid then
                            workspace.CurrentCamera.CameraSubject = humanoid
                            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                            plr.CameraMinZoomDistance = 0.5
                            plr.CameraMaxZoomDistance = 400
                            plr.CameraMode = Enum.CameraMode.Classic
                            local head = plr.Character:FindFirstChild("Head")
                            if head then head.Anchored = false end
                        end
                    end
                end)
            end)
            getgenv().SalunaAutoSquareTPMainThread = task.spawn(function()
                local TARGET_Y = 1500
                local SAFE_RADIUS = 200 
                local minX, maxX = -2800, 900
                local minZ, maxZ = -2200, 1100
                local threatPositions = {}
                while getgenv().autoSquareTP do
                    task.wait(0.5)
                    pcall(function()
                        local char = plr.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if not hrp then return end
                        table.clear(threatPositions)
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= plr and p.Character then
                                local p_hrp = p.Character:FindFirstChild("HumanoidRootPart")
                                if p_hrp then
                                    table.insert(threatPositions, p_hrp.Position)
                                end
                            end
                        end
                        local foundSafeSpot = false
                        local nextPos
                        for i = 1, 15 do
                            local randX = math.random(minX, maxX)
                            local randZ = math.random(minZ, maxZ)
                            local testPos = Vector3.new(randX, TARGET_Y, randZ)
                            local isSafe = true
                            for _, threatPos in ipairs(threatPositions) do
                                if (threatPos - testPos).Magnitude <= SAFE_RADIUS then
                                    isSafe = false
                                    break
                                end
                            end
                            if isSafe then
                                nextPos = testPos
                                foundSafeSpot = true
                                break -- Tìm được điểm an toàn rồi thì ngắt vòng lặp tìm kiếm luôn
                            end
                        end
                        if foundSafeSpot then
                            hrp.CFrame = CFrame.new(nextPos) * hrp.CFrame.Rotation
                        else
                            -- Chế độ Panic Mode: Nếu quét 15 lần không ra chỗ trống thì nhảy đại ra xa vị trí cũ
                            local panicX = hrp.Position.X + math.random(-1000, 1000)
                            local panicZ = hrp.Position.Z + math.random(-1000, 1000)
                            hrp.CFrame = CFrame.new(Vector3.new(panicX, TARGET_Y, panicZ)) * hrp.CFrame.Rotation
                        end
                    end)
                end
            end)
        end
    end,
})
KillTab:Space()
KillTab:Slider({
    Title = "Bring Distance",
	Flag = "Saluna_SliderBring",
    Step = 1,
    Value = {
        Min = -15, 
        Max = 15, 
        Default = 0
    },
    Callback = function(v)
        getgenv().bringdis = v
    end,
})

KillTab:Toggle({
    Title = "Bring Mobs",
    Flag = "Saluna_AutoBringMobs",
    Desc = "Pulls enemies to your position and auto-destroys corpses.",
    Callback = function(state)
        getgenv().bringMobs = state
        local function cleanupMobs()
            pcall(function()
                local enemiesFolder = workspace:FindFirstChild("Enemies")
                if enemiesFolder then
                    for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                        local eHrp = enemy:FindFirstChild("HumanoidRootPart")
                        if eHrp and eHrp.Anchored then 
                            eHrp.Anchored = false 
                        end
                    end
                end
            end)
        end
        if getgenv().SalunaBringMobsThread then
            task.cancel(getgenv().SalunaBringMobsThread)
            getgenv().SalunaBringMobsThread = nil
            cleanupMobs()
        end
        if state then
            getgenv().SalunaBringMobsThread = task.spawn(function()
                local plr = game:GetService("Players").LocalPlayer
                local enemiesFolder = workspace:WaitForChild("Enemies", 5)
                local MOB_OFFSET = CFrame.new(0, 0, -1)
                local SIZE_HITBOX = Vector3.new(10, 10, 10)
                local SIZE_ZERO = Vector3.new(0, 0, 0)
                while getgenv().bringMobs do
                    task.wait()
                    pcall(function()
                        local char = plr.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
						local bringdis = getgenv().bringdis or 0 
                        if not hrp or not enemiesFolder then return end
                        local targetCFrame = hrp.CFrame * CFrame.new(0,0,-bringdis)
                        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                            local eHrp = enemy:FindFirstChild("HumanoidRootPart")
                            local eHum = enemy:FindFirstChildOfClass("Humanoid")
                            if eHrp and eHum then
                                if eHum.Health > 0 then
                                    if eHrp.CanCollide then eHrp.CanCollide = false end
                                    if eHrp.Size ~= SIZE_HITBOX then eHrp.Size = SIZE_HITBOX end
                                    if not eHrp.Anchored then eHrp.Anchored = true end
                                    eHrp.CFrame = targetCFrame * MOB_OFFSET
                                else
                                    eHrp.Size = SIZE_ZERO
                                    enemy:Destroy()
                                end
                            end
                        end
                    end)
                end
                cleanupMobs()
            end)
        else
            cleanupMobs()
        end
    end
})

KillTab:Space()

KillTab:Dropdown({
    Title = "Farming Method (Requires Body Skill)",
	Flag = "Saluna_DropdownFarmingMethodBody",
    Values = {"Venom", "Magma", "Snow","Smelt", "Hot", "Candy"},
    Value = nil,
    Callback = function(bodymethod)
        getgenv().bodymethod = bodymethod
    end,
})

KillTab:Toggle({
    Title = "Auto Body",
	Flag = "Saluna_AutoBody",
    Desc = "Requires body skill. Higher affinity yield faster farming speeds.",
    Callback = function(abody)
        getgenv().abody = abody
        if abody then
            task.spawn(function()
                local lastMethods = nil
                while getgenv().abody do
                    local currentMethods = getgenv().bodymethod
                    if currentMethods ~= lastMethods then
                        lastMethods = currentMethods
                        if currentMethods == "Smelt" then
                            BodySmelt()
                        elseif currentMethods == "Candy" then
                            BodyCandy()
                        elseif currentMethods == "Magma" then
                            BodyMagma()
                        elseif currentMethods == "Venom" then
                            BodyVenom()
                        elseif currentMethods == "Hot" then
                            BodyHot()
                        elseif currentMethods == "Snow" then
                            BodySnow()
                        end
                    end
                    task.wait(0.5) 
                end
                lastMethods = nil
            end)
        end
    end,
})

	local AffinityTab = OPDList:Tab({
		Title = "Affinity",
		Icon = "rbxassetid://17894477503",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	local HTUSection = AffinityTab:Section({
		Title = "How to Use?",
	})

	HTUSection:Space()

	HTUSection:Section({
		Title = "How to Use Affinity Reroll",
		TextSize = 24,
		FontWeight = Enum.FontWeight.SemiBold,
	})

	HTUSection:Section({
		Title = "Devil Fruit Point: Set the minimum affinity value you wish to keep.\n\nTarget Affinity: Select the stats you want to target. For example, if you choose Melee and Sword, the script will ignore Sniper and Defense. Once a target stat meets the requirement, it will be locked while the script continues rerolling for the remaining ones.\n\n*Note: Affinities must be selected as targets to be locked; otherwise, they will remain unlocked.\n\nBudget Type: Select the currency used for rerolling.",
		TextSize = 18,
		TextTransparency = 0.35,
		FontWeight = Enum.FontWeight.Medium,
	})

	HTUSection:Space()

	AffinityTab:Space()

AffinityTab:Slider({
    Title = "1st Devil Fruit Point",
	Flag = "Saluna_SliderDF1",
    Step = 0.1, -- Cho phép chọn số thập phân (1.1, 1.2...)
    Value = {
        Min = 1, 
        Max = 2, 
        Default = 1.9
    },
    Callback = function(v)
        getgenv().affpointnew = v
    end,
})

local targetStats = {Defense = false, Melee = false, Sniper = false, Sword = false}
AffinityTab:Dropdown({
    Title = "Target Affinity (DFT 1)",
	Flag = "Saluna_DropdownTargetAffDF1",
    Values = {"Defense", "Melee", "Sniper", "Sword"},
    Multi = true,
    Callback = function(selectedTable)
        for stat in pairs(targetStats) do targetStats[stat] = false end
        for _, value in pairs(selectedTable) do
            if targetStats[value] ~= nil then
                targetStats[value] = true
            end
        end
    end
})

AffinityTab:Dropdown({
    Title = "Budget Type (DFT 1)",
	Flag = "Saluna_DropdownBudgetTypeDF1",
    Values = {"Cash", "Gems"},
    Value = "Cash",
    Callback = function(v)
        getgenv().kindbud = v
    end
})

AffinityTab:Toggle({
    Title = "Auto Roll Affinity (DF1)",
    Flag = "Saluna_AutoRollAffintyDF1",
    Callback = function(state)
        getgenv().rolznewaff = state
        if getgenv().SalunaAutoAffinityDF1Thread then
            task.cancel(getgenv().SalunaAutoAffinityDF1Thread)
            getgenv().SalunaAutoAffinityDF1Thread = nil
        end
        if state then
if triggernotify == true then
            WindUI:Notify({
                Title = "Saluna Auto Affinity",
                Content = "Started (DFT 1)",
                Icon = "solar:bell-bold",
                Duration = 3,
                CanClose = false,
            })
end
            getgenv().SalunaAutoAffinityDF1Thread = task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local userId = player.UserId
                local userData = workspace:WaitForChild("UserData"):WaitForChild("User_"..userId)
                local dataFolder = userData:WaitForChild("Data")
                local affinities = dataFolder:WaitForChild("Affinities", 5)
                local remote = workspace.Merchants.AffinityMerchant.Clickable.AffinityUI.Clicked.Retum
                if not affinities or not remote then return end
                local dft1Def = affinities:WaitForChild("DFT1Defense")
                local dft1Melee = affinities:WaitForChild("DFT1Melee")
                local dft1Snip = affinities:WaitForChild("DFT1Sniper")
                local dft1Sword = affinities:WaitForChild("DFT1Sword")
                while getgenv().rolznewaff do
                    pcall(function()
                        local tStats = _G.targetStats or getgenv().targetStats or targetStats
                        if not tStats then return end
                        local targetPoint = getgenv().affpointnew or 1.9
                        local curDef = dft1Def.Value
                        local curMelee = dft1Melee.Value
                        local curSnip = dft1Snip.Value
                        local curSword = dft1Sword.Value
                        local keepDef = tStats.Defense and (curDef >= targetPoint)
                        local keepMelee = tStats.Melee and (curMelee >= targetPoint)
                        local keepSnip = tStats.Sniper and (curSnip >= targetPoint)
                        local keepSw = tStats.Sword and (curSword >= targetPoint)
                        local needRoll = (tStats.Defense and not keepDef) or 
                                         (tStats.Melee and not keepMelee) or 
                                         (tStats.Sniper and not keepSnip) or 
                                         (tStats.Sword and not keepSw)
                        if needRoll and getgenv().rolznewaff then
                            local oldSum = curDef + curMelee + curSnip + curSword
                            local currency = getgenv().kindbud or "Cash"
                            remote:FireServer("DFT1", keepDef, keepMelee, keepSnip, keepSw, currency, false)
if triggernotify == true then
                            WindUI:Notify({
                                Title = "Saluna Auto Affinity",
                                Content = "Rolled (DFT 1)",
                                Icon = "solar:bell-bold",
                                Duration = 3,
                                CanClose = false,
                            })
end
                            local startWait = tick()
                            repeat
                                task.wait(0.5)
                            until (not getgenv().rolznewaff) 
                                or (dft1Def.Value + dft1Melee.Value + dft1Snip.Value + dft1Sword.Value ~= oldSum) 
                                or (tick() - startWait > 12)
                        end
                    end)
                    task.wait(1) 
                end
            end)
        else
if triggernotify == true then
            WindUI:Notify({
                Title = "Saluna Auto Affinity",
                Content = "Stopped (DFT 1)",
                Icon = "solar:bell-bold",
                Duration = 3,
                CanClose = false,
            })
end
        end
    end
})

AffinityTab:Space()

AffinityTab:Slider({
    Title = "2nd Devil Fruit Point",
	Flag = "Saluna_SliderDF2",
    Step = 0.1,
    Value = {Min = 1, Max = 2, Default = 1.9},
    Callback = function(v)
        getgenv().affpointnew2 = v -- Biến riêng cho DF2
    end,
})

local targetStats2 = {Defense = false, Melee = false, Sniper = false, Sword = false}
AffinityTab:Dropdown({
    Title = "Target Affinity (DFT 2)",
	Flag = "Saluna_DropdownTargetAffDF2",
    Values = {"Defense", "Melee", "Sniper", "Sword"},
    Multi = true,
    Callback = function(selectedTable)
        for stat in pairs(targetStats2) do targetStats2[stat] = false end
        for _, value in pairs(selectedTable) do
            if targetStats2[value] ~= nil then
                targetStats2[value] = true
            end
        end
    end
})

AffinityTab:Dropdown({
    Title = "Budget Type (DFT 2)",
	Flag = "Saluna_DropdownBudgetTypeDF2",
    Values = {"Cash", "Gems"},
    Value = "Cash",
    Callback = function(v)
        getgenv().kindbud2 = v
    end
})

AffinityTab:Toggle({
    Title = "Auto Roll Affinity (DFT 2)",
    Flag = "Saluna_AutoRollAffinityDF2",
    Callback = function(state)
        getgenv().rolznewaff2 = state
        if getgenv().SalunaAutoAffinityDF2Thread then
            task.cancel(getgenv().SalunaAutoAffinityDF2Thread)
            getgenv().SalunaAutoAffinityDF2Thread = nil
        end
        if state then
if triggernotify == true then
            WindUI:Notify({
                Title = "Saluna Auto Affinity",
                Content = "Started (DFT 2)",
                Icon = "solar:bell-bold",
                Duration = 3,
                CanClose = false,
            })
end
            getgenv().SalunaAutoAffinityDF2Thread = task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local userId = player.UserId
                local userData = workspace:WaitForChild("UserData"):WaitForChild("User_"..userId)
                local dataFolder = userData:WaitForChild("Data")
                local affinities = dataFolder:WaitForChild("Affinities", 5)
                local remote = workspace.Merchants.AffinityMerchant.Clickable.AffinityUI.Clicked.Retum
                if not affinities or not remote then return end
                local dft2Def = affinities:WaitForChild("DFT2Defense")
                local dft2Melee = affinities:WaitForChild("DFT2Melee")
                local dft2Snip = affinities:WaitForChild("DFT2Sniper")
                local dft2Sword = affinities:WaitForChild("DFT2Sword")
                while getgenv().rolznewaff2 do
                    pcall(function()
                        local tStats2 = _G.targetStats2 or getgenv().targetStats2 or targetStats2
                        if not tStats2 then return end
                        local targetPoint = getgenv().affpointnew2 or 1.9
                        local curDef = dft2Def.Value
                        local curMelee = dft2Melee.Value
                        local curSnip = dft2Snip.Value
                        local curSword = dft2Sword.Value
                        local keepDef = tStats2.Defense and (curDef >= targetPoint)
                        local keepMelee = tStats2.Melee and (curMelee >= targetPoint)
                        local keepSnip = tStats2.Sniper and (curSnip >= targetPoint)
                        local keepSw = tStats2.Sword and (curSword >= targetPoint)
                        local needRoll = (tStats2.Defense and not keepDef) or 
                                         (tStats2.Melee and not keepMelee) or 
                                         (tStats2.Sniper and not keepSnip) or 
                                         (tStats2.Sword and not keepSw)
                        if needRoll and getgenv().rolznewaff2 then
                            local oldSum = curDef + curMelee + curSnip + curSword
                            local currency = getgenv().kindbud2 or "Cash"
                            remote:FireServer("DFT2", keepDef, keepMelee, keepSnip, keepSw, currency, false)
if triggernotify == true then
                            WindUI:Notify({
                                Title = "Saluna Auto Affinity",
                                Content = "Rolled (DFT 2)",
                                Icon = "solar:bell-bold",
                                Duration = 3,
                                CanClose = false,
                            })
end
                            local startWait = tick()
                            repeat
                                task.wait(0.5)
                            until (not getgenv().rolznewaff2) 
                                or (dft2Def.Value + dft2Melee.Value + dft2Snip.Value + dft2Sword.Value ~= oldSum) 
                                or (tick() - startWait > 12)
                        end
                    end)
                    task.wait(1) 
                end
            end)
        else
if triggernotify == true then
            WindUI:Notify({
                Title = "Saluna Auto Affinity",
                Content = "Stopped (DFT 2)",
                Icon = "solar:bell-bold",
                Duration = 3,
                CanClose = false,
            })
end
        end
    end
})

	local TeleSection = OPDList:Tab({
		Title = "Teleport",
		Icon = "rbxassetid://106654820162434",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

local function getMerchantsNames()
    local names = {}
    for _, v in ipairs(workspace.Merchants:GetChildren()) do
        table.insert(names, v.Name)
    end
    return names
end
pcall(function()
local MerchantsDropdown = TeleSection:Dropdown({
    Title = "NPC TP",
    Values = getMerchantsNames(),
    Value = nil,
    Callback = function(npc)
        if isUpdating or npc == nil then 
            return 
        end
        pcall(function()
            local targetNPC = workspace:WaitForChild("Merchants"):FindFirstChild(npc)
            if targetNPC and targetNPC:FindFirstChild("HumanoidRootPart") then
                local tweenpos = targetNPC.HumanoidRootPart.CFrame
                    local player = game:GetService("Players").LocalPlayer
                    local char = player.Character or player.CharacterAdded:Wait()
                    local root = char:WaitForChild("HumanoidRootPart")
                        root.CFrame = tweenpos
            end
        end)
    end
})
local function updateDropdownmerchant()
    isUpdating = true 
    local currentMerchants = getMerchantsNames()
    MerchantsDropdown:Refresh(currentMerchants)
    task.wait(0.2) 
    isUpdating = false
end

workspace.Merchants.ChildAdded:Connect(function()
    task.wait(1)
    updateDropdownmerchant()
end)

workspace.Merchants.ChildRemoved:Connect(function()
    updateDropdownmerchant()
end)
end)
	TeleSection:Dropdown({
		Title = "Position TP",
		Values = {
			"Sam Island", "Sand/Windmill", "Cave", "Near-Bar Island", "Bar","Boss-5K/Tornado Island","Krizma Island", "Sand Castle","Crab Island", "Purple Island", "Merlin/Boar Island","Flail Island","Snowy Island","Big Snow Mountain","Big Black Mountain","Marine Ford","Forest","Green Rock","Race/New Island","Pyramid","Mansion","Moon Island","Vokun Island"
		},
		Callback = function(zxcrris)
if zxcrris == "Sam Island" then
tweenpos = CFrame.new(-1280.31726, 239.998398, -1326.91028)
elseif zxcrris == "Sand/Windmill" then
tweenpos = CFrame.new(85.0743713, 282.310211, -36.9613533)
elseif zxcrris == "Crab Island" then
tweenpos = CFrame.new(1200.20361, 252.999985, -290.508331)
elseif zxcrris == "Cave" then
tweenpos = CFrame.new(1.43468678, 306.999908, -927.490723)
elseif zxcrris == "Near-Bar Island" then
tweenpos = CFrame.new(887.123474, 302.998199, 1218.83557)
elseif zxcrris == "Bar" then
tweenpos = CFrame.new(1520.92224, 303.489471, 2138.15845)
elseif zxcrris == "Boss-5K/Tornado Island" then
tweenpos = CFrame.new(4854.58057, 605.394287, -7281.04297)
elseif zxcrris == "Krizma Island" then
tweenpos = CFrame.new(-1074.56641, 376.999908, 1667.55762)
elseif zxcrris == "Sand Castle" then
tweenpos = CFrame.new(1078.84058, 245.200073, -3333.86084)
elseif zxcrris == "Purple Island" then
tweenpos = CFrame.new(-5169.17529, 522.999817, -7776.02295)
elseif zxcrris == "Merlin/Boar Island" then
tweenpos = CFrame.new(-1691.63733, 231.493622, -288.033234)
elseif zxcrris == "Flail Island" then
tweenpos = CFrame.new(1133.75415, 230.999908, 3368.14087)
elseif zxcrris == "Snowy Island" then
tweenpos = CFrame.new(-1892.50696, 224.999954, 3303.00659)
elseif zxcrris == "Big Snow Mountain" then
tweenpos = CFrame.new(6225.76221, 485.999908, -1601.78601)
elseif zxcrris == "Big Black Mountain" then
tweenpos = CFrame.new(2013.95776, 487.999908, -720.344543)
elseif zxcrris == "Marine Ford" then
tweenpos = CFrame.new(-3133.93311, 275.901154, -3643.74341)
elseif zxcrris == "Forest" then
tweenpos = CFrame.new(-6015.46631, 401.999908, 13.9106245)
elseif zxcrris == "Green Rock" then
tweenpos = CFrame.new(-2623.29224, 269.599915, 1090.10852)
elseif zxcrris == "Race/New Island" then
tweenpos = CFrame.new(-6370.9834, 258.601776, 3841.90991)
elseif zxcrris == "Pyramid" then
tweenpos = CFrame.new(118.847107, 309.999908, 4943.37939)
elseif zxcrris == "Mansion" then
tweenpos = CFrame.new(1835.2124, 269.999908, 861.194275)
elseif zxcrris == "Moon Island" then
tweenpos = CFrame.new(3188.60791, 356.999908, 1627.56262)
elseif zxcrris == "Vokun Island" then
tweenpos = CFrame.new(4434.4165, 487.999908, 5735.77051)
end
if tweenpos ~= nil then
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
root.CFrame = tweenpos
end
		end,
	})

TeleSection:Button({
		Title = "Dark Altar",
		Callback = function()
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local altar = game:GetService("Workspace").Altar.RecepticalEffect
root.CFrame = altar.CFrame
		end,
	})

	local PlayerSection = OPDList:Tab({
		Title = "Players",
		Icon = "rbxassetid://2795572800",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

local PlayerDropdown = PlayerSection:Dropdown({
    Title = "Select Player",
    Values = getPlayerNames(),
    Value = nil,
    Callback = function(selectedName)
        getgenv().SelectedPlr = selectedName
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer -- Lưu LocalPlayer ra ngoài để tối ưu

local function updateDropdownplr()
    local currentPlayers = getPlayerNames()
    pcall(function()
        PlayerDropdown:Refresh(currentPlayers)
        AltDropdown:Refresh(currentPlayers)
        HakiDropdown:Refresh(currentPlayers)
    end)
end

local dropdownUpdateThread = nil

local function queueDropdownUpdate()
    if dropdownUpdateThread then
        task.cancel(dropdownUpdateThread)
    end
    
    dropdownUpdateThread = task.delay(1, function()
        updateDropdownplr()
        dropdownUpdateThread = nil
    end)
end
Players.PlayerAdded:Connect(queueDropdownUpdate)
Players.PlayerRemoving:Connect(queueDropdownUpdate)

PlayerSection:Toggle({
    Title = "View Selected Player",
    Flag = "Saluna_AutoViewSelectedPlayer",
    Callback = function(v)
        getgenv().viewplr = v
        if getgenv().SalunaViewPlayerThread then
            task.cancel(getgenv().SalunaViewPlayerThread)
            getgenv().SalunaViewPlayerThread = nil
        end
        local lp = game:GetService("Players").LocalPlayer
        local function resetCamera()
            pcall(function()
                local camera = workspace.CurrentCamera or workspace:FindFirstChildOfClass("Camera")
                local lpHum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
                if camera and lpHum then
                    camera.CameraSubject = lpHum
                end
            end)
        end
        if v then
            getgenv().SalunaViewPlayerThread = task.spawn(function()
                while getgenv().viewplr do
                    task.wait(0.1) 
                    pcall(function()
                        local camera = workspace.CurrentCamera or workspace:FindFirstChildOfClass("Camera")
                        if not camera then return end
                        local targetName = getgenv().SelectedPlr
                        local target = targetName and game:GetService("Players"):FindFirstChild(targetName)
                        local targetHum = target and target.Character and target.Character:FindFirstChildOfClass("Humanoid")
                        if targetHum then
                            if camera.CameraSubject ~= targetHum then
                                camera.CameraSubject = targetHum
                            end
                        else
                            local lpHum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
                            if lpHum and camera.CameraSubject ~= lpHum then
                                camera.CameraSubject = lpHum
                            end
                        end
                    end)
                end
                resetCamera()
            end)
        else
            resetCamera()
        end
    end,
})

PlayerSection:Button({
    Title = "TP To Selected Player",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local targetPlr = game.Players:FindFirstChild(getgenv().SelectedPlr)
        if not hrp or not targetPlr or not targetPlr.Character or not targetPlr.Character:FindFirstChild("HumanoidRootPart") then
if triggernotify == true then
            WindUI:Notify({
                Title = "Saluna Notify",
                Content = "Can't Find Selected Player",
				Icon = "solar:bell-bold",
				Duration = 2,
				CanClose = false,
            })
end
            return
        end
        local targetHRP = targetPlr.Character.HumanoidRootPart
            if targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") then
            hrp.CFrame = targetHRP.CFrame
            end
    end,
})

PlayerSection:Space()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ESP_ID = "NameEsp_" .. math.random(1, 1000000)
getgenv().ESP_Enabled = false
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end

local function GetPlayerEquipmentData(userFolder)
    if not userFolder then return "None", "None" end
    local dataFolder = userFolder:FindFirstChild("Data")
    if not dataFolder then return "Loading...", "Loading..." end
    local df1 = dataFolder:FindFirstChild("DevilFruit")
    local df2 = dataFolder:FindFirstChild("DevilFruit2")
    local fruitStr = (df1 and df1.Value or "None") .. " " .. (df2 and df2.Value or "")
    local swordStr = "None"
    local weapons = dataFolder:FindFirstChild("Weapons")
    local sword = weapons and weapons:FindFirstChild("SwordUsing")
    if sword and sword.Value ~= "" then
        swordStr = sword.Value
    end
    return fruitStr, swordStr
end

local function ClearESP()
    for _, v in ipairs(Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Head") then
            local bill = v.Character.Head:FindFirstChild(ESP_ID)
            if bill then bill:Destroy() end
        end
    end
end

local function UpdatePlayerChams()
    if not getgenv().ESP_Enabled then return end
    local userDataFolder = Workspace:FindFirstChild("UserData")
    if not userDataFolder then return end
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            local head = v.Character.Head
            local trait = v.Character:FindFirstChild("CharacterTrait")
            if trait and trait:FindFirstChild("Health") and trait:FindFirstChild("HealthMax") then
                local bill = head:FindFirstChild(ESP_ID)
                if not bill then
                    bill = Instance.new('BillboardGui')
                    bill.Name = ESP_ID
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 75)
                    bill.Adornee = head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel')
                    name.Name = "ESPText"
                    name.FontFace = Font.fromName("Merriweather")
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == LocalPlayer.Team then
                        name.TextColor3 = Color3.fromRGB(0, 255, 127)
                    else
                        name.TextColor3 = Color3.fromRGB(255, 50, 50)
                    end
                    name.Parent = bill
                    bill.Parent = head
                end
                local espText = bill:FindFirstChild("ESPText")
                if espText then
                    local distance = 0
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                        distance = round((LocalPlayer.Character.Head.Position - head.Position).Magnitude)
                    end
                    local userFolder = userDataFolder:FindFirstChild("User_" .. tostring(v.UserId))
                    local fruits, sword = GetPlayerEquipmentData(userFolder)
                    local hp = math.floor(trait.Health.Value)
                    local maxHp = math.floor(trait.HealthMax.Value)
                    espText.Text = string.format("%s\n%d studs\n%s\nHP: %d/%d\nSword: %s", v.Name, distance, fruits, hp, maxHp, sword)
                end
            end
        end
    end
end

PlayerSection:Toggle({
    Title = "ESP Players",
    Flag = "Saluna_ESPPlayers",
    Callback = function(state)
        getgenv().ESP_Enabled = state
        if getgenv().SalunaESPPlayersThread then
            task.cancel(getgenv().SalunaESPPlayersThread)
            getgenv().SalunaESPPlayersThread = nil
        end
        ClearESP()
        if state then
            getgenv().SalunaESPPlayersThread = task.spawn(function()
                while getgenv().ESP_Enabled do
                    pcall(UpdatePlayerChams)
                    task.wait(0.1)
                end
                ClearESP()
            end)
        end
    end,
})

local PVPTab = OPDList:Tab({
		Title = "PVP",
		Icon = "rbxassetid://3079643999",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

-- Khởi tạo kho chứa các kết nối (Connection) toàn cục để quản lý và dọn dẹp luồng ma
getgenv().SalunaObsConns = getgenv().SalunaObsConns or {}

local function clearAllObsConnections()
	for key, conn in pairs(getgenv().SalunaObsConns) do
		if conn then conn:Disconnect() end
	end
	table.clear(getgenv().SalunaObsConns)
end

local function clearAllObsConnections()
	for key, conn in pairs(getgenv().SalunaObsConns) do
		if conn then conn:Disconnect() end
	end
	table.clear(getgenv().SalunaObsConns)
end

PVPTab:Toggle({
	Title = "Saluna Observation Mode",
	Flag = "Saluna_NewObservationMode",
	Desc = "The observation script that Oblivic and Lyla made is bullshit, so I remade it. It targets players with an outline ESP and features zero delay for instant On/Off.",
	Callback = function(state)
		getgenv().obsmode = state
		local Players = game:GetService("Players")
		local ContextActionService = game:GetService("ContextActionService")
		local plr = Players.LocalPlayer
		
		-- 🔥 BẢO VỆ LUỒNG CHỜ: Hủy ngay tiến trình setup dang dở nếu người dùng gạt TẮT
		if getgenv().SalunaObsSetupThread then 
			task.cancel(getgenv().SalunaObsSetupThread) 
			getgenv().SalunaObsSetupThread = nil 
		end

		if not state then
			clearAllObsConnections()
			ContextActionService:UnbindAction("Observ")
			ContextActionService:UnbindAction("ObservC")
			
			-- Tối ưu dọn rác: Thay vì Destroy, ta chỉ cần ẩn nó đi để tiết kiệm tài nguyên
			for _, p in ipairs(Players:GetPlayers()) do
				if p.Character then
					local esp = p.Character:FindFirstChild("SalunaESP")
					if esp then esp.Enabled = false end
				end
			end
			
			local gui = plr:FindFirstChild("PlayerGui")
			local origScript = gui and gui:FindFirstChild("PressR_Observationv2")
			if origScript then origScript.Disabled = false end
			return
		end

		getgenv().SalunaObsSetupThread = task.spawn(function()
			local userData = workspace:WaitForChild("UserData", 10)
			if not userData then return end
			local store = userData:WaitForChild("User_" .. plr.UserId, 5)
			if not store then return end
			local data = store:WaitForChild("Data", 5)
			local HakiLevel = data and data:WaitForChild("HakiLvl", 5)
			local FinishedLoading = store:WaitForChild("FullyLoaded", 5)
			
			if not FinishedLoading or not HakiLevel then return end
			repeat task.wait(0.2) until FinishedLoading.Value == true
			
			local gui = plr:FindFirstChild("PlayerGui")
			local origScript = gui and gui:FindFirstChild("PressR_Observationv2")
			if origScript then origScript.Disabled = true end
			
			-- 🚀 TỐI ƯU HIỆU NĂNG RENDER ĐỒ HỌA (CHỐNG GIẬT LAG)
			local function addESP(character, alwaysOnTop)
				if not character or not character:FindFirstChild("HumanoidRootPart") then return end
				local hum = character:FindFirstChild("Humanoid")
				if not hum or hum.Health <= 0 then return end
				
				local hl = character:FindFirstChild("SalunaESP")
				if not hl then
					-- Chỉ tạo mới 1 lần duy nhất cho mỗi nhân vật
					hl = Instance.new("Highlight")
					hl.Name = "SalunaESP"
					hl.FillColor = Color3.fromRGB(255, 0, 0)
					hl.FillTransparency = 0.5
					hl.OutlineColor = Color3.fromRGB(255, 255, 255)
					hl.Parent = character
				end
				-- Những lần sau chỉ cần bật nó lên (Không tốn CPU tạo mới)
				hl.DepthMode = alwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
				hl.Enabled = true 
			end
			
			local function removeESP(character)
				if character then
					local esp = character:FindFirstChild("SalunaESP")
					-- Thay vì Destroy(), ta chỉ tắt trạng thái Enabled đi (Nhanh gấp 10 lần)
					if esp then esp.Enabled = false end
				end
			end
			
			local function setAllESP(enable, alwaysOnTop)
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= plr and p.Character then
						if enable then addESP(p.Character, alwaysOnTop) else removeESP(p.Character) end
					end
				end
			end
			
			local function Observation(actionName, inputState, _inputObj)
				if HakiLevel.Value < 1 then return end
				local hLvl = HakiLevel.Value
				local userFolder = userData:FindFirstChild("User_" .. plr.UserId)
				if not userFolder then return end
				
				if inputState == Enum.UserInputState.Begin then
					if userFolder:FindFirstChild("HakiBar") and userFolder.HakiBar.Value <= 0 then return end
					local charTrait = plr.Character and plr.Character:FindFirstChild("CharacterTrait")
					if charTrait and charTrait:FindFirstChild("Health") and charTrait.Health.Value > 0 then
						if actionName == "MousyClickObservation" then
							pcall(function() script.Parent.MobileContext.ContextButtonFrame.Button4.ImageColor3 = Color3.new(0.2, 0.2, 0.6) end)
						end
						task.spawn(function() userFolder.III:FireServer("On", hLvl) end)
						setAllESP(true, hLvl >= 100)
					end
				elseif inputState == Enum.UserInputState.End then
					pcall(function() script.Parent.MobileContext.ContextButtonFrame.Button4.ImageColor3 = Color3.new(1, 1, 1) end)
					setAllESP(false)
					task.spawn(function() userFolder.III:FireServer("Off", hLvl) end)
				end
			end
			
			local function SetupChar(char)
				task.spawn(function()
					local obs = char:WaitForChild("UsingObs", 5)
					if obs then
						if getgenv().SalunaObsConns.UsingObs then 
							getgenv().SalunaObsConns.UsingObs:Disconnect() 
						end
						getgenv().SalunaObsConns.UsingObs = obs:GetPropertyChangedSignal("Value"):Connect(function()
							if obs.Value == false then
								pcall(function() script.Parent.MobileContext.ContextButtonFrame.Button4.ImageColor3 = Color3.new(1, 1, 1) end)
								setAllESP(false)
							end
						end)
					end
				end)
			end
			
			if plr.Character then SetupChar(plr.Character) end
			getgenv().SalunaObsConns.CharAdded = plr.CharacterAdded:Connect(SetupChar)
			
			local function updateBinds()
				ContextActionService:UnbindAction("Observ")
				ContextActionService:UnbindAction("ObservC")
				local hotkeys = data:FindFirstChild("Hotkeys")
				if hotkeys then
					local basicKey = hotkeys:FindFirstChild("Basic_Observation") or hotkeys:FindFirstChild("Basic-Observation")
					if basicKey then
						pcall(function() ContextActionService:BindAction("Observ", Observation, false, Enum.KeyCode[basicKey.Value]) end)
					end
				end
				if data:FindFirstChild("ControllerType") and data.ControllerType.Value == "Legacy" then
					pcall(function() ContextActionService:BindAction("ObservC", Observation, false, Enum.KeyCode.ButtonY) end)
				end
			end
			
			updateBinds()
			
			local hotkeys = data:FindFirstChild("Hotkeys")
			if hotkeys then
				local b1 = hotkeys:FindFirstChild("Basic_Observation")
				local b2 = hotkeys:FindFirstChild("Basic-Observation")
				if b1 then getgenv().SalunaObsConns.Bind1 = b1:GetPropertyChangedSignal("Value"):Connect(updateBinds) end
				if b2 then getgenv().SalunaObsConns.Bind2 = b2:GetPropertyChangedSignal("Value"):Connect(updateBinds) end
			end
			if data:FindFirstChild("ControllerType") then
				getgenv().SalunaObsConns.CtrlType = data.ControllerType:GetPropertyChangedSignal("Value"):Connect(updateBinds)
			end
		end)
	end,
})

local MiscSection = Window:Section({
	Title = "Misc",
})

local ShopTab = MiscSection:Tab({
		Title = "Shop",
		Icon = "rbxassetid://11385395241",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})
ShopTab:Section({
		Title = "Sword",
		Icon = "rbxassetid://4391741881"
	})
	ShopTab:Button({
		Title = "Krizma",
		Desc = "80,000 Beries",
		Callback = function()
local args = {
	"Krizma"
}
workspace:WaitForChild("Merchants"):WaitForChild("KrizmaMerch"):WaitForChild("Clickable"):WaitForChild("Retum"):FireServer(unpack(args))
		end,
	})

local MiscThingTab = MiscSection:Tab({
		Title = "Misc",
		Icon = "rbxassetid://91779594529826",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})


MiscThingTab:Toggle({
    Title = "Auto Reconnect on Disconnect or Kick",
    Flag = "Saluna_AutoReconnectOnDisconnect",
    Desc = "Anti-Disconnect System. Automatically teleports you back to the game if you get kicked or disconnected.",
    Callback = function(state)
        getgenv().autoRejoin = state
        
        -- 🛡️ CHỐNG LUỒNG MA: Khai tử vòng lặp cũ ngay lập tức khi gạt nút
        if getgenv().SalunaRejoinThread then
            task.cancel(getgenv().SalunaRejoinThread)
            getgenv().SalunaRejoinThread = nil
        end
        
        if state then
            local CoreGui = game:GetService("CoreGui")
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
            local HttpService = game:GetService("HttpService")
            
            -- 🚀 KHỞI ĐỘNG CỖ MÁY QUÉT NGẦM
            getgenv().SalunaRejoinThread = task.spawn(function()
                while getgenv().autoRejoin do
                    task.wait(0.5) -- Cứ 0.5 giây mở mắt quét 1 lần
                    
                    local shouldBreak = false 
                    
                    pcall(function()
                        local robloxPromptGui = CoreGui:FindFirstChild("RobloxPromptGui")
                        local promptOverlay = robloxPromptGui and robloxPromptGui:FindFirstChild("promptOverlay")
                        local errorPrompt = promptOverlay and promptOverlay:FindFirstChild("ErrorPrompt")
                        
                        -- 🔥 ĐÁNH CHẶN
                        if errorPrompt and errorPrompt.Visible == true then
                            getgenv().autoRejoin = false
                            
                            pcall(function()
                                WindUI:Notify({
                                    Title = "Saluna Anti-Disconnect",
                                    Content = "Kick or Disconnect detected! Reconnecting to server...",
                                    Icon = "solar:refresh-bold",
                                    Duration = 3,
                                    CanClose = false,
                                })
                            end)
                            
                            task.wait(0.5) 
                            
                            -- 🛠️ TỐI ƯU 1: Thêm 'local' để code sạch và an toàn hơn
                            local PlaceId = game.PlaceId
                            local JobId = game.JobId
                            local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
                            local teleported = false -- Cờ kiểm tra nhảy server thành công chưa
                            
                            if httprequest then
                                local servers = {}
                                local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
                                
                                if req and req.Body then
                                    local body = HttpService:JSONDecode(req.Body)
                                    if body and body.data then
                                        for i, v in next, body.data do
                                            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                                                table.insert(servers, 1, v.id)
                                            end
                                        end
                                    end
                                end

                                if #servers > 0 then
                                    TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
                                    teleported = true
                                end
                            end
                            
                            -- 🛠️ TỐI ƯU 2: Fallback an toàn tuyệt đối
                            if not teleported then
                                -- Nếu tìm server rảnh thất bại, ép hệ thống tự quăng vào server random
                                TeleportService:Teleport(PlaceId, Players.LocalPlayer)
                            end
                            
                            shouldBreak = true 
                        end
                    end)
                    
                    -- 🛡️ Ngắt luồng hợp pháp
                    if shouldBreak then
                        if getgenv().SalunaRejoinThread then
                            task.cancel(getgenv().SalunaRejoinThread)
                            getgenv().SalunaRejoinThread = nil
                        end
                        break 
                    end
                end
            end)
        else
            pcall(function()
                WindUI:Notify({
                    Title = "Saluna Anti-Disconnect",
                    Content = "Auto Rejoin has been deactivated safely.",
                    Icon = "solar:stop-bold",
                    Duration = 2,
                    CanClose = false,
                })
            end)
        end
    end,
})
MiscThingTab:Space()
MiscThingTab:Button({
		Title = "Hide Stats",
		Callback = function()
local player = game:GetService("Players").LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local function forcehide()
    pcall(function()
        local menu = pgui:FindFirstChild("MenuNew")
        if menu then
            local targetFrameC = menu.Frame.C.Frame
                targetFrameC.TotalLevel.TextColor3 = Color3.fromRGB(255, 85, 255)
                targetFrameC.TotalLevel.Text = "Total Level: Hidden"
                targetFrameC.Haki.TextColor3 = Color3.fromRGB(255, 85, 255)
                targetFrameC.Haki.Text = "Haki: Hidden"
            targetFrameC.A.Beri.BeriAmount.Text = "Hidden"
            targetFrameC.A.Beri.BeriAmount.TextColor3 = Color3.fromRGB(255, 85, 255)
            targetFrameC.A.Bounty.BountyAmount.Text = "Hidden"
            targetFrameC.A.Bounty.BountyAmount.TextColor3 = Color3.fromRGB(255, 85, 255)
            targetFrameC.A.Fish.FishAmount.Text = "Hidden"
            targetFrameC.A.Fish.FishAmount.TextColor3 = Color3.fromRGB(255, 85, 255)
            targetFrameC.A.Gems.GemsAmount.Text = "Hidden"
            targetFrameC.A.Gems.GemsAmount.TextColor3 = Color3.fromRGB(255, 85, 255)
            targetFrameC.A.Kills.KillsAmount.Text = "Hidden"
            targetFrameC.A.Kills.KillsAmount.TextColor3 = Color3.fromRGB(255, 85, 255)
            targetFrameC.A.DevilFruit.Text = "Hidden"
            targetFrameC.A.DevilFruit.TextColor3 = Color3.fromRGB(255, 85, 255)
            targetFrameC.A.DevilFruit2.Text = "Hidden"
            targetFrameC.A.DevilFruit2.TextColor3 = Color3.fromRGB(255, 85, 255)
        end
    end)
end

task.spawn(function()
    while true do
        forcehide()
        task.wait() 
    end
end)
		end,
	})

MiscThingTab:Space()
MiscThingTab:Slider({
    Title = "FPS Cap",
	Flag = "Saluna_SliderFPS",
    Step = 1,
    Value = {
        Min = 5, 
        Max = 240, 
        Default = 60
    },
    Callback = function(v)
        getgenv().fps = v
    end,
})

MiscThingTab:Button({
		Title = "Set FPS Cap",
		Callback = function()
if getgenv().fps ~= nil then
setfpscap(getgenv().fps)
end
		end,
	})

MiscThingTab:Toggle({
    Title = "Turn Off 3D-Render",
	Flag = "Saluna_TurnOff3DRender",
    Callback = function(state)
pcall(function()
game:GetService("RunService"):Set3dRenderingEnabled(not state)
end)
    end,
})

local IYSection = MiscSection:Tab({
		Title = "Tools For Saluna",
		Icon = "solar:cursor-square-bold",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})

	IYSection:Button({
		Title = "Infinite Yield",
		Desc = "Open Infinite Yield",
		Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
			WindUI:Notify({
				Title = "Saluna Notify",
				Content = "Infinite Yield Turned On",
				Icon = "solar:bell-bold",
				Duration = 3,
				CanClose = false,
			})
end,
})
IYSection:Space()

IYSection:Toggle({
		Title = "Velocity",
		Desc = "Disable movement by apply massive force.",
		Callback = function(state)
getgenv().VelocityBody = state
		end,
	})

IYSection:Space()
	IYSection:Button({
		Title = "Set Clipboard Current Location CFrame",
		Callback = function()
toClipboard(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			WindUI:Notify({
				Title = "Saluna Notify",
				Content = "Copied To Clipboard",
				Icon = "solar:bell-bold",
				Duration = 3,
				CanClose = false,
			})
end,
})

IYSection:Space()
	IYSection:Button({
		Title = "Set Clipboard Current Place ID",
		Callback = function()
toClipboard(game.PlaceId)
			WindUI:Notify({
				Title = "Saluna Notify",
				Content = "Copied To Clipboard",
				Icon = "solar:bell-bold",
				Duration = 3,
				CanClose = false,
			})
end,
})

local ServerTab = MiscSection:Tab({
		Title = "Server",
		Icon = "solar:hamburger-menu-bold",
		IconColor = Color3.fromHex("#23252E"),
		IconShape = "Square",
		Border = true,
	})
ServerTab:Section({
		Title = "Place Info:",
Desc = "Place ID: "..game.PlaceId .."\nJob ID: "..game.JobId
	})
ServerTab:Space()
	ServerTab:Button({
		Title = "Copy Server's Job ID",
		Callback = function()
setclipboard(game.JobId)
			WindUI:Notify({
				Title = "Saluna Notify",
				Content = "Copied JobID To Clipboard",
				Icon = "solar:bell-bold",
				Duration = 3,
				CanClose = false,
			})
		end,
	})
ServerTab:Space()
	ServerTab:Input({
		Title = "Job ID ",
		Flag = "Saluna_InputJobID",
		Icon = "mouse",
		Desc = "Input Job ID To Join A Specific Server",
		Callback = function(v)
getgenv().jobid = v
end,
	})
	ServerTab:Button({
		Title = "Join Server With Job ID",
		Callback = function()
pcall(function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,getgenv().jobid , game:GetService("Players").LocalPlayer)
end)		
end,
	})
ServerTab:Space()

ServerTab:Space()
	ServerTab:Button({
		Title = "Join A Normal Server",
		Desc = "Use When In A Vip Server Or In The Other Games",
		Callback = function()
game:GetService("TeleportService"):Teleport(112233665771826, game:GetService("Players").LocalPlayer)
		end,
	})

ServerTab:Button({
    Title = "Rejoin Server",
	Desc = "Also works with private server that has server code.",
    Callback = function()
        local TS = game:GetService("TeleportService")
        local RS = game:GetService("ReplicatedStorage")
        local player = game:GetService("Players").LocalPlayer
        
        if not workspace.GlobalReference.Private.Value then
            TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
        else
            local currentSVVCode = workspace.GlobalReference.Private.Code.Value
            
            if currentSVVCode ~= nil and currentSVVCode ~= "" then
                -- Truyền thẳng giá trị, không cần unpack table
                RS:WaitForChild("CreateRandomVIP"):FireServer("Join", currentSVVCode)
            else
                WindUI:Notify({
                    Title = "Saluna Notify",
                    Content = "Cannot Find The Private Server Code",
                    Icon = "solar:bell-bold",
                    Duration = 2,
                    CanClose = false,
                })
            end
        end
    end,
})

	ServerTab:Button({
		Title = "Hop Server",
		Callback = function()
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
PlaceId, JobId = game.PlaceId, game.JobId
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
 if httprequest then
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
        end
    end          
		end,
	})

	ServerTab:Button({
		Title = "Low-Server Hop",
		Callback = function()
            local PlaceID = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
            local Deleted = false
            function TPReturner()
                local Site;
                if foundAnything == "" then
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                else
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                end
                local ID = ""
                if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                    foundAnything = Site.nextPageCursor
                end
                local num = 0;
                for i,v in pairs(Site.data) do
                    local Possible = true
                    ID = tostring(v.id)
                    if tonumber(v.maxPlayers) > tonumber(v.playing) then
                        for _,Existing in pairs(AllIDs) do
                            if num ~= 0 then
                                if ID == tostring(Existing) then
                                    Possible = false
                                end
                            else
                                if tonumber(actualHour) ~= tonumber(Existing) then
                                    local delFile = pcall(function()
                                        AllIDs = {}
                                        table.insert(AllIDs, actualHour)
                                    end)
                                end
                            end
                            num = num + 1
                        end
                        if Possible == true then
                            table.insert(AllIDs, ID)
                            task.wait()
                            pcall(function()
                                task.wait()
                                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game:GetService("Players").LocalPlayer)
                            end)
                            task.wait(.1)
                        end
                    end
                end
            end
            function Teleport() 
                while task.wait(0.1) do
                    pcall(function()
                        TPReturner()
                        if foundAnything ~= "" then
                            TPReturner()
                        end
                    end)
                end
            end
            Teleport()         
		end,
	})

	ServerTab:Button({
		Title = "High-Server Hop",
		Callback = function()
local PlaceID = game.PlaceId
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local function getServerList(cursor)
local url = 'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100'
if cursor and cursor ~= "" then
url = url .. '&cursor=' .. cursor
end
local response = HttpService:JSONDecode(game:HttpGet(url))
return response
end
local function findHighestPlayerServer()
local highestServer = nil
local foundAnything = ""
repeat
local Site = getServerList(foundAnything)
if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
foundAnything = Site.nextPageCursor
else
foundAnything = nil
end
for _, server in pairs(Site.data) do
if not highestServer or server.playing > highestServer.playing then
highestServer = server
end
end
until not foundAnything
return highestServer
end

local function hopToHighestPlayerServer()
local highestServer = findHighestPlayerServer()
if highestServer then
local serverId = highestServer.id
TeleportService:TeleportToPlaceInstance(PlaceID, serverId, game:GetService("Players").LocalPlayer)
else
end
end
hopToHighestPlayerServer()  
		end,
	})

-- =========================================================================
-- TAB SETTINGS: CẤU HÌNH HỆ THỐNG (SAVE / LOAD / AUTO LOAD)
-- =========================================================================
getgenv().IsSalunaLoading = true 

local SettingsTab = Window:Tab({
	Title = "Settings",
	Desc = "Save and Load your configurations.",
	Icon = "solar:settings-bold",
	IconColor = Color3.fromHex("#23252E"),
	IconShape = "Square",
	Border = true,
})

local ConfigManager = Window.ConfigManager
local currentConfigName = "" -- 🔥 Đã xóa "SalunaDefault" để mặc định rỗng
local autoLoadTarget = nil

local ConfigManagerSection = SettingsTab:Section({
	Title = "Config Manager",
})

ConfigManagerSection:Space()

-- 1. Ô Nhập Tên Config
local ConfigNameInput = ConfigManagerSection:Input({
	Title = "Config Name",
	Desc = "Enter the name of the config to Save or Load.",
	Icon = "file-text",
	Value = currentConfigName,
	Callback = function(value)
		currentConfigName = value
	end,
})

ConfigManagerSection:Space()

-- Khai báo trước các biến định danh
local ConfigDropdown
local AutoLoadDropdown
local AutoLoadToggle

-- 2. Dropdown Chọn Config Đã Có
local AllConfigs = ConfigManager:AllConfigs()
ConfigDropdown = ConfigManagerSection:Dropdown({
	Title = "Saved Configs",
	Desc = "Select an existing config from your folder.",
	Values = AllConfigs,
	Value = nil, -- 🔥 Mặc định nil
	Callback = function(value)
		local name = type(value) == "table" and value[1] or value
		if name then
			currentConfigName = name
			ConfigNameInput:Set(name) 
		end
	end,
})

ConfigManagerSection:Space()

-- 3. Nút Lưu Config
ConfigManagerSection:Button({
	Title = "Save Config",
	Desc = "Overwrites or creates a new config file.",
	Icon = "save",
	Callback = function()
		if currentConfigName == "" or currentConfigName == nil then
			WindUI:Notify({
				Title = "Config Error",
				Content = "Please enter a valid config name!",
				Icon = "solar:danger-triangle-bold",
				Duration = 3,
			})
			return
		end
		
		local cfg = ConfigManager:GetConfig(currentConfigName)
		if not cfg then
			cfg = ConfigManager:Config(currentConfigName)
		end
		Window.CurrentConfig = cfg
		
		if Window.CurrentConfig:Save() then
			WindUI:Notify({
				Title = "Saluna Settings",
				Content = "Successfully saved config: " .. currentConfigName,
				Icon = "solar:check-square-bold",
				Duration = 3,
			})
		end
		
		ConfigDropdown:Refresh(ConfigManager:AllConfigs())
		if AutoLoadDropdown then
			AutoLoadDropdown:Refresh(ConfigManager:AllConfigs())
		end
	end,
})

ConfigManagerSection:Space()

-- 4. Nút Nạp Config
ConfigManagerSection:Button({
	Title = "Load Config",
	Desc = "Loads the selected config file.",
	Icon = "download",
	Callback = function()
		if currentConfigName == "" or currentConfigName == nil then return end
		
		Window.CurrentConfig = ConfigManager:CreateConfig(currentConfigName)
		if Window.CurrentConfig:Load() then
			WindUI:Notify({
				Title = "Saluna Settings",
				Content = "Successfully loaded config: " .. currentConfigName,
				Icon = "solar:check-square-bold",
				Duration = 3,
			})
		end
	end,
})

ConfigManagerSection:Space()

-- 5. Nút Xóa Config
ConfigManagerSection:Button({
	Title = "Delete Config",
	Desc = "Permanently deletes the selected config.",
	Icon = "trash",
	Callback = function()
		if currentConfigName == "" or currentConfigName == nil then return end
		
		local success, msg = ConfigManager:DeleteConfig(currentConfigName)
		if success then
			WindUI:Notify({
				Title = "Saluna Settings",
				Content = "Deleted config: " .. currentConfigName,
				Icon = "solar:trash-bin-trash-bold",
				Duration = 3,
			})
			ConfigNameInput:Set("") -- 🔥 Trả về rỗng khi xóa xong
			currentConfigName = ""
			
			ConfigDropdown:Refresh(ConfigManager:AllConfigs())
			if AutoLoadDropdown then
				AutoLoadDropdown:Refresh(ConfigManager:AllConfigs())
			end
		else
			WindUI:Notify({
				Title = "Config Error",
				Content = "Failed to delete: " .. msg,
				Icon = "solar:danger-triangle-bold",
				Duration = 3,
			})
		end
	end
})

ConfigManagerSection:Space()

-- =========================================================================
-- HỆ THỐNG AUTO LOAD CHUYÊN NGHIỆP
-- =========================================================================
local AutoLoadSection = SettingsTab:Section({
	Title = "Auto Load System",
})
AutoLoadSection:Space()

AutoLoadDropdown = AutoLoadSection:Dropdown({
	Title = "Select Config for Auto Load",
	Desc = "Choose which config you want to automatically load.",
	Values = ConfigManager:AllConfigs(),
	Value = nil, -- 🔥 Mặc định nil
	Callback = function(value)
		local name = type(value) == "table" and value[1] or value
		autoLoadTarget = name
	end,
})

AutoLoadSection:Space()

AutoLoadToggle = AutoLoadSection:Toggle({
    Title = "Enable Auto Load",
    Desc = "Automatically loads the selected config when Saluna Hub starts.",
    Flag = "Saluna_AutoLoadToggle", 
    Callback = function(state)
        if getgenv().IsSalunaLoading then return end
        if autoLoadTarget and autoLoadTarget ~= "" then
            local targetConfig = ConfigManager:GetConfig(autoLoadTarget)
            if not targetConfig then
                targetConfig = ConfigManager:Config(autoLoadTarget)
            end
            if targetConfig then
                targetConfig:SetAutoLoad(state)
                targetConfig:Save() 
                if state then
                    WindUI:Notify({
                        Title = "Auto Load Enabled",
                        Content = autoLoadTarget .. " will automatically load next time.",
                        Icon = "solar:bell-bold",
                        Duration = 3,
                    })
                else
                    WindUI:Notify({
                        Title = "Auto Load Disabled",
                        Content = "Auto load has been turned off.",
                        Icon = "solar:bell-bold",
                        Duration = 3,
                    })
                end
            end
        else
            if state then
                WindUI:Notify({
                    Title = "Saluna Error",
                    Content = "Please select a config from the dropdown first!",
                    Icon = "solar:danger-triangle-bold",
                    Duration = 3,
                })
            end
        end
    end,
})

-- =========================================================================
-- 🔥 BỘ ĐỀ MÁY AUTO-LOAD
-- =========================================================================
task.spawn(function()
	task.wait(0.3)
	
	pcall(function()
		local HttpService = game:GetService("HttpService")
		local allConfigs = ConfigManager:AllConfigs()
		
		for _, cfgName in ipairs(allConfigs) do
			local path = "WindUI/" .. Window.Folder .. "/config/" .. cfgName .. ".json"
			
			if isfile(path) then
				local fileData = readfile(path)
				local decoded = HttpService:JSONDecode(fileData)
				
				if decoded and decoded.__autoload == true then
					-- Lưu biến ngầm để dùng, tuyệt đối không gọi UI Select() nữa
					autoLoadTarget = cfgName
					AutoLoadToggle:Set(true, false)
					
					local activeCfg = ConfigManager:CreateConfig(cfgName)
					activeCfg:Load()
					
					WindUI:Notify({
						Title = "Saluna System",
						Content = "Auto-loaded config: " .. cfgName,
						Icon = "solar:check-square-bold",
						Duration = 3,
					})
					break
				end
			end
		end
	end)
	
	task.wait(1.5) 
	getgenv().IsSalunaLoading = false 
end)

task.delay(5, function()
triggernotify = true
end)

task.spawn(function()
    local descendants = workspace:GetDescendants()
    for i, v in ipairs(descendants) do
        if v.Name == "Seat" and v:IsA("BasePart") then
            v.CanTouch = false
        end
        if i % 1000 == 0 then
            task.wait()
        end
    end
end)

local player = game:GetService("Players").LocalPlayer

local idleBlacklist = {
    ["180435571"] = true,
    ["180435792"] = true
}

local function blockSpecificIdle(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    
    local animator = hum:WaitForChild("Animator", 5)
    if not animator then return end
    local function checkAndStop(track)
        if not track.Animation then return end
		local animId = track.Animation.AnimationId
        local idNumber = string.match(animId, "%d+")
        
        if idNumber and idleBlacklist[idNumber] then
            track:Stop()
            track:AdjustWeight(0)
        end
    end

    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        checkAndStop(track)
    end

    animator.AnimationPlayed:Connect(function(track)
        checkAndStop(track)
    end)
end

player.CharacterAdded:Connect(blockSpecificIdle)

if player.Character then 
    blockSpecificIdle(player.Character) 
end

local player = game:GetService("Players").LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local function forceApplySaluna()
    pcall(function()
        local menu = pgui:FindFirstChild("MenuNew")
        if menu then
            local targetFrame = menu.Frame.C.Frame
            if targetFrame.Nametag.Text ~= "Saluna" then
                targetFrame.Nametag.TextColor3 = Color3.fromRGB(0, 255, 127)
                targetFrame.Nametag.Text = "Saluna"
                targetFrame.Header.Text = "PROTECTED BY"
				targetFrame.Header.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
    end)
end

task.spawn(function()
    while true do
        forceApplySaluna()
        task.wait(0.5) 
    end
end)

if getgenv().SalunaAutoVelocityThread then
    task.cancel(getgenv().SalunaAutoVelocityThread)
    getgenv().SalunaAutoVelocityThread = nil
end

getgenv().SalunaAutoVelocityThread = task.spawn(function()
    local plr = game:GetService("Players").LocalPlayer
    while task.wait(.1) do
        pcall(function()
            local char = plr.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            if not hrp or not hum then return end
            local isFarming = getgenv().AutoFindCompassV2 or getgenv().VelocityBody or getgenv().compassboolean or getgenv().apac or getgenv().fishingv1 or getgenv().fishingv2 or getgenv().tween or getgenv().autoSquareTP
            if isFarming then
                if not hrp:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = hrp
                    Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                    Noclip.Velocity = Vector3.new(0, 0, 0)
                end
                hum.JumpPower = 0

            else
                local clip = hrp:FindFirstChild("BodyClip")
                if clip then
                    clip:Destroy()
                    task.wait(0.1)
                    hum.JumpPower = 50
                end
            end
        end)
    end
end)

-- ==============================================================
-- WorkPlaceForIrenEnd
-- ==============================================================
-- ⏳ Nhét task.wait(7) vào bên trong chuỗi để nó có tác dụng ở SERVER MỚI
local scriptToRun = [[
    task.wait(7) 
    loadstring(game:HttpGet("https://vss.pandadevelopment.net/virtual/file/1ef9c57995ad41b9"))()
]]
if queue_on_teleport then
    queue_on_teleport(scriptToRun)
end
else
    print("Saluna Hub: User canceled authentication.")
end
