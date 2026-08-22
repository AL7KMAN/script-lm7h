local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Abood",
    Author = "by abood",
    Folder = "AboodMenu",
    OpenButton = {
        Title = "Open Abood",
        Enabled = true,
        Draggable = true
    }
})

local MapTab = Window:Tab({
    Title = "Strongest Battlegrounds",
    Icon = "sword"
})

MapTab:Button({
    Title = "Strongest",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Porject-Yielding-Best-Farm-For-TSB-224226"))()
    end
})

local BloxTab = Window:Tab({
    Title = "Blox Fruits",
    Icon = "apple"
})

BloxTab:Button({
    Title = "Redz",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Redz-hub-205954"))()
    end
})

BloxTab:Button({
    Title = "Quantum",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Quantum-Hub-Script/Quantum-Hub/main/QuantumHub.lua"))()
    end
})

local FPSTab = Window:Tab({
    Title = "FPS & Performance",
    Icon = "gauge"
})

FPSTab:Button({
    Title = "FPS Booster",
    Callback = function()
        local lp = game:GetService("Players").LocalPlayer
        local pgui = lp:WaitForChild("PlayerGui")
        local sg = Instance.new("ScreenGui", pgui)
        sg.Name = "FPS_Cap"
        sg.ResetOnSpawn = false
        local f = Instance.new("Frame", sg)
        f.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        f.Position = UDim2.new(0.1, 0, 0.1, 0)
        f.Size = UDim2.new(0, 140, 0, 90)
        f.Active = true
        f.Draggable = true
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
        local box = Instance.new("TextBox", f)
        box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        box.Position = UDim2.new(0.1, 0, 0.2, 0)
        box.Size = UDim2.new(0.8, 0, 0.3, 0)
        box.Font = Enum.Font.SourceSans
        box.PlaceholderText = "FPS..."
        box.Text = "60"
        box.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", box)
        local btn = Instance.new("TextButton", f)
        btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
        btn.Position = UDim2.new(0.1, 0, 0.6, 0)
        btn.Size = UDim2.new(0.8, 0, 0.3, 0)
        btn.Text = "Apply"
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.SourceSansBold
        Instance.new("UICorner", btn)
        btn.MouseButton1Click:Connect(function()
            if setfpscap then setfpscap(tonumber(box.Text) or 60) end
        end)
    end
})

FPSTab:Button({
    Title = "Anti Lag",
    Callback = function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Lighting = game:GetService("Lighting")
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "AntiLagGui"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Parent = PlayerGui

        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0.3, 0, 0.06, 0)
        Frame.Position = UDim2.new(0.35, 0, 0.9, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Frame.BorderSizePixel = 0
        Frame.Parent = ScreenGui

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Frame

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.BackgroundTransparency = 1
        Label.Text = "تم تفعيل السكربت بنجاح"
        Label.TextColor3 = Color3.fromRGB(0, 220, 100)
        Label.TextScaled = true
        Label.Font = Enum.Font.GothamBold
        Label.Parent = Frame

        task.delay(5, function()
            for i = 0, 1, 0.05 do
                Frame.BackgroundTransparency = i
                Label.TextTransparency = i
                task.wait(0.05)
            end
            ScreenGui:Destroy()
        end)

        local function AntiLag()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v.Enabled = false
                    v.Rate = 0
                end
                if v:IsA("BasePart") then
                    v.CastShadow = false
                    v.Material = Enum.Material.SmoothPlastic
                end
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                end
                if v:IsA("Sound") then
                    v.Volume = 0
                end
            end

            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.FogStart = 9e9
            Lighting.Brightness = 1
            Lighting.ClockTime = 14
            Lighting.Ambient = Color3.fromRGB(178, 178, 178)

            for _, effect in ipairs(Lighting:GetChildren()) do
                if effect:IsA("BlurEffect") or effect:IsA("DepthOfFieldEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") then
                    effect.Enabled = false
                end
            end

            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

            pcall(function()
                workspace.StreamingEnabled = true
            end)
        end

        AntiLag()

        workspace.DescendantAdded:Connect(function(v)
            task.wait()
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
                v.Rate = 0
            end
            if v:IsA("BasePart") then
                v.CastShadow = false
            end
        end)

        LocalPlayer.Chatted:Connect(function(message)
            if message:lower() == ";antilag" then
                AntiLag()
            end
        end)
    end
})

FPSTab:Button({
    Title = "ANTIAFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
})
local MiscTab = Window:Tab({
    Title = "Player Misc",
    Icon = "user"
})

MiscTab:Button({
    Title = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

local ThemeTab = Window:Tab({
    Title = "Themes",
    Icon = "palette"
})

ThemeTab:Dropdown({
    Title = "Choose Theme",
    Values = {"Dark", "Light", "Red", "Emerald", "Amber"},
    Value = "Dark",
    Callback = function(ThemeName)
        WindUI:SetTheme(ThemeName)
    end
})

local ServerTab = Window:Tab({
    Title = "Server",
    Icon = "server"
})

ServerTab:Button({
    Title = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

local CreditsTab = Window:Tab({
    Title = "Credits",
    Icon = "info"
})

CreditsTab:Button({
    Title = "Developer: Abood",
    Callback = function() setclipboard("Abood") end
})

CreditsTab:Button({
    Title = "TikTok: 7rbx_9",
    Callback = function() setclipboard("7rbx_9") end
})
