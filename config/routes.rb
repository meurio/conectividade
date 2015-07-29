Rails.application.routes.draw do
  resources :messages, only: [:index, :create]
  resources :users, only: [:create]

  get 'soon' => 'messages#soon'

  root 'messages#index'
end
