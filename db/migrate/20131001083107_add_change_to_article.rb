class AddChangeToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :category_id, :integer
  	change_column :articles, :price, :float
  end
end
