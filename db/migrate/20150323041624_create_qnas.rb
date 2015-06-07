class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.string :ques
      t.string :mail

      t.timestamps null: false
    end
  end
end
