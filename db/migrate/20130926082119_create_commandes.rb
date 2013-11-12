class CreateCommandes < ActiveRecord::Migration
  def change
    create_table :commandes do |t|

    	t.string :name
      t.timestamps
    end
  end
end
