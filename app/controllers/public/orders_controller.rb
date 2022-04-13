class Public::OrdersController < ApplicationController
  def index
   @orders = Order.all
  end

  def show
   @order = Order.find(params[:id])
   @cart_items = CartItem.where(customer_id: current_customer.id)
   @invoice = 0
   @postage = 800
  end

  def new
   @order = Order.new
   @customer = current_customer
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save
   current_customer.cart_items.destroy_all
   redirect_to thanks_path
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)
   
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @invoice = 0
    @postage = 800
    @order.order_details.build

  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :invoice, order_details_attributes:[:id, :amount, :price, :item_id, :order_id])
  end
end