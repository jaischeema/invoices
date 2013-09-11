Invoices::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy", as: :logout
  end

  get '/dashboard' => 'dashboard#index', as: :dashboard

  resources :invoices
  resources :clients
  resources :companies
end