class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      # redirect_to session_url
    else
      redirect_to new_user_url
    end

  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end

end
