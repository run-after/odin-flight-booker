Rails.application.routes.draw do
  resources :bookings, only:[:new, :create, :show]
  resources :flights, only:[:new, :index]
  root 'flights#index'
end
