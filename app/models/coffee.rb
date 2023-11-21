class Coffee < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  
  validates :name, presence: true
  validates :origin, presence: true
  validates :strength, presence: true, inclusion: { in: (0..5) }
  validates :description, presence: true, length: { minimum: 10 }
end
