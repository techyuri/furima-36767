Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buyers, only: [:index, :create, :show, :edit, :update]
  end
end