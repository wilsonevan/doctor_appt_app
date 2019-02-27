class AppointmentsController < ApplicationController
  before_action :set_doctor
  # attr_accessor :date, :time
  
  def index
    # @teachers = @doctor.appointments.where(role: "teacher")
    # @tas = @doctor.appointments.where(role: "ta")
    # @students = @doctor.appointments.where(role: "student")
  end
  
  def new
    @users = User.all - @doctor.users
    # @appointment = doctor.new(role: nil, doctor_id: 1, user_id: nil)
    @appointment = @doctor.appointments.new
  end
  
  def create
    # @appointment = doctor.new(role: nil, doctor_id: 1, user_id: nil)
    @appointment = @doctor.appointments.new(appointment_params)

    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appointment_params
      params.require(:appointment).permit(:user_id, :date, :time)
    end
end
