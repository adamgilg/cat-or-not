class CatsController < ApplicationController
  def new
    @cat = Cat.new
  end

  def create
    picture = params[:cat].delete(:picture)
    @cat = Cat.new(params[:cat])
    @cat.picture = picture.read
    @cat.save!
    redirect_to cats_path
  end

  def index
    @cats = Cat.ordered_by_rating
    @rating = Rating.new
  end

  def rating
    @cat = Cat.find(params[:id])
    @rating = @cat.ratings.create(params[:rating])
    redirect_to cats_path
  end

  def photo
    cat = Cat.find(params[:id])
    send_data(cat.picture, type: 'image/jpg', disposition: 'inline')
  end
end
