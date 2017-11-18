class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :visit_date, :patient_id, :doctor_id, presence: true
end
