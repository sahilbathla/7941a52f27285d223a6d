class CreateUserTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :user_topics do |t|
      t.references :user
      t.references :topic

      t.timestamps
    end
  end
end
