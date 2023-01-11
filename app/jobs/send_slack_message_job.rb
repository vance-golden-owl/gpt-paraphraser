class SendSlackMessageJob < ApplicationJob
  queue_as :default

  def perform(channel_id, message_content)
    reply_content = Gpt::ReplyGenerator.call(message_content)
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: channel_id, text: reply_content, as_user: true)
  end
end
