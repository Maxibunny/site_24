Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  get 'users/new'
  post 'users/create'
  get 'pages/exclusive'

  resources :articles do
    resources :comments
  end

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: [:new,:create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'my_articles', to: 'articles#my_articles'

  root "articles#index"


  get "up" => "rails/health#show", as: :rails_health_check

end
