class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.belongs_to :user
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :target_date
      t.status :status
      
      t.timestamps
     end
   end   
end

