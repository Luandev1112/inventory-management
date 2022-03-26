class AddTotalStockToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :total_stock, :integer
  end
end
