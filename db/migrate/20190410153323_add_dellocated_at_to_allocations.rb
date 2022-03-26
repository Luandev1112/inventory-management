class AddDellocatedAtToAllocations < ActiveRecord::Migration[5.2]
  def change
    add_column :allotments, :deallocated_at, :datetime
  end
end
