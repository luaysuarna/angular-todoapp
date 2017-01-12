Rails.application.routes.draw do

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
    end
  end

  get '*path', to: 'homes#index'
end
