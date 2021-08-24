class Genre < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_and_belongs_to_many :games
end
