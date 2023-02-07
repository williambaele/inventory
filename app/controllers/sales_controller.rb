class SalesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @sale = Sale.new(item: @item)
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to @sale, notice: "Sale was successfully created."
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:item_id, :price, :date)
  end
end
