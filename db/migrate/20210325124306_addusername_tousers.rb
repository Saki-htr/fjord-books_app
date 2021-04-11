# frozen_string_literal: true

class AddusernameTousers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
  end
end
