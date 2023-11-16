Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "lists#index"
  resources :lists do
    member do
      get :bookmarks
    end
    resources :bookmarks, only: [:new]
  end
  resources :bookmarks, only: [:destroy, :create]
  post '/lists/:list_id/bookmarks', to: 'bookmarks#create'
  # get '/lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new'
  # get 'lists/:id/edit', to: 'lists#edit'
  # get 'lists/:id', to: 'lists#show'
  # patch 'lists/:id', to: 'lists#update'
  # delete 'lists/:id', to: 'lists#destroy'
  # get '/bookmarks', to: 'bookmarks#index'
  # post 'bookmarks', to: 'bookmarks#create'
  # get '/lists/:list_id/bookmarks', to: 'bookmarks#new'
  # get 'bookmarks/:id/edit', to: 'bookmarks#edit'
  # get 'bookmarks/:id', to: 'bookmarks#show'
  # patch 'bookmarks/:id', to: 'bookmarks#update'
  # delete 'bookmarks/:id', to: 'bookmarks#destroy'

  # Defines the root path route ("/")
  # root "posts#index"
end
