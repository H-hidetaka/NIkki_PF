Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessinos#create'
  delete 'logout', to: 'user_sessinos#destroy'

  resources :users, only: %i[new create]
end
