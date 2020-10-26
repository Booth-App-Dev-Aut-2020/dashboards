Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get("/forex", { :controller => "exchange", :action => "first_currency"})
get("/forex/:first_symbol", { :controller => "exchange", :action => "second_currency"})
get("/forex/:first_symbol/:second_symbol", { :controller => "exchange", :action => "conversion"})

end
