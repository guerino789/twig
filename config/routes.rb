Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"
  resources :sticks do 
    resources :reviews
  end

  resources :users do 
    resources :sticks
  end

  resources :reviews do 
    resources :sticks
  end

end
