Invoices::Application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :invoices
  resources :clients
  resources :companies
end