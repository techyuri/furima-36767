class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name,:price,:user,:explain,:category_id,:state_id,:burden_id,:delivery_id,:area_id).merge(user_id: current_user.id)

  end
end
