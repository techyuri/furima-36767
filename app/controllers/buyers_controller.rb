class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_form

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buyer.present?
      redirect_to root_path
    end
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      pay_item
      @item_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:item_form).permit(:area_id, :city, :address_line, :building, :phone_number, :postal_code).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_form_params[:token],
      currency: 'jpy'
    )
  end

  def set_item_form
    @item = Item.find_by(id: params[:item_id])
  end
end
