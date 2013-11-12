class AddUserReadyToCommande < ActiveRecord::Migration
  def change
  	add_column :commandes, :user_ready, :boolean, :default => false
  end
end
