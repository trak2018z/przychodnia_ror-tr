class Worktime < ApplicationRecord
  belongs_to :doctor
  validates :weekday, :start_time, :end_time, :doctor_id, presence: true
  validates_uniqueness_of :weekday, scope: :doctor_id
end
