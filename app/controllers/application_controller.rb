class ApplicationController < ActionController::Base
  def homepage
    render("conversion_templates/dashboards.html.erb")
  end

  def first_currency
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

  def second_currency
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    symbol_hash = parsed_data.fetch("symbols")

    @currency_codes = []

    symbol_hash.each do |key, value|
      @currency_codes.push(key)
    end

    @first_currency = params.fetch(:pair_one)

    render("conversion_templates/convert.html.erb")
  end
  
  def exchange
    @first_currency = params.fetch(:pair_one)
    @second_currency = params.fetch(:pair_two)

    url = "https://api.exchangerate.host/convert?from=" + @first_currency + "&to=" + @second_currency
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @conversion_rate = parsed_data.fetch("info").fetch("rate")

    render("conversion_templates/convert_to.html.erb")
  end
end
