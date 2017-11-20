class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.where(:admin => false)
  end
end
