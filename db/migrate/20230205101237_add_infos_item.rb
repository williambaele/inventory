class AddInfosItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :hold, :string
  end
end
