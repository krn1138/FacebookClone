Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :pictures do
    post :confirm, on: :collection
  end
  root 'pictures#index'
end
