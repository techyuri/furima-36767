class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
     @item = Item.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:price, :name, :price, :user, :explain, :category_id, :state_id, :burden_id, :delivery_id, :area_id,
                                 :image).merge(user_id: current_user.id)
  end
end
