class VisitsController < ApplicationController
  # before_action :set_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_visit, only: [:show, :destroy]
  before_action :authenticate_patient!, only: [:new, :create, :destroy]

  def reserved_datetimes
    puts "RESERVED"
    if request.xhr?
      doctor = ActiveSupport::JSON.decode(CGI.unescapeHTML(params[:doctor_id]))
      visit_date = CGI.unescapeHTML(params[:visit_date]).to_date
      @visits = Visit.where(doctor_id: doctor).where('DATE(visit_date) = ?', visit_date)
    end
  end

  def index
    if request.xhr?
      # if request.path.start_with?("visits")
      # doctor = ActiveSupport::JSON.decode(CGI.unescapeHTML(params[:doctor_id]))
      # visit_date = CGI.unescapeHTML(params[:visit_date]).to_date
      # @visits = Visit.where(doctor_id: doctor).where('DATE(visit_date) = ?', visit_date)
      # else
      if doctor_signed_in?
        @future_visits = Visit.where(doctor_id: current_doctor.id)
      else
        @future_visits = Visit.where(patient_id: current_patient.id)
      end
      # end
      # @future_visits = Visit.where(patient_id: current_patient.id)
    else
      if patient_signed_in?
        @past_visits = Visit.where(patient_id: current_patient.id).where('visit_date < ?', DateTime.now)
        @future_visits = Visit.where(patient_id: current_patient.id).where('visit_date > ?', DateTime.now)
      end
      if doctor_signed_in?
        if current_doctor.admin?
          @past_visits = Visit.all.where('visit_date < ?', DateTime.now)
          @future_visits = Visit.all.where('visit_date > ?', DateTime.now)
        else
          @past_visits = Visit.where(doctor_id: current_doctor.id).where('visit_date < ?', DateTime.now)
          @future_visits = Visit.where(doctor_id: current_doctor.id).where('visit_date > ?', DateTime.now)
        end
      end
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    if !patient_signed_in?
      if !doctor_signed_in?
        redirect_to root_path
      else
        if @visit.doctor_id!=current_doctor.id
          redirect_to root_path
        end
      end
    else
      if @visit.patient_id!=current_patient.id
        then redirect_to root_path
      end
    end
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    @doctor = Doctor.find(params[:doctor_id])
    @appointments = []
    @doctor.visits.each do |a| @appointments << a.visit_date.strftime("%Y-%m-%d %H:%M") end
      @start_times = []
      @end_times = []
      @doctor.worktimes.sort.each do |w| @start_times << w.start_time.strftime("%H").to_i end
        @doctor.worktimes.sort.each do |w| @end_times << w.end_time.strftime("%H").to_i end
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
          visit_date = @visit.visit_date
          if visit_date.nil?
            respond_to do |format|
              format.html { redirect_to visits_path, :flash => { :error => 'Błędna data. Spróbuj ponownie.' }}
              format.json { render json: @visit.errors, status: :unprocessable_entity }
            end
          else
            day_of_week = visit_date.wday # nazwa dnia tygodnia
            the_day_worktime = Worktime.where(doctor_id:params[:doctor_id]).where(weekday: Worktime::VALID_WEEKDAYS[day_of_week-1]).first

            # walidacja zgodności z czasem pracy
            if visit_date.strftime("%HH") >= the_day_worktime.start_time.strftime("%HH") && visit_date.strftime("%HH") < the_day_worktime.end_time.strftime("%HH")
              respond_to do |format|
                if @visit.save
                  format.html { redirect_to visits_path, :flash => { :success => 'Wizyta została zarejestrowana.' }}
                  format.json { render :show, status: :created, location: @visit }
                else
                  format.html { redirect_to visits_path, :flash => { :error => 'Błędna data. Spróbuj ponownie.' }}
                  format.json { render json: @visit.errors, status: :unprocessable_entity }
                end
              end
            else
              respond_to do |format|
                format.html { redirect_to visits_path, :flash => { :error => 'Błędna data. Spróbuj ponownie.' }}
                format.json { render json: @visit.errors, status: :unprocessable_entity }
              end
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
          if @visit.patient_id!=current_patient.id
            then redirect_to root_path
          else
            @visit.destroy
            respond_to do |format|
              format.html { redirect_to visits_url, notice: 'Wizyta została anulowana.' }
              format.json { head :no_content }
            end
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
