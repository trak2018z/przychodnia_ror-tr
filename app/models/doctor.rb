class Doctor < ApplicationRecord
  has_and_belongs_to_many :specializations
  has_many :worktimes, dependent: :destroy
  has_many :visits, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :phone, presence: true
end
