class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "ユーザー名"
      @users = User.looks(params[:search], params[:keyword])
    else
      @posts = Post.looks(params[:search], params[:keyword])
    end
  end
  
end
