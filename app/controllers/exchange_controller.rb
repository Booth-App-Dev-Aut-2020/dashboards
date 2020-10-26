class ExchangeController < ActionController::Base

def first_currency
  url="https://api.exchangerate.host/symbols"
  raw_data = open(url).read
  parsed_data = JSON.parse(raw_data)
  symbols_hash = parsed_data.fetch("symbols")
  @array_symbols = symbols_hash.keys
  render({ :template => "currency_templates/step_one.html.erb"})
end

def second_currency
  @first_currency = params.fetch("first_symbol")
  url="https://api.exchangerate.host/symbols"
  raw_data = open(url).read
  parsed_data = JSON.parse(raw_data)
  symbols_hash = parsed_data.fetch("symbols")
  @array_symbols = symbols_hash.keys
  render({ :template => "currency_templates/step_two.html.erb"})
end

def conversion
  @first_currency = params.fetch("first_symbol")
  @second_currency = params.fetch("second_symbol")
  url="https://api.exchangerate.host/convert?from=" + @first_currency + "&to=" + @second_currency
  raw_data = open(url).read
  parsed_data = JSON.parse(raw_data)
  @rate = parsed_data.dig("info", "rate")
  render({ :template => "currency_templates/exchange.html.erb"})
end

end
