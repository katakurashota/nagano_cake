class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
   @order = Order.new
   @customer = current_customer
  end

  def create
   order = Order.new(order_params)
   order.save
   redirect_to thanks_path
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @totalprice = 0
    @postage = Order.where(postage: '800')
  end

  private
  def order_params
   params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :invoice, :payment_method, :is_active)
  end
end