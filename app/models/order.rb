class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { before_payment: 0, after_payment: 1, making: 2, before_sending: 3, after_sending: 4 }
  has_many :order_items
  belongs_to :customer

  def postage
    800
  end

  def full_address
    '〒' + postal_code + ' ' + address
  end

  accepts_nested_attributes_for :order_items, allow_destroy: true
end
