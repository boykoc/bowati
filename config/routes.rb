Rails.application.routes.draw do
  get ':city/map', to: 'current_wait_times#show', as: 'current_wait_time_show'
  resources :current_wait_times, only: :index
  root 'current_wait_times#index'
end
