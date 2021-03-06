class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      # redirect_to new_user_url, status: :unprocessable_entity
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash[:errors] = ["THIS USER DOESN'T EVEN EXIST"]
      redirect_to new_user_url, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
