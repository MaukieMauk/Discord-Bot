local discordia = require('discordia')
local client = discordia.Client()

local function readToken(filename)
    local file = io.open(filename, "r")
    if not file then
        error("Token file not found: " .. filename)
    end
    local token = file:read("*l")  -- read the first line
    file:close()
    return token
end

local token = readToken("config.txt")  -- path to your file
if not token then
    error("Token is empty!")
end

client:run("Bot " .. token)