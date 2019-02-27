class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  def upcoming_appts(appointments)
    ordered_array = appointments
    binding.pry
  end

  def readable_appt
    appointment_datetime = self.date.strftime("%m/%d/%y") + " - " + self.time.strftime("%I:%M%p")
    # binding.pry
  end
end
