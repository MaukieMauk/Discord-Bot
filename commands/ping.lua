local CommandHandler = require("../commandHandler")

CommandHandler.register({
  name = "ping",
  aliases = {"p"},
  description = "Ping the bot",
  slash = true,

  execute = function(message, args)
    message:reply("🏓 Pong!")
  end,

  executeSlash = function(interaction)
    interaction:reply("🏓 Pong!")
  end
})
