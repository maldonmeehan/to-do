class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for signing up!"
      redirect_to lists_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end
