class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.find(params[:id])
    @cart_items = CartItem.all
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
end
