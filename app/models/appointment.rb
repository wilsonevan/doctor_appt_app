class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  def self.upcoming_appts
    order(:time)  
    order(:date)
  end

  def readable_appt
    appointment_datetime = self.date.strftime("%m/%d/%y") + " - " + self.time.strftime("%I:%M%p")
    # binding.pry
  end
end
