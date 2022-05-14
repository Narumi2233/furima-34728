class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :baria_user, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to item_path(@item.id)
   else
    render :edit
   end
  end

  private

  def item_params
    params.require(:item).permit(:image , :title, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_days_id, :price ).merge(user_id: current_user.id)
  end

  def baria_user
    unless Item.find(params[:id]).user.id.to_i == current_user.id
        redirect_to root_path
    end
   end

end
