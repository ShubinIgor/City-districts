class ApplicationController < ActionController::Base
  # Возвращает имя пользователя, если его нет, то емайл
  def name_or_email(user)
    return user.name if user.name.present?

    user.email.split('@')[0]
  end

  # АУТЕНТИФИКАЦИЯ:
  def current_user
    @current_user ||= User.find(session[:user_id]).decorate if session[:user_id].present?
  end

  def registered_in_user?
    current_user.present?
  end

  helper_method :current_user, :registered_in_user?
end
