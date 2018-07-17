class CreateVisiteds < ActiveRecord::Migration[5.0]
  def change
    create_table :visiteds do |t|
      t.integer :user_id
      t.integer :restaurant_id
      
      t.timestamps
    end
  end
end
