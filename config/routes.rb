Rails.application.routes.draw do
  resources :weekposts 
  post "/weekposts/delete_image_attachment/:id" => "weekposts#delete_image_attachment"
  resources :siteprops
  devise_for :users

  get 'landing/index'
  root 'landing#index'
end
