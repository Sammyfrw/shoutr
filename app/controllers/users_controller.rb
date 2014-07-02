class UsersController < ApplicationController
  skip_before_action :require_login, only: [:show, :new, :create]

  def show
    @user = User.find_by name: (params[:name])
    @shouts = @user.shouts.page(params[:page]).per(10)

    # @shouts = Shout.where(user_id: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end

