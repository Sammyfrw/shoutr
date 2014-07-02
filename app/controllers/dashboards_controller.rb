class DashboardsController < ApplicationController

  def new
    @user = current_user
    @shouts = current_user.timeline

    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
  end


end
