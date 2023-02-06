class AddStatusToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :sold, :boolean, default: :false
  end
end
