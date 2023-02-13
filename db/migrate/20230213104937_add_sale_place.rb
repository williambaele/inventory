class AddSalePlace < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :sale_platform, :string
  end
end
