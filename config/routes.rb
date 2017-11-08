require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  resources :future_tickers

   # sidekiq网页客服端
  mount Sidekiq::Web => '/admin/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
