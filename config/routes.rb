Rails.application.routes.draw do

  devise_for :users
  resources :questions

  resources :advertisements

  resources :posts
  resources :topics

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
