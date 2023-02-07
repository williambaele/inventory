class AddDataToSale < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :item_id, :integer
  end
end
