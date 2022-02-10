Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # get 'logout', to: 'user_sessions#destroy'
  post 'diaries/new', to: 'diaries#create'

  resources :users, only: %i[new create destroy]
  resources :diaries, only: %i[index new create]
end
