class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  has_many :order_items
  def postage
    800
  end

  def full_address
    '〒' + postal_code + ' ' + address
  end
end
