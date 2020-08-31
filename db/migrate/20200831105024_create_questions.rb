class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :description
      t.references :user
      t.references :topic

      t.timestamps
    end
  end
end
