class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: "Рады снова Вас видеть, #{name_or_email(@user)}!" }
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id if registered_in_user?
    redirect_to root_path
  end
end
