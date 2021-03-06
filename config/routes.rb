Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/about', to: 'about#index'
  get 'sign_up', to: 'registeration#new'
  post 'sign_up', to: 'registeration#create'

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'


  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/update', to: 'password_resets#update'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  root to: "main#index"
end
