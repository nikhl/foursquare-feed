FoursquareFeed::Application.routes.draw do
  resources :posts

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  root :to => 'posts#index'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/signout', :to => 'sessions#destroy'
end
