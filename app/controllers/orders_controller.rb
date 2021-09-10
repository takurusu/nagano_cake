class OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.subtotal
    end
    @order.payment_method = params[:order][:payment_method]
      if params[:order][:address_option] == "0"
         @order.postal_code = current_customer.postal_code
         @order.address = current_customer.address
         @order.name = current_customer.full_name
      elsif params[:order][:address_option] == "1"
            @sta = params[:order][:address_id].to_i
            @address = Address.find(@sta)
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
      elsif params[:order][:address_option] == "2"
            @order.postal_code = params[:order][:postal_code]
            @order.address = params[:order][:order_address]
      end
  end

  def complete
  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status, :created_at, :updated_at)
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end

    def order_items_params
      params.require(:item).permit(:order_id, :item_id, :amount, :unit_price)
    end
end
