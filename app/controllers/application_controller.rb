class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionHelper
  
  private
  
  def require_user_logged_in
    unless logged_in #unlessはifの反対でfalseの時に処理を実行する
      redirect_to login_url
    end
  end
end
