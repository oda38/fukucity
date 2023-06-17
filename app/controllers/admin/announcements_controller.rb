class Admin::AnnouncementsController < ApplicationController
  def index
    @announcement = Announcement.new
    @announcements = Announcement.all
  end
  
  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
     flash[:notice] = "You have created book successfully."
     redirect_to admin_announcements_path
    else
     @announcements = Announcement.all
     render :index
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end
  
  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update(announcement_params)
     flash[:notice] = "You have updated book successfully." 
     redirect_to admin_announcement_path
    else
     @announcements = Announcement.all
     render :edit
    end
  end
  
  
  
  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end
  
  
end
