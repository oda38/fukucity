class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
   
  def destroy
    @comment = Comment.find_by(id: params[:id],post_id: params[:post_id])
    @comment.destroy
    redirect_to admin_post_path(params[:post_id])
  end
  
end
