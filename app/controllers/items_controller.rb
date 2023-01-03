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
    @stocking_date = (DateTime.now - @shoe.purchase_date).to_i
  end
  # CREATE
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to item_path(@item)
      flash[:success] = "Item created"
    else
      flash[:alert] = "Error ! Try again"
      render :new, status: :unprocessable_entity
    end
  end
  # UPDATE

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
    flash[:success] = "Item updated"
  end



  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to items_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :sku)
  end
end
