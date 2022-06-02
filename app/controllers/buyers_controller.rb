class BuyersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index ,:create ]
  before_action :prevent_url, only: [:index ,:create ]
  
  def index
    @buyer_shipping = Buyershipping.new
  end

  def create
    @buyer_shipping = Buyershipping.new(buyer_params)
    if @buyer_shipping.valid?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,  # 商品の値段
          card: buyer_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
      @buyer_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyershipping).permit(:postal_code,:prefecture_id, :city, :house_number, :building_name, :price,:address, :building, :telephone).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user.id == current_user.id || @item.buyer != nil
      redirect_to root_path
    end
  end

end
