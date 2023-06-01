class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :product_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :product_image, presence: true
end
