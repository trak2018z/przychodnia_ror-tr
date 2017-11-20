class VisitsController < ApplicationController
  # before_action :set_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_visit, only: [:show, :destroy]
  before_action :authenticate_patient!, only: [:new, :create, :destroy]
  # GET /visits
  # GET /visits.json
  def index
    if patient_signed_in?
      @visits = Visit.where(patient_id: current_patient.id)
    end
    if doctor_signed_in?
      if current_doctor.admin?
        @visits = Visit.all
      else
        @visits = Visit.where(doctor_id: current_doctor.id)
      end
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    @doctor = Doctor.find(params[:doctor_id])
  end

  # GET /visits/1/edit
  # def edit
  # end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    @visit.doctor_id = params[:doctor_id]
    @visit.patient_id = current_patient.id

    respond_to do |format|
      if @visit.save
        format.html { redirect_to visits_path, notice: 'Wizyta została zarejestrowana.' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  # def update
  #   respond_to do |format|
  #     if @visit.update(visit_params)
  #       format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @visit }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @visit.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Wizyta została anulowana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:visit_date, :patient_id, :doctor_id)
    end
end
