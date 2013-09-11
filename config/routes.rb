Invoices::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy", as: :logout
  end

  # show the invoices page as first page
  get '/invoices' => 'invoices#index', as: :dashboard

  resources :users
  resources :invoices
  resources :clients
  resources :companies
end