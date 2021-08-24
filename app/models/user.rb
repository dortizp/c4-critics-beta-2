class User < ApplicationRecord
  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true, length: { maximum: 16 }
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :birth_date, presence: true
  validate :sixteen_or_older, unless: -> { birth_date.nil? }

  # Association
  has_many :critics, dependent: :destroy

  private

  def sixteen_or_older
    return if birth_date <= 16.years.ago

    errors.add(:birth_date, "should be older than 16 years ago")
  end
end
