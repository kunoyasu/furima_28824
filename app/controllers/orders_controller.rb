class OrdersController < ApplicationController
end

def buy
  @buyer = Item.find(params[:id])
  @buyer.update(purchaser_id: current_user.id)
 end
