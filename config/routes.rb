Rails.application.routes.draw do
  
  resources :sellers, only: [:index, :show]
  resources :properties, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :destroy]
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
