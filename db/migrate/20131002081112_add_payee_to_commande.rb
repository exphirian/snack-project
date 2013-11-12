class AddPayeeToCommande < ActiveRecord::Migration
  def change
  	add_column :commandes, :payee, :boolean, :default => false
  end
end
