Rails.application.routes.draw do

  root to: 'recipes#index'
  resources :recipes do
    resources :comments
  end

  get 'users/signup', to: 'users#new'
  resources :users, except: :new

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
