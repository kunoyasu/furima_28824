class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  # 「購入するitem_idと紐づかせてorder画面へと遷移させるindexアクション」
  def index
    @order_delivery = OrderDelivery.new
    @item = Item.find(params[:item_id])
    if user_signed_in? && @item.user_id != current_user.id
     else
      redirect_to root_path
    end
  end

  # 「order」という変数を作成
  def new
    @order = Order.new
  end

  # 「order」という変数にオーダークラスのパラムス情報をいれて保存
  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
     end
   end

  # 決済機能の実装
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end

  private

  # オーダーのパラムス情報を取得。
  def order_params
    @item = Item.find(params[:item_id])
    params.permit(:postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

end
