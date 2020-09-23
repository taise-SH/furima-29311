class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_find, except: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def delete
  end

  
  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :explanation, :image, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end


