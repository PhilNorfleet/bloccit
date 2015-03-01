Rails.application.routes.draw do

  devise_for :users
  resources :topics do
    resources :posts, except: [:index] do
      collection do
        get 'summaries'
      end
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
