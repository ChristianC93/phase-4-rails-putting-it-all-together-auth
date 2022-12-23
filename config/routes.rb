Rails.application.routes.draw do
  post '/signup', to: 'user#create'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/me', to: 'user#show'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'
end
