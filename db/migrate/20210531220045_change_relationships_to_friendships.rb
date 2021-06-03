class ChangeRelationshipsToFriendships < ActiveRecord::Migration[6.1]
  def change
    rename_table :relationships, :friendships
  end
end
