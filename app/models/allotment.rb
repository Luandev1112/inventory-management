class Allotment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :item_id, presence: true
  validates :user_id, presence: true
  attribute :allotment_quantity, default: 0
end
