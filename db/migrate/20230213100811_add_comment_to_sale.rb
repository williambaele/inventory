class AddCommentToSale < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :comment, :string
  end
end
