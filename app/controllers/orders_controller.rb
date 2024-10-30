class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_root_path

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_information = OrderInformation.new
    @user = User.new
  end

  def create
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      pay_item
      @order_information.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_information).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    elsif current_user == @item.user
      redirect_to root_path
    end
  end
end
