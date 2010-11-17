Webdev::Application.routes.draw do

  resources :users do
    member do
      get :mailer_request
      get :mailer_update
    end
  end

  resources :user_sessions, :only => [:new, :create, :destroy]
  match 'logout' => 'user_sessions#destroy'
  match 'login' => 'user_sessions#new'

  root :to => 'users#index'
end
