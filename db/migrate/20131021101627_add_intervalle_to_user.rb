class AddIntervalleToUser < ActiveRecord::Migration
  def change
  	add_column :users, :intervalle, :integer
  end
end
