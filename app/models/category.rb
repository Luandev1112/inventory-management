class Category < ApplicationRecord
  has_many :items, dependent: :nullify
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :description, length: { maximum: 150 }
end
