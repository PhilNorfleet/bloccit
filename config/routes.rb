Rails.application.routes.draw do


  devise_for :users
  resources :users, only: [:update]
  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'topics' => 'topics#show'
  root to: 'welcome#index'
end
