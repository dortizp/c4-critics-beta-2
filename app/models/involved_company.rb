class InvolvedCompany < ApplicationRecord
  # Validations
  # Default value 'false' has been set on database migration for developer and publisher
  # Rails will convert the string values "false" or "0" from the form to the boolean 'false'
  #   and any other string value to the boolean 'true'
  #   with the exception of the empty string "" that is converted to nil

  validates :company, uniqueness: { scope: :game, message: "and Game combination already taken" }
  validates :developer, presence: { message: "and Publisher can't be blank" },
                        unless: proc { publisher? }
  validates :publisher, presence: { message: "and Developer can't be blank" },
                        unless: proc { developer? }

  # Associations
  belongs_to :game
  belongs_to :company
end
