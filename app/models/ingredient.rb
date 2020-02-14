class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  # A cocktail must have a unique name and different than blank.
  validates :name, uniqueness: true, presence: true
end
