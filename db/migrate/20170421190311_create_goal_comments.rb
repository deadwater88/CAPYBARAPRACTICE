class CreateGoalComments < ActiveRecord::Migration[5.0]
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id, null: false
      t.integer :author_id, null: false
      t.text :body, null: false
      t.index :goal_id
      t.index :author_id
      t.timestamps
    end
  end
end
