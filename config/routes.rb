Auth::Application.routes.draw do
  get "welcome/index"

  #get "sessions/new"
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "todos_new"=>"todos#new", :as=> "todos_new"
  post "todos_create" => "todos#create", :as=> "todos_create"
  root :to => "welcome#index"
  get "users_new" => "users#new", :as => "users_new"
  post "users" => "users#create", :as => "users"
  get "about_us" => "welcome#about_us", :as => "about_us"
  get "contact_us" => "welcome#contact_us", :as => "contact_us"
  post "welcome/sendmail"  =>  "welcome#sendmail"
  get "reset_password" => "users#reset_password", :as => "reset_password"
  post "send_mail_forget_password" => "users#send_mail_forget_password", :as => "send_mail_forget_password"
  # get "change_password" => "users#change_password", :as => "change_password"
    #resources :users
  resources :sessions
  resources :todos
  resources :users do
    member do
      get "change_password"
      post "update_password" => "users#update_password", :as => "update_password"
      
    end
  end
end
  
 
