class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genre = Genre.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
