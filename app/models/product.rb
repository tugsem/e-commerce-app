class Product < ApplicationRecord
  has_many :orderables
  has_many :carts, through: :orderables

  validates :product_name, presence: true
  validates :product_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :product_image, presence: true
end
