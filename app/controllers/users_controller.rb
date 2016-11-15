class UsersController < ApplicationController

  def index
    @users = User.search(params[:search]).page(params[:page]).per_page(10)
  end

  def show
    @user = User.find(params[:id])
  end

end
