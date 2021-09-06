class CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.subtotal
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item = CartItem.update(cart_item_params)
    redirect_to cart_items_path
  end

  def one
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
        @cart_item = current_customer.cart_items.new(cart_item_params)
        if
          current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
          cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
          cart_item.amount += params[:cart_item][:amount].to_i
          cart_item.save
          redirect_to cart_items_path
        elsif
          @cart_item.save
          @cart_items = current_customer.cart_items.all
          render 'index'
        else
          render 'index'
        end
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end

 end
