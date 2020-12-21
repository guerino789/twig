class CreateSticks < ActiveRecord::Migration[6.0]
  def change
    create_table :sticks do |t|
      t.string :brand
      t.string :model 
      t.string :size
      t.integer :flex 
      t.integer :user_id

      t.timestamps
    end
  end
end
