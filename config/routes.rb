Webdev::Application.routes.draw do

  resources :users

  resources :user_sessions
  match 'logout' => 'user_sessions#destroy'

  root :to => 'users#index'
end
