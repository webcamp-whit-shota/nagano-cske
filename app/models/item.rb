class Item < ApplicationRecord
  has_one_attached :image
  
  has_many :cart_item, dependent: :destroy
  has_many :order_item, dependent: :destroy
end
