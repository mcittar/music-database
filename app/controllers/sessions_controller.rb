class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
    )

    if @user
      login!(@user)
      render json: "Logged In"
    else
      # redirect_to new_session_url
      render json: "Failed to log in"
    end

  end

  def destroy
    current_user.reset_session_token! if current_user

    session[:session_token] = nil
    redirect_to new_session_url
  end

end
