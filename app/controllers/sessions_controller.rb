class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['INCORRECT PASSWORD OR USERNAME']
      render :new
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end

  private


end
