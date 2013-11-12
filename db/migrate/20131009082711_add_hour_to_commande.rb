class AddHourToCommande < ActiveRecord::Migration
  def change
  	add_column :commandes, :hour_id, :integer
  end
end
