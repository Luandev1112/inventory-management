class RenameSomeColumns < ActiveRecord::Migration[5.2]
  def change
    #connection.execute("PRAGMA defer_foreign_keys = ON")
    #connection.execute("PRAGMA foreign_keys = OFF")
    rename_column :allotments, :deallocated_at, :dealloted_at
    rename_column :items, :procurement_time_in_months, :procurement_time_in_weeks
    #connection.execute("PRAGMA foreign_keys = ON")
    #connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
