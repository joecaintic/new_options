Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

resources :posts, :advertisements

  get 'about' => 'welcome#about'

root to: 'welcome#index'
end
