Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  get("/forex", { :controller => "application", :action => "all_currencies" })
  get("/forex/:first_currency", { :controller => "application", :action => "all_currencies" })
  get("/forex/:first_currency/:second_currency", { :controller => "application", :action => "all_currencies" })
  # get(/ , { :controller => "application", :action => "nil"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
