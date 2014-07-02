class SearchesController < ApplicationController
  def show
    @users = User.where("name like ?", "%#{params[:name]}%")
    # @search = @search.page(params[:page]).per(5)
  end
end
    