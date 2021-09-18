class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  def full_address
    '〒' + postal_code + ' ' + address
  end

  def full_name
    last_name + first_name
  end

  def active_for_authentication?
    super && (self.is_active == false)
  end
end
