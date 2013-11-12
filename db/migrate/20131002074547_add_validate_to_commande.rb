class AddValidateToCommande < ActiveRecord::Migration
  def change
  	add_column :commandes, :ready, :boolean, :default => false
  end
end
