-- ts file was generated at discord.gg/25ms

if not game:IsLoaded() then
    local _Message = Instance.new('Message', workspace)

    _Message.Text = 'Waiting game to loaded before scripts is getting executed by Winnable Hub'

    game.Loaded:Wait()
    _Message:Destroy()
    wait(10)
end

_G.DefaultSettings = {
    Auto_Farm_Level = false,
    Auto_Farm = false,
    Auto_Arrow = false,
    Auto_Chest = false,
    Change_Word = false,
    Auto_Pos_Chest = false,
    KillAura = false,
    Auto_Mons = false,
    AutoListedMob = false,
    ID = nil,
    CD = 0.5,
    Equipment = 'Hamon',
    Attack_Method = 'Remote',
    Used = 'Both',
    Quest = 'Thug',
    faraway = -10,
    mobselect = 'Thug [Level 5]',
    Auto_Kira = false,
    Auto_Diavolo = false,
}

while true do
    wait(3)

    if isfolder('WinnableHub') then
        if not isfile('WinnableHub/Config.JSON') then
            writefile('WinnableHub/Config.JSON', game:service('HttpService'):JSONEncode(_G.DefaultSettings))
        end
    else
        makefolder('WinnableHub')
    end
    if isfile('WinnableHub/Config.JSON') then
        if isfile('WinnableHub/Config.JSON') then
            _G.Settings = game:service('HttpService'):JSONDecode(readfile('WinnableHub/Config.JSON'))

            local _ScreenGui = Instance.new('ScreenGui')
            local _TextButton = Instance.new('TextButton')

            _ScreenGui.Name = 'DINOHUB'
            _ScreenGui.Parent = game.CoreGui
            _ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            local _ImageLabel = Instance.new('ImageLabel')

            _ImageLabel.Name = 'OPENCLOSE1'
            _ImageLabel.Active = true
            _ImageLabel.BorderSizePixel = 0
            _ImageLabel.Parent = _ScreenGui
            _ImageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            _ImageLabel.BackgroundTransparency = 0.5
            _ImageLabel.Position = UDim2.new(0.08233337, 0, 0.0952890813, 0)
            _ImageLabel.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
            _ImageLabel.Image = 'http://www.roblox.com/asset/?id=11634040122'
            _TextButton.Name = 'OPENCLOSE'
            _TextButton.Parent = _ScreenGui
            _TextButton.BackgroundColor3 = Color3.fromRGB(0, 255, 155)
            _TextButton.BackgroundTransparency = 1
            _TextButton.BorderSizePixel = 0
            _TextButton.Position = UDim2.new(0.08233337, 0, 0.0952890813, 0)
            _TextButton.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
            _TextButton.Font = Enum.Font.DenkOne
            _TextButton.Text = 'dadada'
            _TextButton.Transparency = 1
            _TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextButton.TextScaled = true
            _TextButton.TextSize = 14
            _TextButton.TextWrapped = true

            _TextButton.MouseButton1Click:Connect(function()
                game.CoreGui:FindFirstChild('DinoUI').Enabled = not game.CoreGui:FindFirstChild('DinoUI').Enabled
            end)

            if game:GetService('CoreGui'):FindFirstChild('DinoUI') then
                game:GetService('CoreGui').DinoUI:Destroy()
            end

            local _TweenService = game:GetService('TweenService')
            local _UserInputService = game:GetService('UserInputService')
            local v130 = {
                CreateWindow = function(_, p7)
                    local _ScreenGui2 = Instance.new('ScreenGui')
                    local _Frame = Instance.new('Frame')
                    local _TextLabel = Instance.new('TextLabel')
                    local _TextLabel2 = Instance.new('TextLabel')
                    local _TextLabel3 = Instance.new('TextLabel')
                    local _ScrollingFrame = Instance.new('ScrollingFrame')
                    local _UIListLayout = Instance.new('UIListLayout')
                    local _Frame2 = Instance.new('Frame')

                    _ScreenGui2.Name = 'DinoUI'
                    _ScreenGui2.Parent = game.CoreGui
                    _ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    _Frame.Name = 'Window'
                    _Frame.Parent = _ScreenGui2
                    _Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    _Frame.BorderSizePixel = 0
                    _Frame.Position = UDim2.new(0, 392, 0, 264)
                    _Frame.Size = UDim2.new(0, 390, 0, 350)
                    _TextLabel.Name = 'DinoHubText1'
                    _TextLabel.Parent = _Frame
                    _TextLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 155)
                    _TextLabel.BackgroundTransparency = 1
                    _TextLabel.BorderSizePixel = 0
                    _TextLabel.Position = UDim2.new(0, 30, 0, 0)
                    _TextLabel.Size = UDim2.new(0, 35, 0, 20)
                    _TextLabel.Font = Enum.Font.GothamSemibold
                    _TextLabel.Text = 'Winnable Hub |'
                    _TextLabel.TextColor3 = Color3.fromRGB(255, 135, 0)
                    _TextLabel.TextSize = 13
                    _TextLabel2.Name = 'DinoHubText2'
                    _TextLabel2.Parent = _Frame
                    _TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel2.BackgroundTransparency = 1
                    _TextLabel2.BorderSizePixel = 0
                    _TextLabel2.Position = UDim2.new(0, 40, 0, 0)
                    _TextLabel2.Size = UDim2.new(0, 35, 0, 20)
                    _TextLabel2.Font = Enum.Font.GothamSemibold
                    _TextLabel2.Text = ''
                    _TextLabel2.TextColor3 = Color3.fromRGB(55, 122, 204)
                    _TextLabel2.TextSize = 13
                    _TextLabel3.Name = 'WindowText'
                    _TextLabel3.Parent = _Frame
                    _TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel3.BackgroundTransparency = 1
                    _TextLabel3.BorderSizePixel = 0
                    _TextLabel3.Position = UDim2.new(0, 85, 0, 0)
                    _TextLabel3.Size = UDim2.new(0, 305, 0, 20)
                    _TextLabel3.Font = Enum.Font.GothamSemibold
                    _TextLabel3.Text = p7 or 'Game Title'
                    _TextLabel3.TextColor3 = Color3.fromRGB(150, 150, 150)
                    _TextLabel3.TextSize = 13
                    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
                    _ScrollingFrame.Name = 'TabWindow'
                    _ScrollingFrame.Parent = _Frame
                    _ScrollingFrame.Active = true
                    _ScrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    _ScrollingFrame.BorderSizePixel = 0
                    _ScrollingFrame.Position = UDim2.new(0, 7, 0, 20)
                    _ScrollingFrame.Size = UDim2.new(0, 375, 0, 20)
                    _ScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
                    _ScrollingFrame.ScrollBarThickness = 2
                    _UIListLayout.Name = 'TabWindowList'
                    _UIListLayout.Parent = _ScrollingFrame
                    _UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                    _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    _Frame2.Name = 'ContainerHolder'
                    _Frame2.Parent = _Frame
                    _Frame2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    _Frame2.BorderSizePixel = 0
                    _Frame2.Position = UDim2.new(0, 0, 0, 40)
                    _Frame2.Size = UDim2.new(0, 390, 0, 310)
                    _ScrollingFrame.CanvasSize = UDim2.new(0, 0 + _UIListLayout.AbsoluteContentSize.X, 0, 0)

                    _UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                        _ScrollingFrame.CanvasSize = UDim2.new(0, 0 + _UIListLayout.AbsoluteContentSize.X, 0, 0)
                    end)

                    local u16 = _Frame
                    local u17 = nil
                    local u18 = nil
                    local u19 = nil
                    local u20 = nil

                    local function u23(p21)
                        local v22 = p21.Position - u19

                        u16.Position = UDim2.new(u20.X.Scale, u20.X.Offset + v22.X, u20.Y.Scale, u20.Y.Offset + v22.Y)
                    end

                    u16.InputBegan:Connect(function(p24)
                        if p24.UserInputType == Enum.UserInputType.MouseButton1 or p24.UserInputType == Enum.UserInputType.Touch then
                            u17 = true
                            u19 = p24.Position
                            u20 = u16.Position

                            p24.Changed:Connect(function()
                                if p24.UserInputState == Enum.UserInputState.End then
                                    u17 = false
                                end
                            end)
                        end
                    end)
                    u16.InputChanged:Connect(function(p25)
                        if p25.UserInputType == Enum.UserInputType.MouseMovement or p25.UserInputType == Enum.UserInputType.Touch then
                            u18 = p25
                        end
                    end)
                    _UserInputService.InputChanged:Connect(function(p26)
                        if p26 == u18 and u17 then
                            u23(p26)
                        end
                    end)

                    return {
                        NewPage = function(_, p27)
                            local _ScrollingFrame2 = Instance.new('ScrollingFrame')
                            local _UIListLayout2 = Instance.new('UIListLayout')

                            _ScrollingFrame2.Name = p27 or 'Container'
                            _ScrollingFrame2.Parent = _Frame2
                            _ScrollingFrame2.Active = true
                            _ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                            _ScrollingFrame2.BorderSizePixel = 0
                            _ScrollingFrame2.Position = UDim2.new(0, 5, 0, 5)
                            _ScrollingFrame2.Size = UDim2.new(0, 380, 0, 300)
                            _ScrollingFrame2.Visible = false
                            _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 5 + _UIListLayout2.Padding.Offset + _UIListLayout2.AbsoluteContentSize.Y)
                            _ScrollingFrame2.ScrollBarThickness = 2
                            _UIListLayout2.Name = 'ContainerList'
                            _UIListLayout2.Parent = _ScrollingFrame2
                            _UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
                            _UIListLayout2.Padding = UDim.new(0, 5)

                            _UIListLayout2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0 + _UIListLayout2.Padding.Offset + _UIListLayout2.AbsoluteContentSize.Y)
                            end)
                            _ScrollingFrame2.ChildAdded:Connect(function()
                                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0 + _UIListLayout2.Padding.Offset + _UIListLayout2.AbsoluteContentSize.Y)
                            end)

                            local _TextButton2 = Instance.new('TextButton')

                            _TextButton2.Name = 'TabButton'
                            _TextButton2.Parent = _ScrollingFrame
                            _TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            _TextButton2.BackgroundTransparency = 1
                            _TextButton2.BorderSizePixel = 0
                            _TextButton2.Position = UDim2.new(0, 5, 0, 0)
                            _TextButton2.Size = UDim2.new(0, 100, 0, 20)
                            _TextButton2.Font = Enum.Font.GothamSemibold
                            _TextButton2.Text = p27 or 'Tab'
                            _TextButton2.TextColor3 = Color3.fromRGB(180, 180, 180)
                            _TextButton2.TextSize = 13
                            _TextButton2.Size = UDim2.new(0, 10 + _TextButton2.TextBounds.X, 0, 20)

                            _TextButton2.MouseButton1Click:Connect(function()
                                local v31 = _Frame2
                                local v32, v33, v34 = pairs(v31:GetChildren())

                                while true do
                                    local v35

                                    v34, v35 = v32(v33, v34)

                                    if v34 == nil then
                                        break
                                    end
                                    if v35:IsA('ScrollingFrame') then
                                        v35.Visible = false
                                    end
                                end

                                local v36 = _ScrollingFrame
                                local v37, v38, v39 = pairs(v36:GetChildren())

                                while true do
                                    local v40

                                    v39, v40 = v37(v38, v39)

                                    if v39 == nil then
                                        break
                                    end
                                    if v40:IsA('TextButton') then
                                        _TweenService:Create(v40, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                            TextColor3 = Color3.fromRGB(180, 180, 180),
                                        }):Play()
                                    end
                                end

                                _TweenService:Create(_TextButton2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                    TextColor3 = Color3.fromRGB(125, 125, 125),
                                }):Play()

                                _ScrollingFrame2.Visible = true
                            end)

                            return {
                                NewSection = function(_, p41)
                                    local _Frame3 = Instance.new('Frame')
                                    local _TextLabel4 = Instance.new('TextLabel')
                                    local _Frame4 = Instance.new('Frame')
                                    local _UICorner = Instance.new('UICorner')
                                    local _UIListLayout3 = Instance.new('UIListLayout')

                                    _Frame3.Name = p41 or 'Section'
                                    _Frame3.Parent = _ScrollingFrame2
                                    _Frame3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                    _Frame3.Position = UDim2.new(0.0263157897, 0, 0, 0)
                                    _Frame3.Size = UDim2.new(0, 360, 0, 20)
                                    _TextLabel4.Name = 'SectionTitle'
                                    _TextLabel4.Parent = _Frame3
                                    _TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    _TextLabel4.BackgroundTransparency = 1
                                    _TextLabel4.BorderSizePixel = 0
                                    _TextLabel4.Size = UDim2.new(0, 360, 0, 15)
                                    _TextLabel4.Font = Enum.Font.GothamSemibold
                                    _TextLabel4.Text = p41 or 'Section'
                                    _TextLabel4.TextColor3 = Color3.fromRGB(180, 180, 180)
                                    _TextLabel4.TextSize = 13
                                    _Frame4.Name = 'SectionIn'
                                    _Frame4.Parent = _Frame3
                                    _Frame4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                    _Frame4.BorderSizePixel = 0
                                    _Frame4.Position = UDim2.new(0, 0, 0, 20)
                                    _Frame4.Size = UDim2.new(0, 360, 0, 70)
                                    _UICorner.CornerRadius = UDim.new(0, 2)
                                    _UICorner.Name = 'SectionInUICorner'
                                    _UICorner.Parent = _Frame4
                                    _UIListLayout3.Name = 'SectionInList'
                                    _UIListLayout3.Parent = _Frame4
                                    _UIListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    _UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
                                    _UIListLayout3.Padding = UDim.new(0, 10)
                                    _Frame4.Size = UDim2.new(0, 360, 0, 5 + _UIListLayout3.AbsoluteContentSize.Y + _UIListLayout3.Padding.Offset)

                                    _UIListLayout3:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                                        _Frame4.Size = UDim2.new(0, 360, 0, 5 + _UIListLayout3.AbsoluteContentSize.Y + _UIListLayout3.Padding.Offset)
                                    end)

                                    local function u48()
                                        local _Y = _UIListLayout3.AbsoluteContentSize.Y

                                        _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _Y + 35 + _UIListLayout3.Padding.Offset)
                                    end
                                    local function u49()
                                        _Frame3.Size = UDim2.new(0, 360, 0, 20 + _UIListLayout3.AbsoluteContentSize.Y + _UIListLayout3.Padding.Offset)
                                    end

                                    u48()
                                    u49()
                                    _UIListLayout3:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                                        u48()
                                        u49()
                                    end)

                                    return {
                                        CreateButton = function(_, p50, p51)
                                            local _TextButton3 = Instance.new('TextButton')
                                            local _UICorner2 = Instance.new('UICorner')
                                            local _UIStroke = Instance.new('UIStroke')
                                            local _ImageLabel2 = Instance.new('ImageLabel')

                                            _TextButton3.Name = p50 or 'ButtonHolder'
                                            _TextButton3.Parent = _Frame4
                                            _TextButton3.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
                                            _TextButton3.BorderSizePixel = 0
                                            _TextButton3.Position = UDim2.new(0, 5, 0, 0)
                                            _TextButton3.Size = UDim2.new(0, 350, 0, 25)
                                            _TextButton3.AutoButtonColor = false
                                            _TextButton3.Font = Enum.Font.GothamSemibold
                                            _TextButton3.Text = p50 or 'Button | Click Me'
                                            _TextButton3.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            _TextButton3.TextSize = 13
                                            _UICorner2.CornerRadius = UDim.new(0, 4)
                                            _UICorner2.Name = 'ButtonHolderUICorner'
                                            _UICorner2.Parent = _TextButton3
                                            _UIStroke.Name = 'ButtonHolderUIStroke'
                                            _UIStroke.Parent = _TextButton3
                                            _UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                            _UIStroke.Color = Color3.fromRGB(35, 78, 130)
                                            _UIStroke.LineJoinMode = Enum.LineJoinMode.Round
                                            _UIStroke.Thickness = 1.6
                                            _UIStroke.Transparency = 0
                                            _UIStroke.Enabled = true
                                            _UIStroke.Archivable = true
                                            _ImageLabel2.Name = 'ButtonImage'
                                            _ImageLabel2.Parent = _TextButton3
                                            _ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _ImageLabel2.BackgroundTransparency = 1
                                            _ImageLabel2.BorderSizePixel = 0
                                            _ImageLabel2.Position = UDim2.new(0, 5, 0, 3)
                                            _ImageLabel2.Size = UDim2.new(0, 18, 0, 18)
                                            _ImageLabel2.Image = 'rbxassetid://7839505809'
                                            _ImageLabel2.ImageColor3 = Color3.fromRGB(180, 180, 180)

                                            _TextButton3.MouseEnter:Connect(function()
                                                _TweenService:Create(_TextButton3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    TextColor3 = Color3.fromRGB(125, 125, 125),
                                                }):Play()
                                                _TweenService:Create(_ImageLabel2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    ImageColor3 = Color3.fromRGB(125, 125, 125),
                                                }):Play()
                                            end)
                                            _TextButton3.MouseLeave:Connect(function()
                                                _TweenService:Create(_TextButton3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    TextColor3 = Color3.fromRGB(180, 180, 180),
                                                }):Play()
                                                _TweenService:Create(_ImageLabel2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    ImageColor3 = Color3.fromRGB(180, 180, 180),
                                                }):Play()
                                                _TweenService:Create(_TextButton3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    Size = UDim2.new(0, 350, 0, 25),
                                                }):Play()
                                            end)
                                            _TextButton3.MouseButton1Down:Connect(function()
                                                _TweenService:Create(_TextButton3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    Size = UDim2.new(0, 345, 0, 23),
                                                }):Play()
                                            end)
                                            _TextButton3.MouseButton1Up:Connect(function()
                                                _TweenService:Create(_TextButton3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    Size = UDim2.new(0, 350, 0, 25),
                                                }):Play()
                                            end)
                                            _TextButton3.MouseButton1Click:Connect(function()
                                                pcall(function()
                                                    p51()
                                                end)
                                            end)
                                        end,
                                        CreateToggle = function(_, p56, p57, p58)
                                            local _Frame5 = Instance.new('Frame')
                                            local _UICorner3 = Instance.new('UICorner')
                                            local _ImageLabel3 = Instance.new('ImageLabel')
                                            local _TextLabel5 = Instance.new('TextLabel')
                                            local _ImageLabel4 = Instance.new('ImageLabel')
                                            local _UICorner4 = Instance.new('UICorner')
                                            local _ImageLabel5 = Instance.new('ImageLabel')
                                            local _UICorner5 = Instance.new('UICorner')
                                            local _TextButton4 = Instance.new('TextButton')
                                            local _UIStroke2 = Instance.new('UIStroke')

                                            _Frame5.Name = p56 or 'ToggleHolder'
                                            _Frame5.Parent = _Frame4
                                            _Frame5.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                            _Frame5.BorderSizePixel = 0
                                            _Frame5.Size = UDim2.new(0, 350, 0, 25)
                                            _UICorner3.CornerRadius = UDim.new(0, 1)
                                            _UICorner3.Name = 'ToggleHolderUICorner'
                                            _UICorner3.Parent = _Frame5
                                            _ImageLabel3.Name = 'ToggleImage'
                                            _ImageLabel3.Parent = _Frame5
                                            _ImageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _ImageLabel3.BackgroundTransparency = 1
                                            _ImageLabel3.BorderSizePixel = 0
                                            _ImageLabel3.Position = UDim2.new(0, 5, 0, 3)
                                            _ImageLabel3.Size = UDim2.new(0, 18, 0, 18)
                                            _ImageLabel3.Image = 'rbxassetid://7832083744'
                                            _ImageLabel3.ImageColor3 = Color3.fromRGB(200, 200, 200)
                                            _TextLabel5.Name = 'ToggleTitle'
                                            _TextLabel5.Parent = _Frame5
                                            _TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextLabel5.BackgroundTransparency = 1
                                            _TextLabel5.BorderSizePixel = 0
                                            _TextLabel5.Position = UDim2.new(0, 25, 0, 0)
                                            _TextLabel5.Size = UDim2.new(0, 250, 0, 25)
                                            _TextLabel5.Font = Enum.Font.GothamSemibold
                                            _TextLabel5.Text = p56 or 'Toggle | Toggle Me !'
                                            _TextLabel5.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            _TextLabel5.TextSize = 13
                                            _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
                                            _ImageLabel4.Name = 'ToggleOut'
                                            _ImageLabel4.Parent = _Frame5
                                            _ImageLabel4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                            _ImageLabel4.Position = UDim2.new(0, 310, 0, 4)
                                            _ImageLabel4.Size = UDim2.new(0, 34, 0, 16)
                                            _ImageLabel4.Image = 'rbxasset://textures/ui/GuiImagePlaceholder.png'
                                            _ImageLabel4.ImageTransparency = 1
                                            _UICorner4.CornerRadius = UDim.new(0, 1000)
                                            _UICorner4.Name = 'ToggleOutUICorner'
                                            _UICorner4.Parent = _ImageLabel4
                                            _ImageLabel5.Name = 'ToggleIn'
                                            _ImageLabel5.Parent = _ImageLabel4
                                            _ImageLabel5.BackgroundColor3 = Color3.fromRGB(39, 86, 144)

                                            if p57 then
                                                if p57 then
                                                    toggled = true
                                                    _ImageLabel5.Position = UDim2.new(0, 20, 0, 2)

                                                    pcall(function()
                                                        p58(toggled)
                                                    end)
                                                end
                                            else
                                                toggled = false
                                                _ImageLabel5.Position = UDim2.new(0, 2, 0, 2)
                                            end

                                            _ImageLabel5.Size = UDim2.new(0, 12, 0, 12)
                                            _ImageLabel5.Image = 'rbxasset://textures/ui/GuiImagePlaceholder.png'
                                            _ImageLabel5.ImageTransparency = 1
                                            _UICorner5.CornerRadius = UDim.new(0, 1000)
                                            _UICorner5.Name = 'ToggleInUICorner'
                                            _UICorner5.Parent = _ImageLabel5
                                            _TextButton4.Name = 'ToggleHolderButton'
                                            _TextButton4.Parent = _Frame5
                                            _TextButton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextButton4.BackgroundTransparency = 1
                                            _TextButton4.BorderSizePixel = 0
                                            _TextButton4.Size = UDim2.new(0, 350, 0, 25)
                                            _TextButton4.ZIndex = 2
                                            _TextButton4.Font = Enum.Font.SourceSans
                                            _TextButton4.Text = ''
                                            _TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                                            _TextButton4.TextSize = 14
                                            _UIStroke2.Name = 'ToggleHolderUIStroke'
                                            _UIStroke2.Parent = _Frame5
                                            _UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                            _UIStroke2.Color = Color3.fromRGB(35, 78, 130)
                                            _UIStroke2.LineJoinMode = Enum.LineJoinMode.Round
                                            _UIStroke2.Thickness = 1.6
                                            _UIStroke2.Transparency = 0
                                            _UIStroke2.Enabled = true
                                            _UIStroke2.Archivable = true

                                            _TextButton4.MouseEnter:Connect(function()
                                                _TweenService:Create(_TextLabel5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    TextColor3 = Color3.fromRGB(125, 125, 125),
                                                }):Play()
                                                _TweenService:Create(_ImageLabel3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    ImageColor3 = Color3.fromRGB(125, 125, 125),
                                                }):Play()
                                            end)
                                            _TextButton4.MouseLeave:Connect(function()
                                                _TweenService:Create(_TextLabel5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    TextColor3 = Color3.fromRGB(180, 180, 180),
                                                }):Play()
                                                _TweenService:Create(_ImageLabel3, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    ImageColor3 = Color3.fromRGB(180, 180, 180),
                                                }):Play()
                                                _TweenService:Create(_Frame5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    Size = UDim2.new(0, 350, 0, 25),
                                                }):Play()
                                            end)
                                            _TextButton4.MouseButton1Down:Connect(function()
                                                _TweenService:Create(_Frame5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    Size = UDim2.new(0, 345, 0, 23),
                                                }):Play()
                                            end)
                                            _TextButton4.MouseButton1Up:Connect(function()
                                                _TweenService:Create(_Frame5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                    Size = UDim2.new(0, 350, 0, 25),
                                                }):Play()
                                            end)
                                            _TextButton4.MouseButton1Click:Connect(function()
                                                if toggled then
                                                    _TweenService:Create(_ImageLabel5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                        Position = UDim2.new(0, 2, 0, 2),
                                                    }):Play()

                                                    toggled = false

                                                    pcall(function()
                                                        p58(toggled)
                                                    end)
                                                else
                                                    _TweenService:Create(_ImageLabel5, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                                                        Position = UDim2.new(0, 20, 0, 2),
                                                    }):Play()

                                                    toggled = true

                                                    pcall(function()
                                                        p58(toggled)
                                                    end)
                                                end
                                            end)
                                        end,
                                        CreateSlider = function(_, p69, p70, p71, p72)
                                            local _Frame6 = Instance.new('Frame')
                                            local _UICorner6 = Instance.new('UICorner')
                                            local _ImageLabel6 = Instance.new('ImageLabel')
                                            local _TextLabel6 = Instance.new('TextLabel')
                                            local _ImageButton = Instance.new('ImageButton')
                                            local _UICorner7 = Instance.new('UICorner')
                                            local _ImageLabel7 = Instance.new('ImageLabel')
                                            local _UICorner8 = Instance.new('UICorner')
                                            local _TextLabel7 = Instance.new('TextLabel')
                                            local _UIStroke3 = Instance.new('UIStroke')

                                            _Frame6.Name = p69 or 'SliderHolder'
                                            _Frame6.Parent = _Frame4
                                            _Frame6.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                            _Frame6.BorderSizePixel = 0
                                            _Frame6.Position = UDim2.new(0, 5, 0, 60)
                                            _Frame6.Size = UDim2.new(0, 350, 0, 40)
                                            _UICorner6.CornerRadius = UDim.new(0, 1)
                                            _UICorner6.Name = 'SliderHolderUICorner'
                                            _UICorner6.Parent = _Frame6
                                            _ImageLabel6.Name = 'SliderImage'
                                            _ImageLabel6.Parent = _Frame6
                                            _ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _ImageLabel6.BackgroundTransparency = 1
                                            _ImageLabel6.BorderSizePixel = 0
                                            _ImageLabel6.Position = UDim2.new(0, 5, 0, 3)
                                            _ImageLabel6.Size = UDim2.new(0, 18, 0, 18)
                                            _ImageLabel6.Image = 'rbxassetid://7839722369'
                                            _ImageLabel6.ImageColor3 = Color3.fromRGB(200, 200, 200)
                                            _TextLabel6.Name = 'SliderHolderTitle'
                                            _TextLabel6.Parent = _Frame6
                                            _TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextLabel6.BackgroundTransparency = 1
                                            _TextLabel6.BorderSizePixel = 0
                                            _TextLabel6.Position = UDim2.new(0, 25, 0, 0)
                                            _TextLabel6.Size = UDim2.new(0, 250, 0, 25)
                                            _TextLabel6.Font = Enum.Font.GothamSemibold
                                            _TextLabel6.Text = p69 or 'Slider | Hold Me !'
                                            _TextLabel6.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            _TextLabel6.TextSize = 13
                                            _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                            _ImageButton.Name = 'SliderButton'
                                            _ImageButton.Parent = _Frame6
                                            _ImageButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                            _ImageButton.Position = UDim2.new(0, 10, 0, 25)
                                            _ImageButton.Size = UDim2.new(0, 300, 0, 7)
                                            _ImageButton.AutoButtonColor = false
                                            _ImageButton.Image = 'rbxasset://textures/ui/GuiImagePlaceholder.png'
                                            _ImageButton.ImageTransparency = 1
                                            _UICorner7.CornerRadius = UDim.new(0, 1000)
                                            _UICorner7.Name = 'SliderButtonUICorner'
                                            _UICorner7.Parent = _ImageButton
                                            _ImageLabel7.Name = 'SliderIn'
                                            _ImageLabel7.Parent = _ImageButton
                                            _ImageLabel7.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
                                            _ImageLabel7.Size = UDim2.new(0, 0, 0, 7)
                                            _ImageLabel7.Image = 'rbxasset://textures/ui/GuiImagePlaceholder.png'
                                            _ImageLabel7.ImageTransparency = 1
                                            _UICorner8.CornerRadius = UDim.new(0, 1000)
                                            _UICorner8.Name = 'SliderInUICorner'
                                            _UICorner8.Parent = _ImageLabel7
                                            _TextLabel7.Name = 'Val'
                                            _TextLabel7.Parent = _Frame6
                                            _TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextLabel7.BackgroundTransparency = 1
                                            _TextLabel7.BorderSizePixel = 0
                                            _TextLabel7.Position = UDim2.new(0, 282, 0, 0)
                                            _TextLabel7.Size = UDim2.new(0, 60, 0, 25)
                                            _TextLabel7.Font = Enum.Font.GothamSemibold
                                            _TextLabel7.Text = p70 or '0'
                                            _TextLabel7.TextColor3 = Color3.fromRGB(150, 150, 150)
                                            _TextLabel7.TextSize = 13
                                            _TextLabel7.TextXAlignment = Enum.TextXAlignment.Right
                                            _UIStroke3.Name = 'SliderHolderUIStroke'
                                            _UIStroke3.Parent = _Frame6
                                            _UIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                            _UIStroke3.Color = Color3.fromRGB(35, 78, 130)
                                            _UIStroke3.LineJoinMode = Enum.LineJoinMode.Round
                                            _UIStroke3.Thickness = 1.6
                                            _UIStroke3.Transparency = 0
                                            _UIStroke3.Enabled = true
                                            _UIStroke3.Archivable = true

                                            local u83 = p70 or 0
                                            local u84 = p71 or 100
                                            local u85 = p72 or function() end
                                            local u86 = game.Players.LocalPlayer:GetMouse()
                                            local _UserInputService2 = game:GetService('UserInputService')
                                            local u88 = nil

                                            _ImageButton.MouseButton1Down:Connect(function()
                                                u88 = math.floor((tonumber(u84) - tonumber(u83)) / 300 * _ImageLabel7.AbsoluteSize.X + tonumber(u83)) or 0

                                                pcall(function()
                                                    u85(u88)
                                                end)

                                                _ImageLabel7.Size = UDim2.new(0, math.clamp(u86.X - _ImageLabel7.AbsolutePosition.X, 0, 300), 0, 7)
                                                moveconnection = u86.Move:Connect(function()
                                                    _TextLabel7.Text = u88
                                                    u88 = math.floor((tonumber(u84) - tonumber(u83)) / 300 * _ImageLabel7.AbsoluteSize.X + tonumber(u83))

                                                    pcall(function()
                                                        u85(u88)
                                                    end)

                                                    _ImageLabel7.Size = UDim2.new(0, math.clamp(u86.X - _ImageLabel7.AbsolutePosition.X, 0, 300), 0, 7)
                                                end)
                                                releaseconnection = _UserInputService2.InputEnded:Connect(function(p89)
                                                    if p89.UserInputType == Enum.UserInputType.MouseButton1 then
                                                        u88 = math.floor((tonumber(u84) - tonumber(u83)) / 300 * _ImageLabel7.AbsoluteSize.X + tonumber(u83))

                                                        pcall(function()
                                                            u85(u88)
                                                        end)

                                                        _ImageLabel7.Size = UDim2.new(0, math.clamp(u86.X - _ImageLabel7.AbsolutePosition.X, 0, 300), 0, 7)

                                                        moveconnection:Disconnect()
                                                        releaseconnection:Disconnect()
                                                    end
                                                end)
                                            end)
                                        end,
                                        CreateTextBox = function(_, p90, p91, p92)
                                            local _Frame7 = Instance.new('Frame')
                                            local _UICorner9 = Instance.new('UICorner')
                                            local _ImageLabel8 = Instance.new('ImageLabel')
                                            local _TextLabel8 = Instance.new('TextLabel')
                                            local _TextBox = Instance.new('TextBox')
                                            local _UIStroke4 = Instance.new('UIStroke')

                                            _Frame7.Name = p90 or 'TextBoxToggle'
                                            _Frame7.Parent = _Frame4
                                            _Frame7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                            _Frame7.BorderSizePixel = 0
                                            _Frame7.Size = UDim2.new(0, 350, 0, 25)
                                            _UICorner9.CornerRadius = UDim.new(0, 1)
                                            _UICorner9.Name = 'TextBoxToggleUICorner'
                                            _UICorner9.Parent = _Frame7
                                            _ImageLabel8.Name = 'TextBoxImage'
                                            _ImageLabel8.Parent = _Frame7
                                            _ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _ImageLabel8.BackgroundTransparency = 1
                                            _ImageLabel8.BorderSizePixel = 0
                                            _ImageLabel8.Position = UDim2.new(0, 5, 0, 3)
                                            _ImageLabel8.Size = UDim2.new(0, 18, 0, 18)
                                            _ImageLabel8.Image = 'rbxassetid://7832050494'
                                            _ImageLabel8.ImageColor3 = Color3.fromRGB(200, 200, 200)
                                            _TextLabel8.Name = 'TextBoxTitle'
                                            _TextLabel8.Parent = _Frame7
                                            _TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextLabel8.BackgroundTransparency = 1
                                            _TextLabel8.BorderSizePixel = 0
                                            _TextLabel8.Position = UDim2.new(0, 25, 0, 0)
                                            _TextLabel8.Size = UDim2.new(0, 175, 0, 25)
                                            _TextLabel8.Font = Enum.Font.GothamSemibold
                                            _TextLabel8.Text = p90 or 'TextBox'
                                            _TextLabel8.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            _TextLabel8.TextSize = 13
                                            _TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
                                            _TextBox.Parent = _Frame7
                                            _TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                            _TextBox.BorderSizePixel = 0
                                            _TextBox.Position = UDim2.new(0, 210, 0, 4)
                                            _TextBox.Size = UDim2.new(0, 135, 0, 18)
                                            _TextBox.Font = Enum.Font.GothamSemibold
                                            _TextBox.PlaceholderText = p91 or 'Enter Text'
                                            _TextBox.Text = ''
                                            _TextBox.TextColor3 = Color3.fromRGB(200, 200, 200)
                                            _TextBox.TextSize = 12
                                            _UIStroke4.Name = 'TextBoxHolderUIStroke'
                                            _UIStroke4.Parent = _Frame7
                                            _UIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                            _UIStroke4.Color = Color3.fromRGB(35, 78, 130)
                                            _UIStroke4.LineJoinMode = Enum.LineJoinMode.Round
                                            _UIStroke4.Thickness = 1.6
                                            _UIStroke4.Transparency = 0
                                            _UIStroke4.Enabled = true
                                            _UIStroke4.Archivable = true

                                            _TextBox.FocusLost:Connect(function()
                                                pcall(function()
                                                    p92(_TextBox.Text)
                                                end)
                                            end)
                                        end,
                                        CreateDropdown = function(_, p99, p100, p101)
                                            local _Frame8 = Instance.new('Frame')
                                            local _UICorner10 = Instance.new('UICorner')
                                            local _ImageLabel9 = Instance.new('ImageLabel')
                                            local _TextLabel9 = Instance.new('TextLabel')
                                            local _TextButton5 = Instance.new('TextButton')
                                            local _Frame9 = Instance.new('Frame')
                                            local _UIListLayout4 = Instance.new('UIListLayout')
                                            local _TextLabel10 = Instance.new('TextLabel')
                                            local _UIStroke5 = Instance.new('UIStroke')

                                            _Frame8.Name = p99 or 'DropdownHolder'
                                            _Frame8.Parent = _Frame4
                                            _Frame8.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                            _Frame8.BorderSizePixel = 0
                                            _Frame8.ClipsDescendants = true
                                            _Frame8.Size = UDim2.new(0, 350, 0, 25)
                                            _UICorner10.CornerRadius = UDim.new(0, 1)
                                            _UICorner10.Name = 'DropdownHolderUICorner'
                                            _UICorner10.Parent = _Frame8
                                            _ImageLabel9.Name = 'DropdownImage'
                                            _ImageLabel9.Parent = _Frame8
                                            _ImageLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _ImageLabel9.BackgroundTransparency = 1
                                            _ImageLabel9.BorderSizePixel = 0
                                            _ImageLabel9.Position = UDim2.new(0, 5, 0, 3)
                                            _ImageLabel9.Size = UDim2.new(0, 18, 0, 18)
                                            _ImageLabel9.Image = 'rbxassetid://7831282709'
                                            _ImageLabel9.ImageColor3 = Color3.fromRGB(200, 200, 200)
                                            _TextLabel9.Name = 'DropdownHolderTitle'
                                            _TextLabel9.Parent = _Frame8
                                            _TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextLabel9.BackgroundTransparency = 1
                                            _TextLabel9.BorderSizePixel = 0
                                            _TextLabel9.Position = UDim2.new(0, 25, 0, 0)
                                            _TextLabel9.Size = UDim2.new(0, 175, 0, 25)
                                            _TextLabel9.Font = Enum.Font.GothamSemibold
                                            _TextLabel9.Text = p99 or 'Dropdown | Drop Me !'
                                            _TextLabel9.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            _TextLabel9.TextSize = 13
                                            _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
                                            _TextButton5.Name = 'DropdownButton'
                                            _TextButton5.Parent = _Frame8
                                            _TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextButton5.BackgroundTransparency = 1
                                            _TextButton5.BorderSizePixel = 0
                                            _TextButton5.Size = UDim2.new(0, 350, 0, 25)
                                            _TextButton5.ZIndex = 2
                                            _TextButton5.Font = Enum.Font.SourceSans
                                            _TextButton5.Text = ''
                                            _TextButton5.TextColor3 = Color3.fromRGB(0, 0, 0)
                                            _TextButton5.TextSize = 14
                                            _Frame9.Name = 'DropdownIn'
                                            _Frame9.Parent = _Frame8
                                            _Frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _Frame9.BackgroundTransparency = 1
                                            _Frame9.BorderSizePixel = 0
                                            _Frame9.Position = UDim2.new(0, 0, 0, 25)
                                            _Frame9.Size = UDim2.new(0, 350, 0, 1)
                                            _UIListLayout4.Name = 'DropdownInList'
                                            _UIListLayout4.Parent = _Frame9
                                            _UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                                            _TextLabel10.Name = 'DropdownSelectedTitle'
                                            _TextLabel10.Parent = _Frame8
                                            _TextLabel10.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
                                            _TextLabel10.BorderSizePixel = 0
                                            _TextLabel10.Position = UDim2.new(0, 345, 0, 2)
                                            _TextLabel10.Size = UDim2.new(0, -50, 0, 20)
                                            _TextLabel10.Font = Enum.Font.GothamSemibold
                                            _TextLabel10.Text = 'NONE'
                                            _TextLabel10.TextColor3 = Color3.fromRGB(200, 200, 200)
                                            _TextLabel10.TextSize = 12
                                            _UIStroke5.Name = 'DropdownHolderUIStroke'
                                            _UIStroke5.Parent = TextBoxToggle
                                            _UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                            _UIStroke5.Color = Color3.fromRGB(35, 78, 130)
                                            _UIStroke5.LineJoinMode = Enum.LineJoinMode.Round
                                            _UIStroke5.Thickness = 1.6
                                            _UIStroke5.Transparency = 0
                                            _UIStroke5.Enabled = true
                                            _UIStroke5.Archivable = true

                                            _TextButton5.MouseButton1Click:Connect(function()
                                                _Frame8:TweenSize(UDim2.new(0, 350, 0, 25 + _UIListLayout4.AbsoluteContentSize.Y), 'InOut', 'Quad', 0.08, true)
                                            end)

                                            _TextLabel10.Size = UDim2.new(0, 0 - _TextLabel10.TextBounds.X - 5, 0, 20)

                                            _TextLabel10:GetPropertyChangedSignal('Text'):Connect(function()
                                                _TextLabel10.Size = UDim2.new(0, 0 - _TextLabel10.TextBounds.X - 5, 0, 20)
                                            end)

                                            local v111 = next
                                            local v112 = p100 or {}
                                            local v113 = nil

                                            while true do
                                                local v114

                                                v113, v114 = v111(v112, v113)

                                                if v113 == nil then
                                                    break
                                                end

                                                local _TextButton6 = Instance.new('TextButton')

                                                _TextButton6.Name = v114 or 'ListButton'
                                                _TextButton6.Parent = _Frame9
                                                _TextButton6.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
                                                _TextButton6.BorderSizePixel = 0
                                                _TextButton6.Size = UDim2.new(0, 350, 0, 25)
                                                _TextButton6.AutoButtonColor = false
                                                _TextButton6.Font = Enum.Font.GothamSemibold
                                                _TextButton6.Text = v114 or 'List'
                                                _TextButton6.TextColor3 = Color3.fromRGB(180, 180, 180)
                                                _TextButton6.TextSize = 14

                                                _TextButton6.MouseButton1Click:Connect(function()
                                                    _Frame8:TweenSize(UDim2.new(0, 350, 0, 25), 'InOut', 'Quad', 0.08, true)

                                                    _TextLabel10.Text = _TextButton6.Text

                                                    pcall(function()
                                                        p101(_TextButton6.Text)
                                                    end)
                                                end)
                                            end

                                            return {
                                                RefreshDropdown = function(_, p116)
                                                    local v117 = _Frame9
                                                    local v118, v119, v120 = pairs(v117:GetChildren())
                                                    local v121 = p116 or {}

                                                    while true do
                                                        local v122

                                                        v120, v122 = v118(v119, v120)

                                                        if v120 == nil then
                                                            break
                                                        end
                                                        if v122:IsA('TextButton') then
                                                            v122:Destroy()
                                                        end
                                                    end

                                                    local v123 = next
                                                    local v124 = nil

                                                    while true do
                                                        local v125

                                                        v124, v125 = v123(v121, v124)

                                                        if v124 == nil then
                                                            break
                                                        end

                                                        local _TextButton7 = Instance.new('TextButton')

                                                        _TextButton7.Name = v125 or 'ListButton'
                                                        _TextButton7.Parent = _Frame9
                                                        _TextButton7.BackgroundColor3 = Color3.fromRGB(39, 86, 144)
                                                        _TextButton7.BorderSizePixel = 0
                                                        _TextButton7.Size = UDim2.new(0, 350, 0, 25)
                                                        _TextButton7.AutoButtonColor = false
                                                        _TextButton7.Font = Enum.Font.GothamSemibold
                                                        _TextButton7.Text = v125 or 'List'
                                                        _TextButton7.TextColor3 = Color3.fromRGB(180, 180, 180)
                                                        _TextButton7.TextSize = 14

                                                        _TextButton7.MouseButton1Click:Connect(function()
                                                            _Frame8:TweenSize(UDim2.new(0, 350, 0, 25), 'InOut', 'Quad', 0.08, true)

                                                            _TextLabel10.Text = _TextButton7.Text

                                                            pcall(function()
                                                                p101(_TextButton7.Text)
                                                            end)
                                                        end)
                                                    end
                                                end,
                                            }
                                        end,
                                        CreateLabel = function(_, p127)
                                            local _TextLabel11 = Instance.new('TextLabel')

                                            _TextLabel11.Name = p127 or 'DropdownHolderTitle'
                                            _TextLabel11.Parent = _Frame4
                                            _TextLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            _TextLabel11.BackgroundTransparency = 1
                                            _TextLabel11.BorderSizePixel = 0
                                            _TextLabel11.Position = UDim2.new(0, 5, 0, 190)
                                            _TextLabel11.Size = UDim2.new(0, 350, 0, 15)
                                            _TextLabel11.Font = Enum.Font.GothamSemibold
                                            _TextLabel11.Text = p127 or 'This Is A Description'
                                            _TextLabel11.TextColor3 = Color3.fromRGB(150, 150, 150)
                                            _TextLabel11.TextSize = 13
                                            _TextLabel11.TextXAlignment = Enum.TextXAlignment.Left

                                            return {
                                                ChangeLabel = function(_, p129)
                                                    _TextLabel11.Text = p129
                                                end,
                                            }
                                        end,
                                    }
                                end,
                            }
                        end,
                    }
                end,
            }

            if game.PlaceId ~= 3400631762 then
                if game.PlaceId == 4313854107 then
                    second = true
                end
            else
                first = true
            end

            function checklv()
                local _Text = game:GetService('Players').LocalPlayer.PlayerGui.SG.Mobile.MobileGui.Main.ML.LevelText.Text
                local v132 = string.match(_Text, '%d+')
                local v133 = tonumber(v132)

                if first then
                    if 0 <= v133 and v133 <= 9 then
                        _G.Quests = 'Thug'
                        _G.CQ = CFrame.new(394.923431, 74.4517822, 71.2656021, -0.737181902, -7.93070072e-8, 0.675694346, -1.0324073e-7, 1, 4.73558659e-9, -0.675694346, -6.6268192699999995e-8, -0.737181902)
                    elseif 10 <= v133 and v133 <= 19 then
                        _G.Quests = 'HamonUser'
                        _G.CQ = CFrame.new(394.923431, 74.4517822, 71.2656021, -0.737181902, -7.93070072e-8, 0.675694346, -1.0324073e-7, 1, 4.73558659e-9, -0.675694346, -6.6268192699999995e-8, -0.737181902)
                    elseif 20 <= v133 and v133 <= 29 then
                        _G.Quests = 'Gryphons'
                        _G.CQ = CFrame.new(394.923431, 74.4517822, 71.2656021, -0.737181902, -7.93070072e-8, 0.675694346, -1.0324073e-7, 1, 4.73558659e-9, -0.675694346, -6.6268192699999995e-8, -0.737181902)
                    elseif 30 <= v133 and v133 <= 39 then
                        _G.Quests = 'Vampire'
                        _G.CQ = CFrame.new(394.923431, 74.4517822, 71.2656021, -0.737181902, -7.93070072e-8, 0.675694346, -1.0324073e-7, 1, 4.73558659e-9, -0.675694346, -6.6268192699999995e-8, -0.737181902)
                    elseif 40 <= v133 and v133 <= 54 then
                        _G.Quests = 'SnowThug'
                        _G.CQ = CFrame.new(-178.736893, -48.0788765, 2592.77954, 0.635120928, 9.75075167e-8, -0.772412717, -1.36804587e-7, 1, 1.37492071e-8, 0.772412717, 9.69371925e-8, 0.635120928)
                    elseif 55 <= v133 and v133 <= 89 then
                        _G.Quests = 'Snowman'
                        _G.CQ = CFrame.new(-178.736893, -48.0788765, 2592.77954, 0.635120928, 9.75075167e-8, -0.772412717, -1.36804587e-7, 1, 1.37492071e-8, 0.772412717, 9.69371925e-8, 0.635120928)
                    elseif 90 <= v133 and v133 <= 109 then
                        _G.Quests = 'Desert Bandit'
                        _G.CQ = CFrame.new(127.975739, 29.2183533, -1122.10254, 0.0428085215, -1.32223352e-8, 0.999083281, 8.54155715e-8, 1, 9.574598e-9, -0.999083281, 8.49274002e-8, 0.0428085215)
                    elseif 110 <= v133 and v133 <= 139 then
                        _G.Quests = 'Desert Monster'
                        _G.CQ = CFrame.new(127.975739, 29.2183533, -1122.10254, 0.0428085215, -1.32223352e-8, 0.999083281, 8.54155715e-8, 1, 9.574598e-9, -0.999083281, 8.49274002e-8, 0.0428085215)
                    elseif 140 <= v133 and v133 <= 169 then
                        _G.Quests = 'Dio Guard'
                        _G.CQ = CFrame.new(127.975739, 29.2183533, -1122.10254, 0.0428085215, -1.32223352e-8, 0.999083281, 8.54155715e-8, 1, 9.574598e-9, -0.999083281, 8.49274002e-8, 0.0428085215)
                    elseif 170 <= v133 and v133 <= 249 then
                        _G.Quests = 'Dio Royal Guard'
                        _G.CQ = CFrame.new(127.975739, 29.2183533, -1122.10254, 0.0428085215, -1.32223352e-8, 0.999083281, 8.54155715e-8, 1, 9.574598e-9, -0.999083281, 8.49274002e-8, 0.0428085215)
                    elseif 250 <= v133 and v133 <= 274 then
                        _G.Quests = 'School Bully'
                        _G.CQ = CFrame.new(128197.68, 451.218719, 0.856951237, -0.165256351, 8.26152089e-8, 0.986250639, -4.88928293e-8, 1, -9.19594427e-8, -0.986250639, -6.34174668e-8, -0.165256351)
                    elseif 275 <= v133 and v133 <= 299 then
                        _G.Quests = 'City Criminal'
                        _G.CQ = CFrame.new(128197.68, 451.218719, 0.856951237, -0.165256351, 8.26152089e-8, 0.986250639, -4.88928293e-8, 1, -9.19594427e-8, -0.986250639, -6.34174668e-8, -0.165256351)
                    elseif 300 <= v133 and v133 <= 724 then
                        _G.Quests = 'Criminal Master'
                        _G.CQ = CFrame.new(128197.68, 451.218719, 0.856951237, -0.165256351, 8.26152089e-8, 0.986250639, -4.88928293e-8, 1, -9.19594427e-8, -0.986250639, -6.34174668e-8, -0.165256351)

                        if _G.Change_Word and 400 <= v133 then
                            game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Travl'):FireServer(unpack({
                                'Italy',
                            }))
                        end
                    elseif 725 <= v133 and v133 <= 759 then
                        _G.Quests = 'Magma Guard'
                        _G.CQ = CFrame.new(-97.5778351, 234.985214, 6142.18262, 0.872249961, -2.8254465399999997e-9, -0.489060372, -4.5216634e-8, 1, -8.64221619e-8, 0.489060372, 9.74953878e-8, 0.872249961)
                    elseif 760 <= v133 and v133 <= 789 then
                        _G.Quests = 'Magma Monster'
                        _G.CQ = CFrame.new(-97.5778351, 234.985214, 6142.18262, 0.872249961, -2.8254465399999997e-9, -0.489060372, -4.5216634e-8, 1, -8.64221619e-8, 0.489060372, 9.74953878e-8, 0.872249961)
                    elseif 790 <= v133 and v133 <= 819 then
                        _G.Quests = 'Ice Beast'
                        _G.CQ = CFrame.new(-97.5778351, 234.985214, 6142.18262, 0.872249961, -2.8254465399999997e-9, -0.489060372, -4.5216634e-8, 1, -8.64221619e-8, 0.489060372, 9.74953878e-8, 0.872249961)
                    elseif 820 <= v133 and v133 <= 849 then
                        _G.Quests = 'Elite Beast'
                        _G.CQ = CFrame.new(-97.5778351, 234.985214, 6142.18262, 0.872249961, -2.8254465399999997e-9, -0.489060372, -4.5216634e-8, 1, -8.64221619e-8, 0.489060372, 9.74953878e-8, 0.872249961)
                    elseif v133 >= 850 then
                        _G.Quests = 'Beast Master'
                        _G.CQ = CFrame.new(-97.5778351, 234.985214, 6142.18262, 0.872249961, -2.8254465399999997e-9, -0.489060372, -4.5216634e-8, 1, -8.64221619e-8, 0.489060372, 9.74953878e-8, 0.872249961)
                    end
                elseif second then
                    if 400 <= v133 and v133 <= 419 then
                        _G.Quests = 'Police Man'
                        _G.CQ = CFrame.new(29.0680408, 740.480957, -1388.94653, 0.910684466, -2.50232102e-8, 0.413102686, 9.68262537e-9, 1, 3.9228488899999996e-8, -0.413102686, -3.17248556e-8, 0.910684466)
                    elseif 420 <= v133 and v133 <= 439 then
                        _G.Quests = 'Special Force'
                        _G.CQ = CFrame.new(29.0680408, 740.480957, -1388.94653, 0.910684466, -2.50232102e-8, 0.413102686, 9.68262537e-9, 1, 3.9228488899999996e-8, -0.413102686, -3.17248556e-8, 0.910684466)
                    elseif 440 <= v133 and v133 <= 459 then
                        _G.Quests = 'Gangster'
                        _G.CQ = CFrame.new(29.0680408, 740.480957, -1388.94653, 0.910684466, -2.50232102e-8, 0.413102686, 9.68262537e-9, 1, 3.9228488899999996e-8, -0.413102686, -3.17248556e-8, 0.910684466)
                    elseif 460 <= v133 and v133 <= 479 then
                        _G.Quests = 'Mafia'
                        _G.CQ = CFrame.new(29.0680408, 740.480957, -1388.94653, 0.910684466, -2.50232102e-8, 0.413102686, 9.68262537e-9, 1, 3.9228488899999996e-8, -0.413102686, -3.17248556e-8, 0.910684466)
                    elseif 480 <= v133 and v133 <= 599 then
                        _G.Quests = 'Elite Mafia'
                        _G.CQ = CFrame.new(29.0680408, 740.480957, -1388.94653, 0.910684466, -2.50232102e-8, 0.413102686, 9.68262537e-9, 1, 3.9228488899999996e-8, -0.413102686, -3.17248556e-8, 0.910684466)
                    elseif 600 <= v133 and v133 <= 624 then
                        _G.Quests = 'Newbie Prisoner'
                        _G.CQ = CFrame.new(6476.9375, 745.872986, 1638.56128, 0.506364405, -1.08248784e-7, 0.862319589, 6.15670759e-9, 1, 1.21916798e-7, -0.862319589, -5.64252822e-8, 0.506364405)
                    elseif 625 <= v133 and v133 <= 649 then
                        _G.Quests = 'Prisoner'
                        _G.CQ = CFrame.new(6476.9375, 745.872986, 1638.56128, 0.506364405, -1.08248784e-7, 0.862319589, 6.15670759e-9, 1, 1.21916798e-7, -0.862319589, -5.64252822e-8, 0.506364405)
                    elseif 650 <= v133 and v133 <= 674 then
                        _G.Quests = 'Strong Prisoner'
                        _G.CQ = CFrame.new(6476.9375, 745.872986, 1638.56128, 0.506364405, -1.08248784e-7, 0.862319589, 6.15670759e-9, 1, 1.21916798e-7, -0.862319589, -5.64252822e-8, 0.506364405)
                    elseif v133 >= 675 then
                        _G.Quests = 'Prison Guard'
                        _G.CQ = CFrame.new(6476.9375, 745.872986, 1638.56128, 0.506364405, -1.08248784e-7, 0.862319589, 6.15670759e-9, 1, 1.21916798e-7, -0.862319589, -5.64252822e-8, 0.506364405)

                        if _G.Change_Word and 725 <= v133 then
                            game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Travl'):FireServer(unpack({
                                'ItalyGoBack',
                            }))
                        end
                    end
                end
            end
            function goto(p134)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p134
            end

            local v135, v136, v137 = pairs(workspace.NPCS:GetChildren())
            local u138 = {}
            local u139 = {}
            local u140 = {}

            while true do
                local v141

                v137, v141 = v135(v136, v137)

                if v137 == nil then
                    break
                end

                table.insert(u138, v141.Name)
            end

            local v142, v143, v144 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

            while true do
                local v145

                v144, v145 = v142(v143, v144)

                if v144 == nil then
                    break
                end
                if v145.ClassName == 'Tool' then
                    table.insert(u139, v145.Name)
                end
            end

            local v146, v147, v148 = pairs(workspace.Quests:GetChildren())

            while true do
                local v149

                v148, v149 = v146(v147, v148)

                if v148 == nil then
                    break
                end

                table.insert(u140, v149.Name)
            end

            local _JoJoBlox = v130:CreateWindow('    JoJo Blox')
            local _AutoFarm = _JoJoBlox:NewPage('Main'):NewSection('Auto Farm')
            local _Stats = _JoJoBlox:NewPage('Stats'):NewSection('Stats')
            local _Misc = _JoJoBlox:NewPage('Misc'):NewSection('Misc')
            local _Mob = _JoJoBlox:NewPage('Mob'):NewSection('Mob')
            local _ConfigSaver = _JoJoBlox:NewPage('Config'):NewSection('Config Saver')

            _AutoFarm:CreateLabel('*Warning Remote Tutorial in Winnable Hub YT')
            _AutoFarm:CreateDropdown('Attack Method', {
                'Click',
                'Remote',
            }, function(p156)
                _G.Settings.Attack_Method = p156
            end)
            _AutoFarm:CreateDropdown('Used Method', {
                'Combat',
                'Stand',
                'Sword',
                'Both',
                'ALL',
            }, function(p157)
                _G.Settings.Used = p157
            end)

            local _QuestSelection = _AutoFarm:CreateDropdown('Quest Selection', u140, function(p158)
                _G.Settings.Quest = p158
            end)

            _AutoFarm:CreateButton('Quest Refresh', function(_)
                u140 = {}

                local v160, v161, v162 = pairs(workspace.Quests:GetChildren())

                while true do
                    local v163

                    v162, v163 = v160(v161, v162)

                    if v162 == nil then
                        break
                    end

                    table.insert(u140, v163.Name)
                end

                _QuestSelection:RefreshDropdown(u140)
            end)

            local _WeaponSelection = _AutoFarm:CreateDropdown('Weapon Selection', u139, function(p164)
                _G.Settings.Equipment = p164
            end)

            _AutoFarm:CreateButton('Weapon Refresh', function(_)
                u139 = {}

                local v166, v167, v168 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                while true do
                    local v169

                    v168, v169 = v166(v167, v168)

                    if v168 == nil then
                        break
                    end
                    if v169.ClassName == 'Tool' then
                        table.insert(u139, v169.Name)
                    end
                end

                _WeaponSelection:RefreshDropdown(u139)
            end)
            _AutoFarm:CreateTextBox('Remote ID', 'Enter..', function(p170)
                _G.Settings.ID = p170
            end)
            _AutoFarm:CreateTextBox('Cooldown', 'Enter..', function(p171)
                _G.Settings.CD = p171
            end)
            _AutoFarm:CreateTextBox('Distance', 'Enter.. -20 - 20', function(p172)
                _G.Settings.faraway = p172
            end)
            _AutoFarm:CreateToggle('Auto Farm Level', _G.Settings.Auto_Farm_Level, function(p173)
                _G.Settings.Auto_Farm_Level = p173

                goto(_G.CQ)
            end)
            _AutoFarm:CreateToggle('Auto Change World', _G.Settings.Change_Word, function(p174)
                _G.Settings.Change_Word = p174
            end)
            _AutoFarm:CreateToggle('Auto Quest', _G.Settings.Auto_Farm, function(p175)
                _G.Settings.Auto_Farm = p175

                goto(workspace.Quests[_G.Settings.Quest].CFrame * CFrame.new(0, 20, 0))
            end)
            _AutoFarm:CreateToggle('Spectate', _G.Settings.Spectate, function(p176)
                _G.Settings.Spectate = p176

                if not _G.Settings.Spectate then
                    workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                end
            end)
            _Stats:CreateToggle('Health', _G.Settings.HealthS, function(p177)
                _G.Settings.HealthS = p177

                spawn(function()
                    while task.wait(0.5) do
                        pcall(function()
                            if _G.Settings.HealthS then
                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('OnLevel'):FireServer(unpack({
                                    'HealthLevel',
                                    3,
                                }))
                            end
                        end)
                    end
                end)
            end)
            _Stats:CreateToggle('Stamina', _G.Settings.StaminaS, function(p178)
                _G.Settings.StaminaS = p178

                spawn(function()
                    while task.wait(0.5) do
                        pcall(function()
                            if _G.Settings.StaminaS then
                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('OnLevel'):FireServer(unpack({
                                    'StaminaLevel',
                                    3,
                                }))
                            end
                        end)
                    end
                end)
            end)
            _Stats:CreateToggle('Power', _G.Settings.PowerS, function(p179)
                _G.Settings.PowerS = p179

                spawn(function()
                    while task.wait(0.5) do
                        pcall(function()
                            if _G.Settings.PowerS then
                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('OnLevel'):FireServer(unpack({
                                    'AttackLevel',
                                    3,
                                }))
                            end
                        end)
                    end
                end)
            end)
            _Stats:CreateToggle('Genre', _G.Settings.GenreS, function(p180)
                _G.Settings.GenreS = p180

                spawn(function()
                    while task.wait(0.5) do
                        pcall(function()
                            if _G.Settings.GenreS then
                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('OnLevel'):FireServer(unpack({
                                    'GenreLevel',
                                    3,
                                }))
                            end
                        end)
                    end
                end)
            end)
            _Misc:CreateToggle('Auto Pick Up Arrow', _G.Settings.Auto_Arrow, function(p181)
                _G.Settings.Auto_Arrow = p181
            end)
            _Misc:CreateToggle('Auto Chest (Seen Chest)', _G.Settings.Auto_Chest, function(p182)
                _G.Settings.Auto_Chest = p182
            end)
            _Misc:CreateToggle('Auto Tp Random Pos Chest (Better But Single Use)', _G.Settings.Auto_Pos_Chest, function(p183)
                _G.Settings.Auto_Pos_Chest = p183
            end)

            local _MonsterSelection = _Misc:CreateDropdown('Monster Selection', u138, function(p184)
                _G.Settings.Selection_Mons = p184
            end)

            _Misc:CreateButton('Monster Refresh', function(_)
                u138 = {}

                local v186, v187, v188 = pairs(workspace.NPCS:GetChildren())

                while true do
                    local v189

                    v188, v189 = v186(v187, v188)

                    if v188 == nil then
                        break
                    end

                    table.insert(u138, v189.Name)
                end

                _MonsterSelection:RefreshDropdown(u138)
            end)
            _Misc:CreateToggle('Auto Monster', _G.Settings.Auto_Mons, function(p190)
                _G.Settings.Auto_Mons = p190
            end)
            _Misc:CreateToggle('Kill Aura (Remote)', _G.Settings.KillAura, function(p191)
                _G.Settings.KillAura = p191
            end)
            _Misc:CreateButton('Tp Tool', function(_)
                mouse = game.Players.LocalPlayer:GetMouse()
                tool = Instance.new('Tool')
                tool.RequiresHandle = false
                tool.Name = 'Click to use'

                tool.Activated:connect(function()
                    local v192 = mouse.Hit + Vector3.new(0, 2.5, 0)
                    local v193 = CFrame.new(v192.X, v192.Y, v192.Z)

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v193
                end)

                tool.Parent = game.Players.LocalPlayer.Backpack
            end)

            monss = {}

            local v194, v195, v196 = pairs(workspace.NPCS:GetChildren())

            while true do
                local v197

                v196, v197 = v194(v195, v196)

                if v196 == nil then
                    break
                end

                table.insert(monss, v197.Name)
            end

            _Mob:CreateButton('Mob List Add', function(_)
                if _G.Selection_Mob ~= nil then
                    table.insert(_G.Settings.mobselect, _G.Selection_Mob)
                end
            end)
            _Mob:CreateButton('Mob List Refresh', function(_)
                _G.Settings.mobselect = {}
            end)

            local _MobSelection = _Mob:CreateDropdown('Mob Selection', monss, function(p198)
                _G.Selection_Mob = p198
            end)

            _Mob:CreateButton('Mob Refresh', function(_)
                monss = {}

                local v200, v201, v202 = pairs(workspace.NPCS:GetChildren())

                while true do
                    local v203

                    v202, v203 = v200(v201, v202)

                    if v202 == nil then
                        break
                    end

                    table.insert(monss, v203.Name)
                end

                _MobSelection:RefreshDropdown(u138)
            end)
            _Mob:CreateLabel('PC - F9 | Mobile Type /console In Chat')
            _Mob:CreateButton('Check List', function(_)
                local v204, v205, v206 = pairs(_G.Settings.mobselect)

                while true do
                    local v207

                    v206, v207 = v204(v205, v206)

                    if v206 == nil then
                        break
                    end

                    print(v207)
                end
            end)
            _Mob:CreateToggle('Auto Kill Listed Mob', _G.Settings.AutoListedMob, function(p208)
                _G.Settings.AutoListedMob = p208
            end)

            if first then
                _Mob:CreateToggle('Auto Kira', _G.Settings.Auto_Kira, function(p209)
                    _G.Settings.Auto_Kira = p209
                end)
            end
            if second then
                _Mob:CreateToggle('Auto Diavolo', _G.Settings.Auto_Diavolo, function(p210)
                    _G.Settings.Auto_Diavolo = p210
                end)
            end

            _ConfigSaver:CreateButton('Save Config', function(_)
                if isfolder('WinnableHub') then
                    if isfile('WinnableHub/Config.JSON') then
                        writefile('WinnableHub/Config.JSON', game:service('HttpService'):JSONEncode(_G.Settings))
                    else
                        writefile('WinnableHub/Config.JSON', game:service('HttpService'):JSONEncode(_G.DefaultSettings))
                    end
                else
                    makefolder('WinnableHub')
                end
            end)
            spawn(function()
                while task.wait(120) do
                    pcall(function()
                        local v211 = 0
                        local v212 = 0
                        local _VirtualInputManager = game:GetService('VirtualInputManager')

                        _VirtualInputManager:SendMouseButtonEvent(v211, v212, 0, true, game, 1)
                        _VirtualInputManager:SendMouseButtonEvent(v211, v212, 0, false, game, 1)
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.Auto_Kira and workspace.NPCS:FindFirstChild('Kira') then
                            if workspace.NPCS.Kira:FindFirstChild('HumanoidRootPart') then
                                local _Magnitude = (workspace.NPCS.Kira:FindFirstChild('HumanoidRootPart').CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

                                if _Magnitude > 500 then
                                    if tostring(game:GetService('Players').LocalPlayer.PlayerGui.SG.KiraTeleport.Teleport.Position) ~= '{0.254000008, 0}, {-1.28900003, 0}' then
                                        local _TP = game:GetService('Players').LocalPlayer.PlayerGui.SG.KiraTeleport.Teleport.TP

                                        game:GetService('GuiService').SelectedObject = _TP

                                        if game:GetService('GuiService').SelectedObject == _TP then
                                            local _VirtualInputManager2 = game:GetService('VirtualInputManager')

                                            _VirtualInputManager2:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                            _VirtualInputManager2:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                            task.wait(0.5)

                                            game:GetService('GuiService').SelectedObject = nil
                                        end
                                    else
                                        goto(CFrame.new(127952.711, 402.175232, 415.351807, -0.999830127, -7.92728301e-8, 0.0184326731, -7.92583421e-8, 1, 1.51647428e-9, -0.0184326731, 5.52735288e-11, -0.999830127))
                                        task.wait(3)
                                        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                                        task.wait(0.1)
                                        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                                        task.wait(0.1)
                                    end
                                elseif _Magnitude < 500 then
                                    goto(workspace.NPCS.Kira:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))
                                end
                            elseif not workspace.NPCS.Kira:FindFirstChild('HumanoidRootPart') then
                                if tostring(game:GetService('Players').LocalPlayer.PlayerGui.SG.KiraTeleport.Teleport.Position) ~= '{0.254000008, 0}, {-1.28900003, 0}' then
                                    local _TP2 = game:GetService('Players').LocalPlayer.PlayerGui.SG.KiraTeleport.Teleport.TP

                                    game:GetService('GuiService').SelectedObject = _TP2

                                    if game:GetService('GuiService').SelectedObject == _TP2 then
                                        local _VirtualInputManager3 = game:GetService('VirtualInputManager')

                                        _VirtualInputManager3:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                        _VirtualInputManager3:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                        task.wait(0.5)

                                        game:GetService('GuiService').SelectedObject = nil
                                    end
                                else
                                    goto(CFrame.new(127952.711, 402.175232, 415.351807, -0.999830127, -7.92728301e-8, 0.0184326731, -7.92583421e-8, 1, 1.51647428e-9, -0.0184326731, 5.52735288e-11, -0.999830127))
                                    task.wait(3)
                                    game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                                    task.wait(0.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                                    task.wait(0.1)
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.Auto_Diavolo and workspace.NPCS:FindFirstChild('Diavolo') then
                            if workspace.NPCS.Diavolo:FindFirstChild('HumanoidRootPart') then
                                local _Magnitude2 = (workspace.NPCS.Diavolo:FindFirstChild('HumanoidRootPart').CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

                                if _Magnitude2 > 500 then
                                    if tostring(game:GetService('Players').LocalPlayer.PlayerGui.SG.KiraTeleport.Teleport.Position) ~= '{0.254000008, 0}, {-1.28900003, 0}' then
                                        local _TP3 = game:GetService('Players').LocalPlayer.PlayerGui.SG.DiavoloTeleport.Teleport.TP

                                        game:GetService('GuiService').SelectedObject = _TP3

                                        if game:GetService('GuiService').SelectedObject == _TP3 then
                                            local _VirtualInputManager4 = game:GetService('VirtualInputManager')

                                            _VirtualInputManager4:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                            _VirtualInputManager4:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                            task.wait(0.5)

                                            game:GetService('GuiService').SelectedObject = nil
                                        end
                                    else
                                        goto(CFrame.new(-219.03627, 624.500977, -572.409119, 0.535918772, 9.05800519e-8, 0.844269574, 2.2555123999999998e-8, 1, -1.2160543899999998e-7, -0.844269574, 8.42132408e-8, 0.535918772))
                                        task.wait(3)
                                        game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                                        task.wait(0.1)
                                        game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                                        task.wait(0.1)
                                    end
                                elseif _Magnitude2 < 500 then
                                    goto(workspace.NPCS.Diavolo:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))
                                end
                            elseif not workspace.NPCS.Diavolo:FindFirstChild('HumanoidRootPart') then
                                if tostring(game:GetService('Players').LocalPlayer.PlayerGui.SG.KiraTeleport.Teleport.Position) ~= '{0.254000008, 0}, {-1.28900003, 0}' then
                                    local _TP4 = game:GetService('Players').LocalPlayer.PlayerGui.SG.DiavoloTeleport.Teleport.TP

                                    game:GetService('GuiService').SelectedObject = _TP4

                                    if game:GetService('GuiService').SelectedObject == _TP4 then
                                        local _VirtualInputManager5 = game:GetService('VirtualInputManager')

                                        _VirtualInputManager5:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                        _VirtualInputManager5:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                        task.wait(0.5)

                                        game:GetService('GuiService').SelectedObject = nil
                                    end
                                else
                                    goto(CFrame.new(-219.03627, 624.500977, -572.409119, 0.535918772, 9.05800519e-8, 0.844269574, 2.2555123999999998e-8, 1, -1.2160543899999998e-7, -0.844269574, 8.42132408e-8, 0.535918772))
                                    task.wait(3)
                                    game:service('VirtualInputManager'):SendKeyEvent(true, 'C', false, game)
                                    task.wait(0.1)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, 'C', false, game)
                                    task.wait(0.1)
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait(_G.Settings.CD) do
                    pcall(function()
                        if _G.Settings.Attack_Method == 'Click' and (_G.Settings.Auto_Farm or (_G.Settings.Auto_Mons or (_G.Settings.Auto_Farm_Level or _G.Settings.AutoListedMob))) then
                            local v224 = 0
                            local v225 = 0
                            local _VirtualInputManager6 = game:GetService('VirtualInputManager')

                            _VirtualInputManager6:SendMouseButtonEvent(v224, v225, 0, true, game, 1)
                            _VirtualInputManager6:SendMouseButtonEvent(v224, v225, 0, false, game, 1)
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait(0.2) do
                    pcall(function()
                        if _G.Settings.Auto_Pos_Chest then
                            local v227, v228, v229 = pairs(workspace.Chest1.ChestPos:GetChildren())

                            while true do
                                local v230

                                v229, v230 = v227(v228, v229)

                                if v229 == nil then
                                    break
                                end

                                goto(v230.CFrame)
                                task.wait(0.2)
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait(0.2) do
                    pcall(function()
                        if _G.Settings.Auto_Chest then
                            local v231, v232, v233 = pairs(workspace:GetChildren())

                            while true do
                                local v234

                                v233, v234 = v231(v232, v233)

                                if v233 == nil then
                                    break
                                end
                                if v234.Name == 'Chest' and v234:FindFirstChild('TouchPart') then
                                    goto(v234.TouchPart.CFrame)
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait(0.2) do
                    pcall(function()
                        if _G.Settings.Auto_Arrow then
                            local v235, v236, v237 = pairs(workspace.Arrows:GetChildren())

                            while true do
                                local v238

                                v237, v238 = v235(v236, v237)

                                if v237 == nil then
                                    break
                                end
                                if v238:FindFirstChild('Handle') then
                                    goto(v238.Handle.CFrame)
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait(0.3) do
                    pcall(function()
                        if _G.Settings.KillAura or (_G.Settings.Auto_Diavolo or _G.Settings.Auto_Kira) then
                            if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment) and _G.Settings.Used ~= 'Both' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment))
                            elseif _G.Settings.Used == 'Both' or _G.Settings.Used == 'ALL' then
                                speaker = game.Players.LocalPlayer

                                local v239, v240, v241 = pairs(speaker:FindFirstChildOfClass('Backpack'):GetChildren())

                                while true do
                                    local v242

                                    v241, v242 = v239(v240, v241)

                                    if v241 == nil then
                                        break
                                    end
                                    if (v242:IsA('Tool') or v242:IsA('HopperBin')) and (v242.Name ~= 'Click to use' and not (string.find(v242.Name, 'Arrow') or string.find(v242.Name, 'Book'))) then
                                        v242.Parent = speaker.Character
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait(_G.Settings.CD) do
                    pcall(function()
                        if _G.Settings.Attack_Method == 'Remote' and (_G.Settings.Auto_Farm or (_G.Settings.Auto_Diavolo or (_G.Settings.Auto_Kira or (_G.Settings.Auto_Farm_Level or (_G.Settings.Auto_Mons or (_G.Settings.KillAura or _G.Settings.AutoListedMob)))))) then
                            local v243, v244, v245 = pairs(workspace.NPCS:GetChildren())

                            while true do
                                local v246

                                v245, v246 = v243(v244, v245)

                                if v245 == nil then
                                    break
                                end
                                if v246.Humanoid.Health > 0 and (v246:FindFirstChild('HumanoidRootPart') and (v246.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 15) then
                                    if _G.Settings.Used ~= 'ALL' then
                                        if _G.Settings.Used ~= 'Both' then
                                            if _G.Settings.Used == 'Sword' or (_G.Settings.Used == 'Combat' or _G.Settings.Used == 'Stand') then
                                                if _G.Settings.Used == 'Sword' then
                                                    local v247, v248, v249 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                                    while true do
                                                        local v250

                                                        v249, v250 = v247(v248, v249)

                                                        if v249 == nil then
                                                            break
                                                        end
                                                        if v250:FindFirstChild('Handle') and v250:FindFirstChild('Handle').ClassName == 'Part' then
                                                            local _Name = v250.Name
                                                            local v252 = {
                                                                v246,
                                                                5000,
                                                                0,
                                                                _Name,
                                                                false,
                                                                'RightPunch' .. _Name,
                                                                _G.Settings.ID,
                                                            }

                                                            game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v252))
                                                        end
                                                    end
                                                end
                                                if _G.Settings.Used == 'Combat' then
                                                    local v253, v254, v255 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                                    while true do
                                                        local v256

                                                        v255, v256 = v253(v254, v255)

                                                        if v255 == nil then
                                                            break
                                                        end
                                                        if v256:FindFirstChild('punch') then
                                                            local v257 = {
                                                                v246,
                                                                5000,
                                                                0,
                                                                v256.Name,
                                                                false,
                                                                'RightPunch',
                                                                _G.Settings.ID,
                                                            }

                                                            game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v257))
                                                        end
                                                    end
                                                end
                                                if _G.Settings.Used == 'Stand' then
                                                    local v258, v259, v260 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                                    while true do
                                                        local v261

                                                        v260, v261 = v258(v259, v260)

                                                        if v260 == nil then
                                                            break
                                                        end
                                                        if v261.ClassName == 'Model' then
                                                            local v262 = {
                                                                v246,
                                                                5000,
                                                                0,
                                                                v261.Name,
                                                                false,
                                                                'RightPunch' .. v261.Name,
                                                                _G.Settings.ID,
                                                            }

                                                            game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v262))
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            local v263, v264, v265 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                            while true do
                                                local v266

                                                v265, v266 = v263(v264, v265)

                                                if v265 == nil then
                                                    break
                                                end
                                                if v266.ClassName == 'Tool' and v266:FindFirstChild('punch') then
                                                    local v267 = {
                                                        v246,
                                                        5000,
                                                        0,
                                                        v266.Name,
                                                        true,
                                                        'RightPunch',
                                                        _G.Settings.ID,
                                                    }

                                                    game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v267))
                                                end
                                            end

                                            local v268, v269, v270 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                            while true do
                                                local v271

                                                v270, v271 = v268(v269, v270)

                                                if v270 == nil then
                                                    break
                                                end
                                                if v271.ClassName == 'Model' then
                                                    local v272 = {
                                                        v246,
                                                        5000,
                                                        0,
                                                        v271.Name,
                                                        false,
                                                        'RightPunch' .. v271.Name,
                                                        _G.Settings.ID,
                                                    }

                                                    game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v272))
                                                end
                                            end
                                        end
                                    else
                                        local v273, v274, v275 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                        while true do
                                            local v276

                                            v275, v276 = v273(v274, v275)

                                            if v275 == nil then
                                                break
                                            end
                                            if v276:FindFirstChild('Handle') and v276:FindFirstChild('Handle').ClassName == 'Part' then
                                                local _Name2 = v276.Name
                                                local v278 = {
                                                    v246,
                                                    5000,
                                                    0,
                                                    _Name2,
                                                    true,
                                                    'RightPunch' .. _Name2,
                                                    _G.Settings.ID,
                                                }

                                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v278))
                                            end
                                        end

                                        local v279, v280, v281 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                        while true do
                                            local v282

                                            v281, v282 = v279(v280, v281)

                                            if v281 == nil then
                                                break
                                            end
                                            if v282.ClassName == 'Tool' and v282:FindFirstChild('punch') then
                                                local v283 = {
                                                    v246,
                                                    5000,
                                                    0,
                                                    v282.Name,
                                                    true,
                                                    'RightPunch',
                                                    _G.Settings.ID,
                                                }

                                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v283))
                                            end
                                        end

                                        local v284, v285, v286 = pairs(game.Players.LocalPlayer.Character:GetChildren())

                                        while true do
                                            local v287

                                            v286, v287 = v284(v285, v286)

                                            if v286 == nil then
                                                break
                                            end
                                            if v287.ClassName == 'Model' then
                                                local v288 = {
                                                    v246,
                                                    5000,
                                                    0,
                                                    v287.Name,
                                                    false,
                                                    'RightPunch' .. v287.Name,
                                                    _G.Settings.ID,
                                                }

                                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Damage'):FireServer(unpack(v288))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.AutoListedMob then
                            if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment) and _G.Settings.Used ~= 'Both' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment))
                            elseif _G.Settings.Used == 'Both' or _G.Settings.Used == 'ALL' then
                                speaker = game.Players.LocalPlayer

                                local v289, v290, v291 = pairs(speaker:FindFirstChildOfClass('Backpack'):GetChildren())

                                while true do
                                    local v292

                                    v291, v292 = v289(v290, v291)

                                    if v291 == nil then
                                        break
                                    end
                                    if (v292:IsA('Tool') or v292:IsA('HopperBin')) and (v292.Name ~= 'Click to use' and not (string.find(v292.Name, 'Arrow') or string.find(v292.Name, 'Book'))) then
                                        v292.Parent = speaker.Character
                                    end
                                end
                            end

                            local v293, v294, v295 = pairs(workspace.NPCS:GetChildren())

                            while true do
                                local v296

                                v295, v296 = v293(v294, v295)

                                if v295 == nil then
                                    break
                                end

                                local v297, v298, v299 = pairs(_G.Settings.mobselect)

                                while true do
                                    local v300

                                    v299, v300 = v297(v298, v299)

                                    if v299 == nil then
                                        break
                                    end
                                    if v296.Name == v300 and (v296:FindFirstChild('HumanoidRootPart') and v296.Humanoid.Health > 0) then
                                        goto(v296.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.Auto_Mons then
                            if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment) then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment))
                            end
                            if workspace.NPCS:FindFirstChild(_G.Settings.Selection_Mons).Humanoid.Health > 0 then
                                goto(workspace.NPCS[_G.Settings.Selection_Mons].HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.Auto_Farm_Level then
                            checklv()

                            if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment) and _G.Settings.Used ~= 'Both' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment))
                            elseif _G.Settings.Used == 'Both' or _G.Settings.Used == 'ALL' then
                                speaker = game.Players.LocalPlayer

                                local v301, v302, v303 = pairs(speaker:FindFirstChildOfClass('Backpack'):GetChildren())

                                while true do
                                    local v304

                                    v303, v304 = v301(v302, v303)

                                    if v303 == nil then
                                        break
                                    end
                                    if (v304:IsA('Tool') or v304:IsA('HopperBin')) and (v304.Name ~= 'Click to use' and not (string.find(v304.Name, 'Arrow') or string.find(v304.Name, 'Book'))) then
                                        v304.Parent = speaker.Character
                                    end
                                end
                            end
                            if game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Visible ~= true then
                                if game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Visible == false then
                                    goto(_G.CQ)
                                    task.wait(0.5)

                                    local v305 = {
                                        _G.Quests,
                                    }

                                    game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Quest'):FireServer(unpack(v305))
                                end
                            elseif string.find(game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Label.Text, _G.Quests) then
                                if string.find(game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Label.Text, _G.Quests) then
                                    local v306, v307, v308 = pairs(workspace.NPCS:GetChildren())

                                    while true do
                                        local v309

                                        v308, v309 = v306(v307, v308)

                                        if v308 == nil then
                                            break
                                        end
                                        if workspace.Quests:FindFirstChild(_G.Quests) and (v309.QName.Value == _G.Quests and (v309:FindFirstChild('HumanoidRootPart') and v309.Humanoid.Health > 0)) then
                                            goto(v309.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))

                                            if _G.Settings.Spectate then
                                                workspace.Camera.CameraSubject = v309.Humanoid
                                            elseif not _G.Settings.Spectate then
                                                workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                                            end
                                        end
                                    end
                                elseif not workspace.Quests:FindFirstChild(_G.Quests) then
                                    goto(_G.CQ)
                                end
                            else
                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Quest'):FireServer(unpack({
                                    'Abort',
                                }))
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.Auto_Farm then
                            if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment) and _G.Settings.Used ~= 'Both' then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService('Players').LocalPlayer.Backpack:FindFirstChild(_G.Settings.Equipment))
                            elseif _G.Settings.Used == 'Both' or _G.Settings.Used == 'ALL' then
                                speaker = game.Players.LocalPlayer

                                local v310, v311, v312 = pairs(speaker:FindFirstChildOfClass('Backpack'):GetChildren())

                                while true do
                                    local v313

                                    v312, v313 = v310(v311, v312)

                                    if v312 == nil then
                                        break
                                    end
                                    if (v313:IsA('Tool') or v313:IsA('HopperBin')) and (v313.Name ~= 'Click to use' and not (string.find(v313.Name, 'Arrow') or string.find(v313.Name, 'Book'))) then
                                        v313.Parent = speaker.Character
                                    end
                                end
                            end
                            if game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Visible ~= true then
                                if game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Visible == false then
                                    goto(workspace.Quests[_G.Settings.Quest].CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait(0.5)

                                    local v314 = {
                                        _G.Settings.Quest,
                                    }

                                    game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Quest'):FireServer(unpack(v314))
                                end
                            elseif string.find(game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Label.Text, _G.Settings.Quest) then
                                if string.find(game.Players.LocalPlayer.PlayerGui.SG.Quest.Frame.Label.Text, _G.Settings.Quest) then
                                    local v315, v316, v317 = pairs(workspace.NPCS:GetChildren())

                                    while true do
                                        local v318

                                        v317, v318 = v315(v316, v317)

                                        if v317 == nil then
                                            break
                                        end
                                        if v318.QName.Value == _G.Settings.Quest and (v318:FindFirstChild('HumanoidRootPart') and v318.Humanoid.Health > 0) then
                                            goto(v318.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.faraway, 0) * CFrame.Angles(math.rad(90), 0, 0))

                                            if _G.Settings.Spectate then
                                                workspace.Camera.CameraSubject = v318.Humanoid
                                            elseif not _G.Settings.Spectate then
                                                workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                                            end
                                        end
                                    end
                                end
                            else
                                game:GetService('ReplicatedStorage'):WaitForChild('RS'):WaitForChild('Quest'):FireServer(unpack({
                                    'Abort',
                                }))
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.Settings.NoClip or (_G.Settings.Auto_Diavolo or (_G.Settings.Auto_Farm_Level or (_G.Settings.Auto_Farm or (_G.Settings.Auto_Mons or (_G.Settings.AutoListedMob or _G.Settings.Auto_Kira))))) then
                            if not game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyClip') then
                                local _BodyVelocity = Instance.new('BodyVelocity')

                                _BodyVelocity.Name = 'BodyClip'
                                _BodyVelocity.Parent = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
                                _BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                                _BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                            end
                        else
                            game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyClip'):Destroy()
                        end
                    end)
                end
            end)
            spawn(function()
                pcall(function()
                    game:GetService('RunService').Stepped:Connect(function()
                        local v320, v321, v322 = pairs(game.Players.LocalPlayer.Character:GetDescendants())

                        while true do
                            local v323

                            v322, v323 = v320(v321, v322)

                            if v322 == nil then
                                break
                            end
                            if v323:IsA('BasePart') then
                                if _G.Settings.NoClip or (_G.Settings.Auto_Diavolo or (_G.Settings.Auto_Farm_Level or (_G.Settings.Auto_Farm_Level or (_G.Settings.Auto_Farm or (_G.Settings.Auto_Mons or (_G.Settings.AutoListedMob or _G.Settings.Auto_Kira)))))) then
                                    v323.CanCollide = false
                                elseif not (_G.Settings.NoClip or (_G.Settings.Auto_Diavolo or (_G.Settings.Auto_Farm_Level or (_G.Settings.Auto_Farm_Level or (_G.Settings.Auto_Farm or (_G.Settings.Auto_Mons or (_G.Settings.AutoListedMob or _G.Settings.Auto_Kira))))))) then
                                    v323.CanCollide = true
                                end
                            end
                        end
                    end)
                end)
            end)
        end

        return
    end
end
