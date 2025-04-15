# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :landmarks, only: [:index, :show, :create, :update, :destroy] do
        resources :reviews, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
