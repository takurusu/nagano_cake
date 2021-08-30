class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end

end
