# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def email_or_name
    return name if name.present?

    email.split('@')[0]
  end
end
