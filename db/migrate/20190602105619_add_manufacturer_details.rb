class AddManufacturerDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :manufacturer_email, :string
    add_column :brands, :manufacturer_office, :string
  end
end
