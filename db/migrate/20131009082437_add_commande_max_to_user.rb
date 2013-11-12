class AddCommandeMaxToUser < ActiveRecord::Migration
  def change
  	add_column :users, :commande_max, :integer
  end
end
