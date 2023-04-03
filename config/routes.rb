Rails.application.routes.draw do
  resources :organizations
  resources :users

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/current_organization", to: "organizations#show"
  get "/current_user", to: "users#show"
end
