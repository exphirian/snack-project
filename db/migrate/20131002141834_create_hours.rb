class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
    	t.time :hour
    	t.integer :user_id
      t.timestamps
    end
  end
end
