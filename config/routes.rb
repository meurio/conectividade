Rails.application.routes.draw do
  resources :messages, only: [:index, :create]
  resources :users, only: [:create]
  root 'messages#index'
end
