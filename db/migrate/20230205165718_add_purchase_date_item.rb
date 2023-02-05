class AddPurchaseDateItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :purchase_date, :date
  end
end
