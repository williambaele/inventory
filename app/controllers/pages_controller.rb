class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
    @sales = Sale.all
    @profit = 0
    @sales_past = Sale.where("sale_date >= ?", Time.now - 30.days)
    @sales_past.each do |sale|
      if sale.item.retail.present?
        @profit += sale.sale_price - sale.item.retail
      end
    end
  end
end
