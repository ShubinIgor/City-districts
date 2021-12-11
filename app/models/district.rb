# frozen_string_literal: true

class District < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
