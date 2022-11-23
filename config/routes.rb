Rails.application.routes.draw do
  root "users#log_in"

  resources :namings 
  resources :profiles 

  post "/save", to: "namings#save"
  get "/register", to: "users#register"
  post "/register_save", to: "users#register_save"
  get "/log_in_check", to: "users#log_in_check"
end
