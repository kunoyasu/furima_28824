class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

  def index
  #  @item = Items.all
  end

  def new
    @item = Items.new
  end
end
