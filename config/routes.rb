Rails.application.routes.draw do
  devise_for :users

  root to: "tops#index"
  resources :users, only: [:show, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end
end
