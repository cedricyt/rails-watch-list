class List < ApplicationRecord
  has_many :bookmarks, dependent: destroy
  validates :name, uniqueness: true
end
