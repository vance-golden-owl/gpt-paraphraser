module Gpt
  class ReplyGenerator < ApplicationService
    def initialize(content)
      @content = content
    end

    def call
      client = OpenAI::Client.new
      response = client.completions(
        parameters: {
          model: 'text-davinci-003',
          prompt: @content,
          max_tokens: 4000
        }
      )

      response.dig('choices', 0, 'text')
    end
  end
end
