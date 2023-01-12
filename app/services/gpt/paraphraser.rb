module Gpt
  class Paraphraser < ApplicationService
    def initialize(paragraph)
      @paragraph = paragraph
    end

    def call
      client = OpenAI::Client.new
      response = client.completions(
        parameters: {
          model: 'text-davinci-003',
          prompt: %(
            Rewrite the content with a different grammar structure
            Content: My name is Vance.
            Rewrited content: I am Vance.
            Content: He is tall.
            Rewrite content: short is not his characteristic.
            Content: #{@paragraph}
            Rewrite content:
          ),
          max_tokens: 4000
        }
      )

      response.dig('choices', 0, 'text')
    end
  end
end
