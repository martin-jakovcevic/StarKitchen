class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)

    if @comment.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.recipe
  end

  def edit
    @comment = Comment.find(params[:id])
    @recipe = @comment.recipe
  end

  def update
    @comment = Comment.find(params[:id])
    @recipe = @comment.recipe

    if @comment.update comment_params
      redirect_to @recipe
    else
      render :edit
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
end