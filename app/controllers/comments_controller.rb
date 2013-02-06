class CommentsController < ActionController::Base
  def create
    @comment = Comment.create(params[:comment])
    cat = Cat.find(@comment.cat_id)
    session["comment_#{cat.id}"] = "commented"
    redirect_to cat_path(cat)
  end
end