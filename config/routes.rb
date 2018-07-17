Rails.application.routes.draw do
  resources :reviews
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/auth/kakao', to: 'users/omniauth_callbacks#kakao'
    get '/users/auth/kakao/callback', to: 'users/omniauth_callbacks#kakao_auth'
  end
  
  root 'restaurants#index'
  
  resources :reviews
  
  post '/uploads' => 'reviews#upload_image'
  get 'likes/:restaurant_id' => 'reviews#like_review'
  
  resources :restaurants do
    member do
    
    end
    
    collection do
    
      get '/search_restaurant' => 'restaurants#search_restaurant'
    end
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
