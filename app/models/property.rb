class Property < ApplicationRecord
  has_many :stations

  validates :name, presence:true
  validates :address, presence:true
  validates :age, presence:true
  validates :note, presence:true

end
