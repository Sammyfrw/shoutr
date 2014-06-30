class DashboardsController < ApplicationController

  def new
    @user = current_user
    @shout = Shout.new
  end


end
