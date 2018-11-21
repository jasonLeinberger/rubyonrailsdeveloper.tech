Rails.application.routes.draw do
  resources :siteprops
  devise_for :users
  get 'landing/index'
  root 'landing#index'
end
