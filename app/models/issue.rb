class Issue < ApplicationRecord
  has_and_belongs_to_many :characters

  validates :name, :site_detail_url, :presence => true
end
