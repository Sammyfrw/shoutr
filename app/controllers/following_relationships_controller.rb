class FollowingRelationshipsController < ApplicationController
  def create
    @user = User.find_by! name: (params[:user_id])
    current_user.follow(@user)
    redirect_to root_path
  end

  def destroy
    @user = User.find_by! name: (params[:user_id])
    current_user.unfollow(@user)
    redirect_to root_path
  end

end