class RemoveDateFromAppointments2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :date, :time
  end
end
