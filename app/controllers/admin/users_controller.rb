class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  
  def index
    @user = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: !@user.is_deleted) #!をつけて、true/falseを反転
     if @user.is_deleted
      flash[:notice] = "退会処理を実行しました。"
     else
      flash[:notice] = "有効にしました。"
     end
    redirect_to admin_users_path
  end
  

  
  
end
