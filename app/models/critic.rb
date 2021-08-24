class Critic < ApplicationRecord
  #  Validations
  validates :title, presence: true, length: { maximum: 70 }
  validates :body, presence: true, length: { maximum: 600 }

  # Associations
  belongs_to :user, counter_cache: true
  belongs_to :criticable, polymorphic: true
end
