class Public::HomesController < ApplicationController
  def top
    @announcements = Announcement.first(3)
  end
  
  def announcements
    @announcements = Announcement.page(params[:page]).per(3)
  end
  
end
