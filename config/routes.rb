Rails.application.routes.draw do

  devise_for :users
  # FrontEnd Routes
  root to: 'homes#index'

  # API Routes
  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :create, :update, :destroy] do
        member do
          put :activator
        end
      end
      resources :sessions, only: [:create, :destroy] do
        collection do
          get :validate
        end
      end
      resources :boards, only: [:index, :create] do
        collection do
          get :search
        end
      end
    end
  end

  get '*path', to: 'homes#index'
end
