class Company < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }

  # Associations
  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies, counter_cache: true
  has_many :critics, as: :criticable, dependent: :destroy
end
