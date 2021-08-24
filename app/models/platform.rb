class Platform < ApplicationRecord
  # Validations
  validates :name, :category, presence: true
  validates :name, uniqueness: true

  # Enums
  enum category: { console: 0,
                   arcade: 1,
                   platform: 2,
                   operating_system: 3,
                   portable_console: 4,
                   computer: 5 }

  # Associations
  has_and_belongs_to_many :games
end
