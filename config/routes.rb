Invoices::Application.routes.draw do
  root 'sessions#new'

  controller :sessions do
    get "login", :action => :new, :as => :show_login
    post "login", :action => :create, :as => :do_login
    delete "logout", :action => :destroy, :as => :logout
  end

  resources :invoices

  resources :clients

  resources :companies

  resources :users
  controller :users do
    get "sign_up", :action => :sign_up, :as => :sign_up
    post "sign_up", :action => :public_create, :as => :public_user_create
  end
end