class Comment < ActiveRecord::Base
  attr_accessible :cat_id, :text, :name

  belongs_to :cat

  validates :text, :presence => true
  validates :name, :presence => true
end