class UsersController < ApplicationController

  def show
    unless current_user && current_user.id == params[:id].to_i
      redirect_to :root, :error => 'Cannot view other users\' events'
    end
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      self.current_user = @user
      auto_login(@user)
      redirect_to root_path, :notice => "Welcome #{@user.name}!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end