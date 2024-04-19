Rails.application.routes.draw do
  devise_for :users

  get 'checkout', to: 'checkouts#show', as: 'checkout'
  get 'checkout/success', to: 'checkouts#success'
  get 'checkout/failure', to: 'checkouts#failure'
  get 'billing', to: 'billing#show'

  get 'cart', to: 'cart#show'
  put 'cart/update', to: 'cart#update', as: 'cart_update'
  post 'cart/add', to: 'cart#create', as: 'cart_add'
  delete 'cart/remove', to: 'cart#destroy', as: 'cart_remove'
  post "webhooks" => "webhooks#stripe"

  resources :products

  root "products#index"
end
