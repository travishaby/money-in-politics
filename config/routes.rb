Rails.application.routes.draw do

  get 'static_pages/welcome'

  root to: "static_pages#welcome"
  get "/welcome", to: "static_pages#welcome"

end
