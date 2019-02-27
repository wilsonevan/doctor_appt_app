class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  # This method orders the appointments by date and time, from oldest to youngest
  def self.order_appts
    order(:time)  
    order(:date)
  end

  # This method searches for the last appointment before today's date
  # Returns - if there was a previous appointment, returns formatted date of previous appointment (not time)
  #         - if there was NO previous appointment, returns nil
  def self.find_last_appt
    # Initialize
    last_appt = self.order_appts
    most_recent_appt = nil

    # Search through array of all appointments for each user, and save the last one before today's current date
    # Important note - since they are in order, only need to search and save until they are no longer before today's date
    last_appt.each do |appt|
      if appt.date < Date.today
        most_recent_appt = appt.date.strftime("%m/%d/%y") # searches through and saves the latest appt
      end
    end
    return most_recent_appt
  end

  # This method allows the view to adjust the date and time to be more clearly displayed
  def readable_appt
    appointment_datetime = self.date.strftime("%m/%d/%y") + " - " + self.time.strftime("%I:%M%p")
  end
end
