class ItemsController < ApplicationController
  require 'date'

  def index
    if params[:query].present?
      @items = Item.search_by_name_and_sku(params[:query])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @sale_price = Sale.where(item_id: @item.id).pluck(:sale_price).first
    @benefit = @sale_price - @item.retail
  end

  # CREATE
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:success] = "Your item has been created"
      redirect_to item_path(@item)
    else
      flash[:alert] = "Error ! Try again"
      render :new, status: :unprocessable_entity
    end
  end

  # UPDATE
  def edit
    @item = Item.find(params[:id])
  end

  def sold
    @item = Item.find(params[:id])
    @item.sold = true
    redirect_to new_item_sale_path(item_id: @item.id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      flash[:success] = "Your item has been updated"
      redirect_to item_path(@item)
    else
      flash[:alert] = "Error ! Try again"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to items_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :sku, :brand, :retail, :comment, :size, :state, :purchase_date, :sold)
  end
end
