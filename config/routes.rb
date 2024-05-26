Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments
  end

  resources :users

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  get "up" => "rails/health#show", as: :rails_health_check

  root "articles#index"
end