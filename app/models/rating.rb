class Rating < ActiveRecord::Base
  attr_accessible :cat_id, :rating

  belongs_to :cat

  validates :cat_id, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: 1..7

end