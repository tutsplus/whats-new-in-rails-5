Rails.application.routes.draw do
  devise_for :users
  resources :tasks, only: [ :update ]
  resources :projects do
    get :nothing, on: :collection #/projects/nothing
    resources :tasks do
      resources :comments, only: [ :create ]
    end
  end

  match "/websocket", :to => ActionCable.server, via: [:get, :post]

  root "projects#index"
end
