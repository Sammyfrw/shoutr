class CreateFollowingRelationship < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower, null: false, index: true
      t.belongs_to :followed_user, null: false, index: true

      t.timestamps
    end
    add_index :following_relationships, [:follower_id, :followed_user_id], unique: true, name: 'following_relationships_index_unique_constraint'
  end
end
