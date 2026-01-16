local CommandHandler = require("../commandHandler")

CommandHandler.register({
  name = "userinfo",
  description = "Get user info",
  slash = true,
  options = {
    {
      type = 6, -- USER
      name = "user",
      description = "Target user",
      required = false
    }
  },

  execute = function(message, args)
    local user = message.mentionedUsers:first() or message.author
    message:reply("User: **" .. user.username .. "**")
  end,

  executeSlash = function(interaction)
    local option = interaction.data.options and interaction.data.options[1]
    local user = option and option.value and interaction.guild:getMember(option.value).user
      or interaction.user

    interaction:reply("User: **" .. user.username .. "**")
  end
})
