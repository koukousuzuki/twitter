Rails.application.config.generators do |g| #ジェネレーターの設定
  g.stylesheets false #CSS関係のファイルは自動生成されない
  g.javascripts false #JS関係のファイルは自動生成されない
  g.helper false #helper関係のファイルは自動生成されない
  g.skip_routes true #Routerにルーティングが自動的に追加されることがない
end  