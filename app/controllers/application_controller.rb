class ApplicationController < ActionController::Base
  def all_currencies
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    symbol_hash = parsed_data.fetch("symbols")

    @currency_codes = []

    symbol_hash.each do |key, value|
      @currency_codes.push(key)
    end

    render("conversion_templates/currency_pairs.html.erb")
  end

  def homepage
    render("conversion_templates/dashboards.html.erb")
  end
end
