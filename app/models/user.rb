# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :password, presence: true, length: { minimum: 5 }
end
