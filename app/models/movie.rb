class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, uniqueness: true
  validates :overview, presence: true
  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.any?
      errors.add(:base, "cannot delete movie because it is referenced in at least one bookmark")
      throw :abort
    end
  end
end
