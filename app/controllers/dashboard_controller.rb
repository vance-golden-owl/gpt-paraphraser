class DashboardController < ApplicationController 
  def index 
  end

  def translate
    paragraph = params[:paragraph]
    from = params[:from]
    to = params[:to]

    translated_paragraph = GoogleTranslator.call(paragraph, from, to)

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

  def paraphrase
    paragraph = params[:paragraph] 

    paraphrased_paragraph = GptParaphraser.call(paragraph)

    render turbo_stream: 
      turbo_stream.replace(
        "translate-en-to-vi-form", 
        partial: "dashboard/translate_en_to_vi_form",
        locals: { label_content: "English paraphrased text", paragraph: paraphrased_paragraph, from: "en", to: "vi" }
      )
  end
end