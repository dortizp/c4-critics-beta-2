class Game < ApplicationRecord
  # Validations
  validates :name, :category, presence: true
  validates :name, uniqueness: true
  validates :rating,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
            allow_nil: true
  # Validates parent is included in the list of main_game's only if the category is not main_game
  validates :parent, inclusion: { in: proc { Game.main_game },
                                  message: "is not a valid game" },
                     unless: proc { main_game? || category.nil? }
  # Validates that parent is nil when the game is a main_game
  validates :parent, absence: true, if: proc { main_game? }

  # Enums
  enum category: { main_game: 0, expansion: 1 }

  # Associations
  belongs_to :parent, class_name: "Game", optional: true
  has_many :expansions, class_name: "Game",
                        foreign_key: "parent_id",
                        dependent: :nullify,
                        inverse_of: "parent"

  has_many :involved_companies, dependent: :destroy
  has_many :companies, through: :involved_companies

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms

  has_many :critics, as: :criticable, dependent: :destroy
end
