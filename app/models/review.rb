# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :district

  validates :name, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }

  def datatime_created
    created_at.strftime('%d-%B-%Y %H:%M')
  end
end
