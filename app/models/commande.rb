class Commande < ActiveRecord::Base
  attr_accessible :name, :hour_id, :add_id

  belongs_to :hour
  belongs_to :user

  has_many :articles
end
