class Cat < ActiveRecord::Base
  attr_accessible :age, :breed, :name, :picture

  has_many :ratings

  validates :picture, presence: true

  def self.ordered_by_rating
    Cat.joins(:ratings).group(:cat_id).order('AVG(rating) DESC')
  end
end
