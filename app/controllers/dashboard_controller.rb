class DashboardController < ApplicationController 
  def index 
  end

  def translate
    paragraph = params[:paragraph]
    from = params[:from]
    to = params[:to]

    translated_paragraph = GoogleTranslator.call(paragraph, from, to)

    respond_to do |format|
      format.turbo_stream do 
        if to == "en"
          render turbo_stream: 
            turbo_stream.replace(
              "paraphrase-form", 
              partial: "dashboard/paraphrase_form",
              locals: { label_content: "English text", paragraph: translated_paragraph }
            )
        elsif to == "vi"
          render turbo_stream: 
            turbo_stream.replace(
              "output-container", 
              partial: "dashboard/output_container",
              locals: { label_content: "Vietnamese paraphrased text", paragraph: translated_paragraph }
            )
        end
      end

      format.json { render json: { translated_paragraph: translated_paragraph } }
    end

    return
    
  end

  def paraphrase
    paragraph = params[:paragraph] 

    paraphrased_paragraph = Gpt::Paraphraser.call(paragraph)

    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: 
          turbo_stream.replace(
            "translate-en-to-vi-form", 
            partial: "dashboard/translate_en_to_vi_form",
            locals: { label_content: "English paraphrased text", paragraph: paraphrased_paragraph, from: "en", to: "vi" }
          )
      end

      format.json { render json: { paraphrased_paragraph: paraphrased_paragraph } }
    end
  end

  def chat 
    content = params[:content] 

    reply_content = Gpt::ReplyGenerator.call(content)

    
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: 
          turbo_stream.replace(
            "chat-reply-container",
            partial: "dashboard/chat_reply_container",
            locals: { label_content: "GPT AI", content: reply_content }
          )
      end

      format.json { render json: { reply_content: reply_content } }
    end
    
  end
end