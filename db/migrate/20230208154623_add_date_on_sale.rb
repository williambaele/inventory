class AddDateOnSale < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :sale_date, :date
  end
end
