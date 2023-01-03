class GoogleTranslator < ApplicationService
  def initialize(paragraph, from, to)
    @paragraph = paragraph
    @from = from
    @to = to
  end

  def call
    translate = Google::Cloud::Translate::V2.new(
      project_id: ENV['GOOGLE_TRANSLATOR_PROJECT_ID'],
      credentials: ENV['GOOGLE_TRANSLATOR_CREDENTIALS']
    )

    translation = translate.translate @paragraph, from: @from, to: @to, format: 'text'
    translation.text
  end
end
