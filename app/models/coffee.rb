class Coffee < ApplicationRecord
  GRIND = ['coarse', 'medium-coarse', 'medium', 'fine', 'extra fine']
  has_one_attached :photo
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :origin, presence: true
  validates :strength, presence: true, inclusion: { in: (0..5) }
  validates :description, presence: true, length: { minimum: 10 }
  validates :grind, presence: true, inclusion: { in: GRIND }
  validates :variety, presence: true
  validates :price, presence: true
  validates :intensifier, presence: true
end
