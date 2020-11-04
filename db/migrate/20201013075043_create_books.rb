class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title,  null: false 
      t.string :author, null: false
      t.string :genre, null: false
      t.string :image
      t.date   :buyday
      t.text   :other
      t.integer :user_id 
      t.timestamps
    end
  end
end
