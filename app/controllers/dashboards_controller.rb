class DashboardsController < ApplicationController

  def new
    @user = current_user
    @shouts = current_user.timeline.page(params[:page]).per(10)

    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
  end


end
