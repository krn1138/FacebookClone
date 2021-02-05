Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :pictures do
    post :confirm, on: :collection
    # member do
    #   post :confirm
    # end
    # post :confirm, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
