class CreateUserFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_followings do |t|
      t.references :follower, index: true, foreign_key: { to_table: :users }
      t.references :following, index: true, foreign_key: { to_table: :users }
      t.index [:follower_id, :following_id], unique: true

      t.timestamps
    end
  end
end
