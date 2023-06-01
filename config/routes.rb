Rails.application.routes.draw do
  get 'cart', to: 'cart#show'
  post 'cart/add', to: 'cart#add', as: 'cart_add'
  delete 'cart/remove', to: 'cart#remove', as: 'cart_remove'

  resources :products
  # resources :users
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
