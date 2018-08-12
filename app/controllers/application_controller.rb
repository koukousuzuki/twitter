class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in? #unlessはifの反対でfalseの時に処理を実行する
      redirect_to login_url
    end
  end
  
  def counts(user) #投稿の数をカウントさせる
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count #フォロー数をカウント
    @count_follower = user.followers.count #フォロワー数をカウント
  end
end
