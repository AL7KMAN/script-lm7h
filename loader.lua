local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local morfinLib = {
    black = Color3.fromRGB(0, 0, 0),
    purpleMix = Color3.fromRGB(138, 43, 226),
    purplePink = Color3.fromRGB(128, 0, 128),
    purple = Color3.fromRGB(200, 100, 220),
    darkPurple = Color3.fromRGB(45, 10, 60),
    white = Color3.fromRGB(255, 255, 255)
}

getgenv().SnapEnabled = false
getgenv().SnapVal = 0
getgenv().SnapMode = "Above"
getgenv().BaseY = nil

pcall(function()
    if CoreGui:FindFirstChild("Snap_CustomContainerGUI") then
        CoreGui.Snap_CustomContainerGUI:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Snap_CustomContainerGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    elseif protectgui then
        protectgui(ScreenGui)
    end
end)

ScreenGui.Parent = CoreGui

local ContainerFrame = Instance.new("ImageLabel")
ContainerFrame.Name = "ContainerFrame"
ContainerFrame.Size = UDim2.new(0, 240, 0, 105)
ContainerFrame.Position = UDim2.new(0.5, -120, 0.4, 0)
ContainerFrame.BackgroundTransparency = 1
ContainerFrame.Image = "rbxassetid://117106459651864"
ContainerFrame.ScaleType = Enum.ScaleType.Fit
ContainerFrame.Active = true
ContainerFrame.Parent = ScreenGui

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 16)
ContainerCorner.Parent = ContainerFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 140, 0, 25)
TitleLabel.Position = UDim2.new(0.5, -70, 0, 8)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "LM7H"
TitleLabel.TextColor3 = morfinLib.white
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.ZIndex = 5
TitleLabel.Active = true
TitleLabel.Parent = ContainerFrame

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purple),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
TitleGradient.Parent = TitleLabel

local draggingFrame = false
local dragInput, dragStart, startPos

TitleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingFrame = true
        dragStart = input.Position
        startPos = ContainerFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingFrame = false
            end
        end)
    end
end)

TitleLabel.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and draggingFrame then
        local delta = input.Position - dragStart
        ContainerFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 18, 0, 18)
CloseBtn.Position = UDim2.new(0, 14, 0, 11)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = morfinLib.white
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 10
CloseBtn.ZIndex = 10
CloseBtn.Parent = ContainerFrame

local CloseGradient = Instance.new("UIGradient")
CloseGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purple),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
CloseGradient.Rotation = 45
CloseGradient.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 36, 0, 16)
ToggleBtn.Position = UDim2.new(1, -50, 0, 12)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Text = "OFF"
ToggleBtn.TextColor3 = morfinLib.white
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 10
ToggleBtn.ZIndex = 5
ToggleBtn.Parent = ContainerFrame

local ToggleGradient = Instance.new("UIGradient")
ToggleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purple),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
ToggleGradient.Parent = ToggleBtn

local SliderContainer = Instance.new("Frame")
SliderContainer.Size = UDim2.new(0.70, 0, 0, 22)
SliderContainer.Position = UDim2.new(0.15, 0, 0, 45)
SliderContainer.BackgroundTransparency = 1
SliderContainer.ZIndex = 5
SliderContainer.Active = true
SliderContainer.Parent = ContainerFrame

local SliderTitle = Instance.new("TextLabel")
SliderTitle.Size = UDim2.new(1, 0, 0, 8)
SliderTitle.BackgroundTransparency = 1
SliderTitle.Text = "Height: 0"
SliderTitle.TextColor3 = morfinLib.white
SliderTitle.Font = Enum.Font.GothamBold
SliderTitle.TextSize = 7.5
SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
SliderTitle.ZIndex = 5
SliderTitle.Active = false
SliderTitle.Parent = SliderContainer

local SliderTitleGradient = Instance.new("UIGradient")
SliderTitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purpleMix),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
SliderTitleGradient.Parent = SliderTitle

local SliderTrack = Instance.new("Frame")
SliderTrack.Size = UDim2.new(1, 0, 0, 4)
SliderTrack.Position = UDim2.new(0, 0, 0, 12)
SliderTrack.BackgroundColor3 = morfinLib.black
SliderTrack.BorderSizePixel = 0
SliderTrack.ZIndex = 5
SliderTrack.Active = false
SliderTrack.Parent = SliderContainer

local TrackCorner = Instance.new("UICorner")
TrackCorner.CornerRadius = UDim.new(1, 0)
TrackCorner.Parent = SliderTrack

local TrackStroke = Instance.new("UIStroke")
TrackStroke.Thickness = 1
TrackStroke.Color = morfinLib.darkPurple
TrackStroke.Parent = SliderTrack

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0, 0, 1, 0)
SliderFill.BackgroundColor3 = morfinLib.purpleMix
SliderFill.BorderSizePixel = 0
SliderFill.ZIndex = 5
SliderFill.Active = false
SliderFill.Parent = SliderTrack

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = SliderFill

local FillGradient = Instance.new("UIGradient")
FillGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purple),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
FillGradient.Parent = SliderFill

local SliderKnob = Instance.new("Frame")
SliderKnob.Size = UDim2.new(0, 10, 0, 10)
SliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
SliderKnob.Position = UDim2.new(0, 0, 0.5, 0)
SliderKnob.BackgroundColor3 = morfinLib.darkPurple
SliderKnob.BorderSizePixel = 0
SliderKnob.ZIndex = 6
SliderKnob.Active = false
SliderKnob.Parent = SliderTrack

local KnobCorner = Instance.new("UICorner")
KnobCorner.CornerRadius = UDim.new(1, 0)
KnobCorner.Parent = SliderKnob

local KnobStroke = Instance.new("UIStroke")
KnobStroke.Thickness = 1
KnobStroke.Color = morfinLib.purpleMix
KnobStroke.Parent = SliderKnob

local KnobGradient = Instance.new("UIGradient")
KnobGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purplePink),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
KnobGradient.Parent = SliderKnob

local ModeBtn = Instance.new("TextButton")
ModeBtn.Size = UDim2.new(0.8, 0, 0, 16)
ModeBtn.Position = UDim2.new(0.1, 0, 0, 75)
ModeBtn.BackgroundColor3 = morfinLib.black
ModeBtn.Text = "MODE: ABOVE < "
ModeBtn.TextColor3 = morfinLib.white
ModeBtn.Font = Enum.Font.GothamBold
ModeBtn.TextSize = 8.5
ModeBtn.ZIndex = 5
ModeBtn.Parent = ContainerFrame

local ModeCorner = Instance.new("UICorner")
ModeCorner.CornerRadius = UDim.new(0, 6)
ModeCorner.Parent = ModeBtn

local ModeStroke = Instance.new("UIStroke")
ModeStroke.Thickness = 1
ModeStroke.Color = morfinLib.purpleMix
ModeStroke.Transparency = 0.5
ModeStroke.Parent = ModeBtn

local ModeGradient = Instance.new("UIGradient")
ModeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, morfinLib.purple),
    ColorSequenceKeypoint.new(1, morfinLib.black)
})
ModeGradient.Parent = ModeBtn

local maxVal = 50
local draggingSlider = false
local currentTouchInput = nil

-- Anti-Glitch: حساب السحب بدقة بدون تعليق ومحمي ضد تداخل اللمسات
local function updateSlider(xPos)
    local trackWidth = SliderTrack.AbsoluteSize.X
    if trackWidth <= 0 then return end
    
    local relativeX = xPos - SliderTrack.AbsolutePosition.X
    local pos = math.clamp(relativeX / trackWidth, 0, 1)
    local val = math.floor(pos * maxVal)
    
    getgenv().SnapVal = val
    SliderTitle.Text = "Height: " .. tostring(val)
    
    SliderFill.Size = UDim2.new(pos, 0, 1, 0)
    SliderKnob.Position = UDim2.new(pos, 0, 0.5, 0)
end

SliderContainer.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not draggingFrame then
        draggingSlider = true
        currentTouchInput = input
        updateSlider(input.Position.X)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingSlider and (input == currentTouchInput or input.UserInputType == Enum.UserInputType.MouseMovement) then
        updateSlider(input.Position.X)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input == currentTouchInput or input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSlider = false
        currentTouchInput = nil
    end
end)

ToggleBtn.MouseButton1Click:Connect(function()
    getgenv().SnapEnabled = not getgenv().SnapEnabled
    if not getgenv().SnapEnabled then
        getgenv().BaseY = nil
        ToggleBtn.Text = "OFF"
        ToggleGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, morfinLib.purple),
            ColorSequenceKeypoint.new(1, morfinLib.black)
        })
    else
        ToggleBtn.Text = "ON"
        ToggleGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, morfinLib.white),
            ColorSequenceKeypoint.new(1, morfinLib.purpleMix)
        })
    end
end)

ModeBtn.MouseButton1Click:Connect(function()
    if getgenv().SnapMode == "Above" then
        getgenv().SnapMode = "Under"
        ModeBtn.Text = "MODE: UNDER < "
    else
        getgenv().SnapMode = "Above"
        ModeBtn.Text = "MODE: ABOVE < "
    end
end)

RunService.Heartbeat:Connect(function()
    if getgenv().SnapEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if not getgenv().BaseY then getgenv().BaseY = hrp.Position.Y end
        local offset = (getgenv().SnapMode == "Above" and getgenv().SnapVal) or -getgenv().SnapVal
        local targetY = getgenv().BaseY + offset
        hrp.CFrame = CFrame.new(hrp.Position.X, targetY, hrp.Position.Z) * (hrp.CFrame - hrp.CFrame.Position)
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
    else
        getgenv().BaseY = nil
    end
end)

