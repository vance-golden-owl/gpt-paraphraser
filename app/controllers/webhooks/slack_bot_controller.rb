module Webhooks
  class SlackBotController < ApplicationController
    def gpt_en_chat 
      if params[:challenge] 
        render json: { challenge: params[:challenge] }, status: 200
        return
      end

      channel_id = params[:event][:channel]
      message_content = params[:event][:text].split(' ')[1..-1].join(' ')

      SendSlackMessageJob.perform_later(channel_id, message_content)
    end
  end
end