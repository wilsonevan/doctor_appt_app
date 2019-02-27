class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    # @appointments = 
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      flash[:success] = "Doctor Created"
      redirect_to root_path # => doctor_path(@doctor)
    else
      flash[:error] = "Error #{@doctor.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name)
    end
end
