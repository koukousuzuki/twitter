Rails.application.routes.draw do
  root to: 'toppages#index' #トップページはrootによって設定される。 ToppagesControllerとindexアクション、toppages/index.html.erbが必要
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destory'
  
  get 'signup', to: 'users#new'
  resources :users, only:[:index, :show, :new, :create] #必要なアクションだけ指定
  
  resources :microposts, only:[:create, :destory]
end
