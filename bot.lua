local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
    print('Bot logged in as ' .. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.content == '!ping' then
        message:reply('Pong!')
    end
end)

-- Use the environment variable BOTKEY instead of hardcoding the token
local token = os.getenv("BOTKEY")
if not token then
    error("BOTKEY environment variable not set!")
end

client:run(token)
