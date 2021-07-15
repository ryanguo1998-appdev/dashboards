Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  get("/forex", { :controller => "application", :action => "first_currency" })
  get("/forex/:pair_one", { :controller => "application", :action => "second_currency" })
  get("/forex/:pair_one/:pair_two", { :controller => "application", :action => "exchange" })
  # get(/ , { :controller => "application", :action => "nil"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
