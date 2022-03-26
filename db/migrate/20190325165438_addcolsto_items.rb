class AddcolstoItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :in_stock, :integer
    add_column :items, :price, :decimal
    add_column :categories, :description, :string
    add_column :brands, :manufacturer, :string
  end
end
