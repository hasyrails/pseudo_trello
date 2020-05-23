Rails.application.routes.draw do
  root 'top#index'
  resources :users
  resources :user_sessions
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  post 'logout', to: 'user_sessions#destroy'
end
