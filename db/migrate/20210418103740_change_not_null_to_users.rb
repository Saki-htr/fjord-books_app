# frozen_string_literal: true

class ChangeNotNullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :username, false
    change_column_null :users, :postal_code, false
    change_column_null :users, :address, false
    change_column_null :users, :description, false
  end
end
