Rails.application.routes.draw do
  devise_for :users
  
  resources :registered_applications, only: [:index, :create, :show, :destroy]

  root to: "welcome#index"
end
