class AddAllotmentQuantityToAllotments < ActiveRecord::Migration[5.2]
  def change
    add_column :allotments, :allotment_quantity, :integer
  end
end
