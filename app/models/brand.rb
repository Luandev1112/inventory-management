class Brand < ApplicationRecord
  has_many :items, dependent: :nullify
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.manufacturer_email = manufacturer_email.downcase }
  validates :manufacturer_email, presence: true, length: { maximum: 150 }, format: { with: EMAIL_REGEX }
end
