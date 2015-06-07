class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end

    add_index :forums, :title, unique: true
  end
end
