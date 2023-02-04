class AddDataShoes < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :retail, :integer
    add_column :items, :size, :integer
    add_column :items, :brand, :string
    add_column :items, :comment, :string
    add_column :items, :state, :integer
  end
end
