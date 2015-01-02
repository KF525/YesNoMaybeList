class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.permanent[:auth_token] = @user.auth_token
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @new_list = Relationship.new
    @user_lists = Relationship.belonging_to_user(current_user)
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
