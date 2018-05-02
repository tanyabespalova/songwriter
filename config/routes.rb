Rails.application.routes.draw do

  get 'persons/profile'
  devise_for :users
  namespace :admin do
    root 'welcome#index'
    resources :artists
    resources :songs
    resources :genres
    resources :albums
  end

  resources :artists do
    resources :comments
  end
  resources :songs do
    resources :comments
  end
  resources :genres do
    resources :comments
  end
  resources :albums do
    resources :comments
  end
  root 'welcome#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
