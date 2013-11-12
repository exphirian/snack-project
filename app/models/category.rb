class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :articles
  has_many :sauces
end
