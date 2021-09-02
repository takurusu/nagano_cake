class ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.all
  end

  private

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end

end
