Rails.application.routes.draw do
  resources :categories
  resources :types
  resources :bookmarks
  get 'home/index'
  root 'home#index'

  post 'categories/:id/change', to: 'categories#change', as: 'change'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
