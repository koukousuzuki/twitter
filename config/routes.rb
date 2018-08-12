Rails.application.routes.draw do
  root to: 'toppages#index' #トップページはrootによって設定される。 ToppagesControllerとindexアクション、toppages/index.html.erbが必要
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only:[:index, :show, :new, :create] do  #必要なアクションだけ指定
    member do #フォロー中のユーザとフォローされているユーザ一覧を表示する
      get :followings
      get :followers
    end
  end
  resources :microposts, only:[:create, :destroy]
  resources :relationships, only:[:create, :destroy] #ユーザをフォロー/アンフォローできるようにする
end
