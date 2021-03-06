Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: %i[index new create update edit destroy show] do
    member do
      post :join
      post :quit
    end
    resources :posts, only: %i[new create update edit destroy]
  end

  namespace :account do
    resources :groups, only: %i[index]
    resources :posts, only: %i[index edit destroy update]
  end
end
