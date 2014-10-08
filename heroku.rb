
require 'chat-adapter'

class HerokuSlackAdapter < ChatAdapter::Slack
  def initialize(options)
    super(nick: options.fetch(:nick),
      webhook_token: ENV['SLACK_WEBHOOK_TOKEN'],
      api_token: ENV['SLACK_API_TOKEN'])
  end
end