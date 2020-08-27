class ItemsController < ApplicationController
  # before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :category_id, :condition_id, :shipping_charge_id, :shipping_region_id, :estimated_shipping_date_id).merge(:user_id, :current_user.id)
    # params.require(:item).permit{"item" => { "name"=>"ゴリラ","image"=>"i","introducion"=>"ゴリラです","category_id"=>1,"condition_id"=>1 ,"comment"=>"test","shipping_charge_id"=>"1" }
  end
end


# def update
# item = Item.find(params[:id])
# item.update(item_params)
# end

# def destroy
# item = Items.find(params[:id])
# item.destroy
# end

# def show
# end

# def set_item
# item = Item.find(params[:id])
# end
