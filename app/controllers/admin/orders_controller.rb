class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  private

    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :amount, :unit_price)
    end

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status, order_items_attributes: [:item_id, :amount, :unit_price, :id])
    end
end
