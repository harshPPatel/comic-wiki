class Character < ApplicationRecord
  has_and_belongs_to_many :issues

  validates :name, :site_detail_url, :presence => true
end
