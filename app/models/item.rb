class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :allotments, dependent: :destroy
  has_many :issues, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  attribute :in_stock, default: 0
  attribute :total_stock, default: 0
  attribute :minimum_required_stock, default: 0
  attribute :procurement_time_in_weeks, default: 0

  def item_display_name
    @brand_name = brand_id.nil? ? "<Brand N/A>" : Brand.find(brand_id).name
    "#{@brand_name} #{name} #{quantity} --- [Presently in stock : #{in_stock}]"
  end
end
