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
   order.customer_id = current_customer.id
   order.save
   redirect_to thanks_path
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name

    @cart_items = CartItem.where(customer_id: current_customer.id)
    @invoice = 0
    @postage = 800
    
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :invoice)
  end
end