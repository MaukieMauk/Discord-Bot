local discordia = require('discordia')
local client = discordia.Client()

client:on('messageCreate', function(message)
    if message.content == '!ping' then
        message:reply('Pong!')
    end
end)