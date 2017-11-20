class Worktime < ApplicationRecord
  belongs_to :doctor
  validates :weekday, :start_time, :end_time, :doctor_id, presence: true
  validates_uniqueness_of :weekday, scope: :doctor_id
  VALID_WEEKDAYS = ["poniedziałek", "wtorek", "środa", "czwartek", "piątek"]
  validates :weekday, :inclusion => {:in => Worktime::VALID_WEEKDAYS}
end
