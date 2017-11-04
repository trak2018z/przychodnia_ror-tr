class DoctorsController < ApplicationController
  before_action :check_admin, only: [:index]

  def index
    #@doctors = Doctor.all
    @doctors = Doctor.where(:admin => false)
  end

  private

  def check_admin
    if !current_doctor.try(:admin?)
      redirect_to root_path
    end
  end

end
