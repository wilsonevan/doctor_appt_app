class AddDateToAppointments2 < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :date, :time
  end
end
