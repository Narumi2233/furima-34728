class BuyersController < ApplicationController
  
  before_action :set_item, only: [:index ,:create ]

  def index
    @buyer_shipping = Buyershipping.new
  end

  def create
    @buyer_shipping = Buyershipping.new(buyer_params)
    if @buyer_shipping.valid?
      @buyer_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyershipping).permit(:postal_code,:prefecture_id, :city, :house_number, :building_name, :price).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
