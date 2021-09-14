class HomesController < ApplicationController
  def top
    @items = Item.last(4)
    @genres = Genre.all
  end

  def about
  end

  private

    def item_params
      params.require(:item).permit(:image_id, :name, :price)
    end

end
