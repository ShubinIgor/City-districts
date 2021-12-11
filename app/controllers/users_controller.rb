class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{name_or_email(@user)}!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.new
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update params.permit(:name, :email, :password, :password_confirmation)
      flash[:success] = 'Данные обновлены!'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
