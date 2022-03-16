class Public::ItemsController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end
  
  def show
  end
end
