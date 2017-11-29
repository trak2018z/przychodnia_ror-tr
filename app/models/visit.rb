class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :visit_date, :patient_id, :doctor_id, presence: true
  validate :visit_date_cannot_be_in_the_past
  validates_uniqueness_of :visit_date, scope: :doctor_id

  private
  def visit_date_cannot_be_in_the_past
    if visit_date.present? && visit_date < Date.today
      errors.add(:visit_date, "Niepoprawna data wizyty")
    end
  end
end
