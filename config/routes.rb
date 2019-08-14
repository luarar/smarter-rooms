Rails.application.routes.draw do
  resources :bookings
  resources :goods
  resources :rooms
  resources :buildings

  get '/signup', to: 'users#new'
  resources :users

  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/statics', to: 'static_pages#statics'

end
