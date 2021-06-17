# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :report
  belongs_to :book
end
