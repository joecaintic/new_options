Rails.application.routes.draw do
  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/index'

  get 'welcome/contact'

  get 'contact/contact'

  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

root to: 'welcome#index'
end
