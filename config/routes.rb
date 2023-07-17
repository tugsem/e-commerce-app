Rails.application.routes.draw do
  devise_for :users

  get 'cart', to: 'cart#show'
  put 'cart/update', to: 'cart#update', as: 'cart_update'
  post 'cart/add', to: 'cart#create', as: 'cart_add'
  delete 'cart/remove', to: 'cart#destroy', as: 'cart_remove'

  resources :products

  root "products#index"
end
