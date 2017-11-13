class Doctor < ApplicationRecord
  has_and_belongs_to_many :specializations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :phone, presence: true
end
