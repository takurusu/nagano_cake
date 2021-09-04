class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
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
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end
 end
