Rails.application.routes.draw do
  devise_for :users
  
  resources :registered_applications, only: [:index, :create, :show, :destroy, :new]

  namespace :api, defaults: { format: :json } do
    match 'create_event', to: 'events#create', via: [:options]
    resources :events, only: [:create]
  end

  root to: "welcome#index"
end
