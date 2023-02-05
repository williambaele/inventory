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
    params.require(:item).permit(:name, :sku, :brand, :retail, :comment, :size, :state, :purchase_date)
  end
end
