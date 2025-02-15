Rails.application.routes.draw do
  resources :sellers, only: [:index, :show, :create, :update, :destroy]
  resources :properties, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :destroy]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  
end
