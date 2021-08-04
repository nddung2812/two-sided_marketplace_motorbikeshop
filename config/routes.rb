Rails.application.routes.draw do
  get 'payments/success', to: 'payments#success'
  get 'item/page'
  resources :posts
  devise_for :users
  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
