Rails.application.routes.draw do
  resources :home, only:[:index]
  devise_for :users
  resource :cart
  resources :charges, only:[:create]
  resources :users, only: [:show]
  resources :products do
    resources :comments, except:[:index,:show,:new]
  end
  root to: 'home#index'
end
