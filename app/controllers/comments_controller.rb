class CommentsController < ActionController::Base
  def create
    @comment = Comment.create(params[:comment])
    cat = Cat.find(@comment.cat_id)
    session["comment_#{cat.id}"] = "commented"
    redirect_to cat_path(cat)
  end

  def destroy
    @comment = Comment.find(params[:id])
    cat = Cat.find(@comment.cat_id)
    @comment.destroy

    redirect_to edit_cat_path(cat)
  end
end