local discordia = require('discordia')
local client = discordia.Client()

-- Function to read token from config.txt line 1
local function readToken(filename)
    local file = io.open(filename, "r")
    if not file then
        error("Token file not found: " .. filename)
    end
    local token = file:read("*l")  -- read the first line
    file:close()
    if not token or token == "" then
        error("Token is empty in " .. filename)
    end
    return token
end

local token = readToken("config.txt")  -- path to your config file

-- Bot events
client:on('ready', function()
    print('Bot logged in as ' .. client.user.username)
end)

-- Run the bot
client:run("Bot " .. token)
