class ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end

    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end

end
