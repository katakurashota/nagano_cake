class Public::AddressesController < ApplicationController
  def index
   @addresse = Addresse.new
   @addresses = Addresse.all
  end

  def edit
   @addresse = Addresse.find(params[:id])
  end

  def create
   @addresse = Addresse.new(addresse_params)
   @addresse.save
   redirect_to addresses_path
  end

  def destroy
   @addresse = Addresse.find(params[:id])
   @addresse.destroy
   redirect_to addresse_path
  end

  def update
    addresse = Addresse.find(params[:id])
    addresse.update(addresse_params)
    redirect_to addresses_path
  end


  private
  def addresse_params
    params.require(:addresse).permit(:name, :postal_code, :address)
  end
end
