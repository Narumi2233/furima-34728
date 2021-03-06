class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :baria_user, only: [:edit, :update,:destroy]
  before_action :prevent_url, only: [:edit ]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
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
  end

  def update
   if @item.update(item_params)
    redirect_to item_path(@item.id)
   else
    render :edit
   end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image , :title, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_days_id, :price ).merge(user_id: current_user.id)
  end

  def baria_user
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.buyer != nil
      redirect_to root_path
    end
  end

end
