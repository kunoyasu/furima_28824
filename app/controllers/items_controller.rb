class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
    @categories = Category.all
    @conditions = Condition.all
    @shipping_charges = ShippingCharge.all
    @shipping_regions = ShippingRegion.all
    @estimated_shipping_dates = EstimatedShippingDate.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render 'items/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    redirect_to item_path(@item) if @item.update(item_params)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :category_id, :condition_id, :shipping_charge_id, :shipping_region_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name, :image, :price, :introduction, :category_id, :condition_id, :shipping_charge_id, :shipping_region_id, :estimated_shipping_date_id) [:image_url, :id]
  end
end
