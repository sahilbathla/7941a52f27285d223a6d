class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.string :description

      t.timestamps
    end
  end
end
