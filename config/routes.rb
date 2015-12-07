Rails.application.routes.draw do
  devise_for :users
  resources :tasks, only: [ :update ]
  resources :projects do
    resources :tasks do
      resources :comments, only: [ :create ]
    end
  end

  root "projects#index"
end
