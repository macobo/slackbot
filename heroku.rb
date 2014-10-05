
require 'chat-adapter'

class HerokuSlackAdapter < ChatAdapter::Slack
  def initialize
    super(nick: ENV['CHATBOT_NAME'],
      webhook_token: ENV['SLACK_WEBHOOK_TOKEN'],
      api_token: ENV['SLACK_API_TOKEN'])
  end
end