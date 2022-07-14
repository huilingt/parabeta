Rails.application.routes.draw do
  # devise_for :users
  root to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :favourites, only: [:index]
  end

  resources :categories do
    resources :facilities, only: [:show]
  end

  resources :facilities do
    resources :reviews, only: %i[new create show]
    collection do
      get :search
    end
  end

  resources :reviews, only: [ :new, :create, :show ] do
    resources :comments, only: [ :create, :show, :edit ]
  end

  resources :channels, only: [ :create, :show ] do
    resources :messages, only: [ :create ]
  end

  get "/community", to: "channels#community"

end
