class Purchase < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :coffee, dependent: :destroy

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
