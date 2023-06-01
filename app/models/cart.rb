class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  def total
    orderables.to_a.sum(&:total)
  end
end
