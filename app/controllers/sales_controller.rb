class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end
  def new
    @item = Item.find(params[:item_id])
    @sale = Sale.new(item: @item)
  end

  def create
    @item = Item.find(params[:item_id])
    @sale = Sale.new(sale_params)
    if @sale.save!
      @item.update(sold: true)
      redirect_to item_path(@item)
      flash[:success] = "Sale was successfully created."
    else
      render :new
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:item_id, :sale_price, :date)
  end
end
