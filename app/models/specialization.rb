class Specialization < ApplicationRecord
  has_and_belongs_to_many :doctors
  validates :appellation, presence: true
end
