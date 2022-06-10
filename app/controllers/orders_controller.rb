class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :item_can_buyed?, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :user_select, only: [:index, :create]

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def user_select
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def item_can_buyed?
    if Order.find_by(item_id: @item.id)
      redirect_to root_path
    end
  end

end
