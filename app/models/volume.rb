class Volume < ApplicationRecord
  has_many :issues

  validates :name, :site_detail_url, :presence => true
end
