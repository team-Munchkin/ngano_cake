class Admin::ItemsController < ApplicationController
   #before_action :authenticate_admin! ログインしているか確認

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
     redirect_to admin_item_path(@item.id)
    else
     render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

   private

   def item_params
     params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
   end
end



