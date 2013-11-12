class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.integer :commande_id
    	t.string :name
    	t.integer :price
      t.timestamps
    end
  end
end