class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.boolean :completed, null: false, default: false
      t.boolean :public, null: false, default: false
      t.timestamps
      t.index :user_id
    end
  end
end
