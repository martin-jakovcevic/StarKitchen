class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def destroy
    warning_notice unless logged_in?
    comment = Comment.find(params[:id])

    if logged_in?
      warning_notice unless logged_in?
    end
    
    comment.destroy
    redirect_to comment.recipe
  end

  def edit
    warning_notice unless logged_in?
    @comment = Comment.find(params[:id])

    if logged_in?
      warning_notice unless logged_in?
    end

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
    warning_notice unless logged_in?

    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build
  end

  private

  def comment_params
    params.require(:comment).permit(:body,)
  end
end