class Property < ApplicationRecord
  has_many :stations dependent: :destroy
end
