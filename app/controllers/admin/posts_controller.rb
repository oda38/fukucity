class Admin::PostsController < ApplicationController
  def index
    @posts = Post.where(is_draft: :false).page(params[:page]).per(10)
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path
    else
      render 'show'
    end
  end
end
