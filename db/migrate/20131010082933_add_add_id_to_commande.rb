class AddAddIdToCommande < ActiveRecord::Migration
  def change
  	add_column :commandes, :add_id, :integer
  end
end
