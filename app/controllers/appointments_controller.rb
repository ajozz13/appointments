class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        #format.json { render :show, status: :created, location: @appointment }
        format.json { render json: { notice: "Appointment was successfully created.", status: :created, object: @appointment.to_json }, status: :created }
      else
        format.html { render :new }
        format.json { render json: { errors: @appointment.errors.full_messages }, status: 422 }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        #format.json { render :show, status: :ok, location: @appointment }
        format.json { render json: { notice: "Appointment was successfully updated.", status: :ok, object: @appointment.to_json } }
      else
        format.html { render :edit }
        format.json { render json: { errors: @appointment.errors.full_messages }, status: 422 }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      #format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.html { render nothing: true } # returns a 204
      #format.html { head :no_content } # returns a 204
      format.json { head :no_content }
      #format.json { render :nothing => true }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:start_time, :end_time, :first_name, :last_name, :comment)
    end
end
