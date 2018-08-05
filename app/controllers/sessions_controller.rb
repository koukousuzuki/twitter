class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    email = params[:session][:email].downcase #フォームデータのemailを小文字化して取得
    password = params[:session][:password] #フォームデータのpasswordを小文字化して取得
    if login(email, password)
      flash[:success] = "ログインに成功しました。"
      redirect_to @user
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'new'
    end
  
  end
  
  def destory
    session[:user_id] = nil
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password) #emailとpasswordの組み合わせが間違っていた場合はログインできない仕様になっている
      session[:user_id] = @user.id #ブラウザにはCookieとして、サーバにはSessionとして、ログイン状態が維持される
      return true 
    else
      return false
    end
  end
end
