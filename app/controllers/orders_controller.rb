class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_information = OrderInformation.new
    @item = Item.find(params[:item_id])
    @user = User.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      pay_item
      @order_information.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order_information).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number ).merge(token: params[:token]).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
