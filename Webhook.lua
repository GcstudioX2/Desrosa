-- Webhook.lua
local Webhook = {}

-- 🔗 ตั้งค่า URL webhook ของคุณที่นี่
local WEBHOOK_URL = _G.WEBHOOK_URL or "https://discord.com/api/webhooks/1353658476072534066/ljR7NZTg6jVeQPt-XU1kNWOc-TtKc7c3kILi7EE1ZAQivReT9pgERHvtxJCvTa_3ic16"

local HttpService = game:GetService("HttpService")

function Webhook.send(data)
    if not WEBHOOK_URL or WEBHOOK_URL == "" then return end
    local success, err = pcall(function()
        local payload = HttpService:JSONEncode({
            content = data.message,
            embeds = {{
                title = data.title or "Auto Collector",
                description = data.desc or "",
                color = 65280, -- เขียว
                footer = { text = "Bacon Hub - "..os.date("%X") }
            }}
        })
        syn.request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"]="application/json"},
            Body = payload
        })
    end)
    if not success then warn("Webhook error:", err) end
end

return Webhook
