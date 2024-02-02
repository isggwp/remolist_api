Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contacts, only: %i[index create destroy show update]
    end
  end

  # Error routes
  # match '/404', to: 'errors#not_found', via: :all
  # match '/500', to: 'errors#internal_server_error', via: :all

  # Reveal health status on /up
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Root path route
  root to: 'welcome#index'
end
