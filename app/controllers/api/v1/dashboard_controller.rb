module Api 
  module V1 
    class DashboardController < ApplicationController
      def translate 
        paragraph = params[:paragraph]
        from = params[:from]
        to = params[:to]

        translated_paragraph = GoogleTranslator.call(paragraph, from, to)

        render json: { content: translated_paragraph }, status: :ok 
      end

      def paraphrase
        paragraph = params[:paragraph] 
        paraphrased_paragraph = Gpt::Paraphraser.call(paragraph)

        render json: { content: paraphrased_paragraph }, status: :ok
      end
    
      def chat 
        content = params[:content] 
        reply_content = Gpt::ReplyGenerator.call(content)
        
        render json: { content: reply_content }, status: :ok
      end
    end
  end
end