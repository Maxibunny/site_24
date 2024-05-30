Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  #get 'sessions/create'
  delete 'sessions/destroy'
  #get 'sessions/destroy'
  get 'users/new'
  post 'users/create'
  #get 'users/create'
  get 'pages/exclusive'

  resources :articles do
    resources :comments
  end


  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: [:new,:create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  #delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'

  root "articles#index"

  get "up" => "rails/health#show", as: :rails_health_check

end
