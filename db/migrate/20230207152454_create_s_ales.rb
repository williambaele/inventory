class CreateSAles < ActiveRecord::Migration[7.0]
  def change
    create_table :s_ales do |t|

      t.timestamps
    end
  end
end
