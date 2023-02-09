class SalesController < ApplicationController
  def index
    @sales = Sale.where(item_id: Item.where(sold: true).pluck(:id))
    @items = Item.where(sold: true)
    if params[:id].present?
      @sale = Sale.find(params[:id])
      item = Item.find(@sale.item_id)
      @benefit = @sale.sale_price - item.retail
    end
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
      flash[:success] = "Sale was successfully created."
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:item_id, :sale_price, :date)
  end
end
