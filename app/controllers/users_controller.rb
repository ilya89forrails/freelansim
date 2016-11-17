class UsersController < ApplicationController

  def index
    @users = User.search(params[:search]).page(params[:page]).per_page(10)
  end


  def show
    @user = User.find(params[:id])
  end


  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end


 private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:description, :money, :city, :birthday, :tag_list)
  end

end
