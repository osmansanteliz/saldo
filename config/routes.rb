Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new, :create]

  resources :purchases, only: [:new, :create]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
