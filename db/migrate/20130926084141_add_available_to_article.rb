class AddAvailableToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :available, :boolean, :default => true
  end
end
