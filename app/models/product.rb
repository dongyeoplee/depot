class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates_length_of :title, minimum: 10
  validates :image_url, allow_blank: true, format: {with: %r{\.(gif|jpg|png)$}i, message: 'must be a URL for GIF, JPG or PNG iamge.'}

  has_many :line_items
  before_destroy :line_item_empty
  
  private
  
  def line_item_empty
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
