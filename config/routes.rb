Rails.application.routes.draw do
  
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get "/user/:id/sticks" => 'users#sticks', as: "user_sticks"
    get "/user/:id/sticks/:id" => 'users#stick', as: "user_stick"
    get "/user/:id" => 'users#show', as: "user"
  end

  #get "/sticks/:id" => 'sticks#show', as: "stick"

  root to: "home#index"
  
  resources :sticks do 
    resources :reviews
  end

  

=begin   resources :reviews do 
    resources :sticks
  end 
=end

end