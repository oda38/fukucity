class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "ユーザー名"
      @users = User.looks(params[:search], params[:keyword]).where(is_deleted: false)
    else
      @posts = Post.looks(params[:search], params[:keyword]).where(is_draft: false)#改行
                  .joins(:user).merge(User.where(is_deleted: false))
    end
  end
  
end
