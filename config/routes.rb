Rails.application.routes.draw do

  devise_for :users
resources :users, only: [:update]

resources :topics do
  resources :posts, except: [:index] do
    resources :summaries, except: [:index]
  end
end

resources :posts, only: [:index] do
  
end


get 'about' => 'welcome#about'

root to: 'welcome#index'
end
