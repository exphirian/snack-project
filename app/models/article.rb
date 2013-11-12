class Article < ActiveRecord::Base
  attr_accessible :name, :price, :category_id, :attachment, :available, :sauce_id

  belongs_to :category
  belongs_to :commande
  belongs_to :sauce

  has_attached_file :attachment
end
