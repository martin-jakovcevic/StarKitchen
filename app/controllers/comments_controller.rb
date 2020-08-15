class CommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])

    comment = recipe.comments.build(comment_params)

    comment.save
    redirect_to recipe
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
end