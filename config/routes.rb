Rails.application.routes.draw do
  root to: 'toppages#index' #トップページはrootによって設定される。 ToppagesControllerとindexアクション、toppages/index.html.erbが必要
end
