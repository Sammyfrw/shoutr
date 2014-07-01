class FollowersController < ApplicationController
  def show
    @users = current_user.followers
  end
end
