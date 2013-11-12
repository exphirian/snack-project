class CreateSauces < ActiveRecord::Migration
  def change
    create_table :sauces do |t|
    	t.string :name
    	t.integer :category_id
      t.timestamps
    end

    add_column :articles, :sauce_id, :integer
  end
end
