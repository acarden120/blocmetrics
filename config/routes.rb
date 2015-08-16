Rails.application.routes.draw do
  devise_for :users
  
  resources :registered_applications, only: [:index, :create, :show, :destroy, :new]

  root to: "welcome#index"
end
