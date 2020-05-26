class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create] 

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      flash[:notice] = 'ログインしました'
      redirect_to root_path
    else
      flash.now[:danger] = 'ログインできませんでした'
      render 'user_sessions/new'
    end
  end
  
  def destroy
    logout
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
end
