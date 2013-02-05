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
    render :json => "nothing"
  end

  def rating
    @cat = Cat.find(params[:id])
    @rating = @cat.ratings.create(params[:rating])
    redirect_to cats_path
  end
end
