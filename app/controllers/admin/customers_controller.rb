class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
   @customer = Customer.find(params[:id])
   @costomer.update(costomer_params)
   redirect_to customers_path
  end
   
end
