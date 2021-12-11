# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :body
      t.belongs_to :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
