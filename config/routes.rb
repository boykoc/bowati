Rails.application.routes.draw do
  resources :current_wait_times, only: :index
  root 'current_wait_times#index'
end
