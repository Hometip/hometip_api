Rails.application.routes.draw do
  namespace :v1, defaults: {format: :json} do
    resources :users
    resources :sessions, only: [:create, :destroy, :show]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
