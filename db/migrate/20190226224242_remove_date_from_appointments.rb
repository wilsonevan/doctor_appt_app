class RemoveDateFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :date, :datetime
  end
end
