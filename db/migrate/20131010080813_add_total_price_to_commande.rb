class AddTotalPriceToCommande < ActiveRecord::Migration
  def change
  	add_column :commandes, :total_price, :float
  end
end
