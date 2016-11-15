Rails.application.routes.draw do
	root "projects#index"

  devise_for :users


  resources :projects do
  	resources :comments
  end

resources :users
resources :services
resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
