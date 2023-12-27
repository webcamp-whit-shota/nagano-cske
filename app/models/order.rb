class Order < ApplicationRecord
  belongs_to :item
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def address_display
    '〒' + postal_code + '' + address + '' + address_name
  end
end
