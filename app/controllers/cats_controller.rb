class CatsController < ApplicationController
  def new
    @cat = Cat.new
  end

  def create
    picture = params[:cat].delete(:picture)
    @cat = Cat.new(params[:cat])
    @cat.picture = picture.read
    @cat.save!

    redirect_to root_path
  end

  def index
    @cats = Cat.ordered_by_rating
    Kaminari.paginate_array(@cats).page(params[:page]).per(1)
    @rating = Rating.new
  end

  def show
    @cat = Cat.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:cat][:id])
    @cat.name = params[:cat][:name]
    @cat.breed = params[:cat][:breed]
    @cat.age = params[:cat][:age]
    @cat.save

    redirect_to cat_path(@cat)
    flash[:notice] = "#{@cat.name} has been updated."
  end

  def destroy
    Cat.find(params[:id]).destroy

    redirect_to root_path
    flash[:notice] = "You just killed a kitty."
  end

  def rating
    @cat = Cat.find(params[:id])
    @rating = @cat.ratings.create(params[:rating])
    session["cat_#{@cat.id}"] = "rated"

    redirect_to root_path
    flash[:notice] = "Thanks for rating #{@cat.name}!"
  end

  def photo
    cat = Cat.find(params[:id])
    send_data(cat.picture, type: 'image/jpg', disposition: 'inline')
  end
end
