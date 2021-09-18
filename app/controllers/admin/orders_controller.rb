class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
    @order.update(order_params)
    if @order.status == "after_payment"
       @order_items.update(make_status: 1)
    end
    redirect_to admin_order_path
  end

  private

    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :amount, :unit_price)
    end

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status, order_items_attributes: [:item_id, :amount, :unit_price, :id])
    end
end
