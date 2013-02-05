class Cat < ActiveRecord::Base
  attr_accessible :age, :breed, :name, :picture

  has_many :ratings

  validates :picture, presence: true
end
