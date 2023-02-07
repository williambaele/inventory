class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
    @sales = Sale.all
  end
end
