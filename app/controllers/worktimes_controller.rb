class WorktimesController < ApplicationController
  before_action :check_doctor, only: [:index, :edit, :update]
  DAY_ORDER = %w(poniedziałek wtorek środa czwartek piątek)

  def index
    @worktimes = Worktime.where(:doctor_id => params[:doctor_id])
    @worktimes = @worktimes.sort_by{|wd| DAY_ORDER.index(wd.weekday)}
  end

  def edit
    @worktimes = Worktime.find(Doctor.find(params[:doctor_id]).worktimes.ids)
    @worktimes = @worktimes.sort_by{|wd| DAY_ORDER.index(wd.weekday)}
  end

  def update
    @worktimes = Worktime.update(params[:worktimes].keys, params[:worktimes].values)
    @worktimes.reject! { |w| w.errors.empty? }
    if @worktimes.empty?
      redirect_to :action => "index"
    else
      flash[:notice] = "Proszę poprawić błędne godziny pracy"
      render "edit"
    end
  end

  private

  def check_doctor
    if !(doctor_signed_in?)
      redirect_to root_path
    elsif !(current_doctor.id==params[:doctor_id].to_i)
      redirect_to root_path
    end
  end
end
