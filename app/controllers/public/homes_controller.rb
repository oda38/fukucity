class Public::HomesController < ApplicationController
  def top
    @announcements = Announcement.all
  end
end
