Rails.application.routes.draw do
  resources :categories
  resources :types
  resources :bookmarks
  root 'bookmarks#index'

  post 'categories/:id/change', to: 'categories#change', as: 'change'
  get '/api/categories/:id', to: 'categories#api', as: 'api'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
