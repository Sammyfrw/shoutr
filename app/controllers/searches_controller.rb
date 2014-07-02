class SearchesController < ApplicationController
  def show
    @users = User.query(params[:name])
    # @search = @search.page(params[:page]).per(5)
  end
end
    