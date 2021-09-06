class OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    #@cart_items = CartItem.find_by(name: params[:session][:name].downcase)
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end
end
