class Rating < ActiveRecord::Base
  attr_accessible :cat_id, :rating

  belongs_to :cat

  validates :cat_id, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: 1..10

  def self.average_rating(cat)
    Rating.where(:cat_id => cat.id).average(:rating).to_i
  end

  def self.total_ratings(cat)
    Rating.where(:cat_id => cat.id).count(:rating)
  end
end