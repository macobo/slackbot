# use karl's chat-adapter library
require 'chat-adapter'
# also use the local HerokuSlackbot class defined in heroku.rb
require './heroku'

# if we're on our local machine, we want to test our bot via shell, but when on
# heroku, deploy the actual slackbot.
if ARGV.first == 'heroku'
  bot = HerokuSlackAdapter.new
else
  bot = ChatAdapter::Shell.new(nick: 'echobot')
end

# Feel free to ignore this - makes logging easier
log = ChatAdapter.log

# Do this thing in this block each time the bot hears a message:
bot.on_message do |message, info|
  # ignore all messages not directed to this bot
  unless message.start_with? 'echobot: '
    next # don't process the next lines in this block
  end

  # Conditionally send a direct message to the person saying whisper
  if message == 'echobot: whisper'
    # log some info - useful when something doesn't work as expected
    log.debug("Someone whispered! #{info}")
    # and send the actual message
    bot.direct_message(info[:user], "whisper-whisper")
  end

  # split the message in 2 to get what was actually said.
  botname, command = message.split(': ', 2)

  # answer the query!
  # this bot simply echoes the message back
  "@#{info[:user]}: #{command}"
end

# actually start the bot
bot.start!