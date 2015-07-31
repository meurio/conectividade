Rails.application.routes.draw do
  resources :messages, only: [:index, :create]
  resources :users, only: [:create]

  get 'soon' => 'messages#soon'
  get 'close_window' => 'messages#close_window', as: :close_window

  if Rails.env.production? && !ENV["LIVE"]
    root 'messages#soon'
  else
    root 'messages#index'
  end
end
