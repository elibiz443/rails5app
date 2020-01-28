Rails.application.routes.draw do
  # resources :mainpages

  root to: 'mainpages#index'

  get '/search' => 'mainpages#search'
  get '/show' => 'mainpages#show'
end
