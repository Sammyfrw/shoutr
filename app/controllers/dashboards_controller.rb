class DashboardsController < ApplicationController

  def new
    @user = current_user
    @shouts = Shout.where(user_id: @user.followed_users + [current_user]).order("created_at DESC")

    @subject = TextSubject.new
  end


end
