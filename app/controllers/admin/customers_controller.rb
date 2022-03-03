class Admin::CustomersController < ApplicationController
  def index
    @costomers = Costomer.all
  end
  
  def show
    @costomer = Costomer.find(params[:id])
  end
  
  def edit
    @costomer = Costomer.find(params[:id])
  end
  
  def update
   @costomer = Costomer.find(params[:id])
   @costomer.update(costomer_params)
   redirect_to admin_costomers_path
  end
   
end
