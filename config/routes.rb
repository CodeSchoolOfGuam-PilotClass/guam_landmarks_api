# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :landmarks, only: [:index, :show, :create, :update, :destroy] do
        resources :reviews, only: [:create]
      end
    end
  end
end
