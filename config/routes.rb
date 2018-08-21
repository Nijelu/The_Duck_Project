Rails.application.routes.draw do
  resources :ducks do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show]

  get '/dashboard', to: 'users#show', as: 'dashboard'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

