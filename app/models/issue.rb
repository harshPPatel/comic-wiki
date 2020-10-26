class Issue < ApplicationRecord
  has_and_belongs_to_many :characters
  belongs_to :volume

  validates :name, :site_detail_url, :presence => true
end
