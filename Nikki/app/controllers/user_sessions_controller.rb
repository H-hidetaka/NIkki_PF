class UserSessionsController < ApplicationController

  def new; end

  def create
    # ユーザー作成・・・データベースから値を取得する。
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
