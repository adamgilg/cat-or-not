class Cat < ActiveRecord::Base
  attr_accessible :age, :breed, :name, :picture

  has_many :ratings

  validates :picture, presence: true

  def self.ordered_by_rating
    Cat.joins("LEFT OUTER JOIN ratings ON cats.id = ratings.cat_id").group(:cat_id).order('AVG(rating) DESC')
  end

  def average_rating
    self.ratings.average(:rating).to_i
  end

  def total_ratings
    self.ratings.count
  end
end
