class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
        redirect_to user_path(user.id)
    else
      redirect_to root_path, notice: "Whoops. Unable to find your account. Please try again."
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

end
