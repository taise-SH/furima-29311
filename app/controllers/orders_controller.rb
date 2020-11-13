class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_index, only: [:index, :create]
  before_action :not_transition, only: [:index]

  def index
    @orders = OrderAddress.new
  end

  def create
    @orders = OrderAddress.new(order_params)
    if @orders.valid?
      pay_item
      @orders.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :post_cord, :city, :address, :building_name, :phone_number, :prefecture_id, :item_id).merge(user_id: current_user.id)
  end

  def item_index
    item = Item.find(params[:item_id])
    @price = item.price
    @image = item.image
    @explanation = item.explanation
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def not_transition
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user && item.user_id == current_user.id
  end
end