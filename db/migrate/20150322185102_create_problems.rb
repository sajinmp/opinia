class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :doubt
      t.integer :user_id

      t.timestamps
    end
    add_index :problems, [:user_id, :created_at]
  end
end
