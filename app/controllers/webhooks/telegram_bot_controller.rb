module Webhooks
  class TelegramBotController < Telegram::Bot::UpdatesController
    include Telegram::Bot::UpdatesController::MessageContext

    def start!(*)
      respond_with :message, text: "Hello, I am the GPT assistant, what can I do for you?"
    end

    def help!(*)
      respond_with :message, text: %Q(
        List of GPT Chatbot commands:
        - /gpt_en_chat: Chat with GPT AI using English.
        - /gpt_vi_chat: Chat with GPT AI using Vietnamese.
        - /gpt_en_paraphrase: Paraphrase English text.
        - /gpt_vi_paraphrase: Paraphrase Vietnamese text.
      )
    end

    def gpt_en_chat!(*)
      message_content = payload["text"].sub("/gpt_en_chat ", "")
      reply_content = Gpt::ReplyGenerator.call(message_content)
      reply_with :message, text: reply_content
    end

    def gpt_vi_chat!(*)
      message_content = payload["text"].sub("/gpt_vi_chat ", "")
      en_content = GoogleTranslator.call(message_content, "vi", "en")
      en_reply = Gpt::ReplyGenerator.call(en_content)
      vi_reply = GoogleTranslator.call(en_reply, "en", "vi")
      reply_with :message, text: vi_reply
    end

    def gpt_en_paraphrase!(*)
      message_content = payload["text"].sub("/gpt_paraphrase_en ", "")
      reply_content = Gpt::Paraphraser.call(message_content)
      reply_with :message, text: reply_content
    end

    def gpt_vi_paraphrase!(*)
      message_content = payload["text"].sub("/gpt_paraphrase_vi ", "")
      en_content = GoogleTranslator.call(message_content, "vi", "en")
      en_reply = Gpt::Paraphraser.call(en_content)
      vi_reply = GoogleTranslator.call(en_reply, "en", "vi")
      reply_with :message, text: vi_reply
    end

    def message(message_payload); end

    def action_missing(action, *_args)
      if action_type == :command
        reply_with :message, text: "I don't know what the action /#{action_options[:command]} suppose to do, please try to use commands in /help so that I can help you better"
      end
    end
  end
end