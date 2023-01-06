module DisplayHelper
  DASH_MASK = '--'.freeze

  def display_text(value)
    value.presence || DASH_MASK
  end

  def display_date(date)
    date&.strftime('%d-%m-%Y') || DASH_MASK
  end
end
