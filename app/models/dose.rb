class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  # # A dose must have a description, a cocktail and an ingredient
  validates :description, :cocktail, :ingredient, presence: true
  # and [cocktail, ingredient] pairings should be unique.
  # validates_uniqueness_of :dose, scope: [:semester_id, :class_id]

  # valide l'uniqueness cocktail_id, avec le scope qui verifie l ingredient id
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end
