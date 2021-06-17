# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :content
  end
  has_many :comments, dependent: :destroy
end
