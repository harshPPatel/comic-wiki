class Image < ApplicationRecord
  belongs_to :characters
  belongs_to :issues
  belongs_to :volumes

  validates :image_url, :presence => true
end
