class ModifyState < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :state, :string
  end
end
