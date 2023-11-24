class Coffee < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[name origin description grind intensifier]

  PgSearch.multisearch_options = {
    using: { tsearch: { prefix: true } }
  }

  GRIND = ['Coarse', 'Medium-coarse', 'Medium', 'Fine', 'Extra fine']
  INTENSIFIER = %w[Mild Balanced Light-Bodied Full-Bodied Rich Medium]

  has_one_attached :photo
  belongs_to :user
  has_many :purchases
  has_one_attached :photo

  validates :name, :origin, :variety, :price, presence: true
  validates :strength, presence: true, inclusion: { in: (0..5) }
  validates :description, presence: true, length: { minimum: 10 }
  validates :grind, presence: true, inclusion: { in: GRIND }
  validates :intensifier, presence: true, inclusion: { in: INTENSIFIER }
 
  geocoded_by :origin
  after_validation :geocode, if: :will_save_change_to_origin?
end
