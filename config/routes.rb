Rails.application.routes.draw do
  
#ユーザー側  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #ゲストログイン 
  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end  
  
  #退会確認画面
  get '/users/:id/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  #論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'public/users#withdrawal', as: 'withdrawal'
  
  
  root to: 'public/homes#top'
  get '/announcements' => 'public/homes#announcements'
  scope module: :public do
    resources :users, only:[:index, :show, :edit, :update] do
      resources :posts, only:[:index]
      member do
        get :confirm
        get :favorites
      end
    end
    
    resources :posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
       resources :comments, only: [:create]
       resource :favorites, only: [:create, :destroy]
    end
    
    get "search" => "searches#search"
    get "search_tag"=>"posts#search_tag"
  end
  

  
#管理者側  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"
    
    resources :users, only:[:index, :show]
    resources :announcements, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :posts, only:[:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
  end
  
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

