class ChangeNotnullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :postal_code, :integer, null: false
    change_column_null :users, :address, :text, null: false
    change_column_null :users, :description, :text, null: false
  end
end
