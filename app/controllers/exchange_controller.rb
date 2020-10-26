class ExchangeController < ActionController::Base

def first_currency
  url="https://api.exchangerate.host/symbols"
  raw_data = open(url).read
  parsed_data = JSON.parse(raw_data)
  symbols_hash = parsed_data.fetch("symbols")
  @array_symbols = symbols_hash.keys
  render({ :template => "currency_templates/step_one.html.erb"})
end


end
