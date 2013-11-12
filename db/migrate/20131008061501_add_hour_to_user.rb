class AddHourToUser < ActiveRecord::Migration
  def change
  	add_column :users, :start_hour, :time
  	add_column :users, :end_hour, :time
  end
end
