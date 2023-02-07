class AddPriceToSale < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :sale_price, :integer
  end
end
