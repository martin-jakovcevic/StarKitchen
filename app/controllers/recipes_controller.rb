class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments.order(id: :desc)
  end

  def new
    warning_notice unless logged_in?
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(user: current_user))

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    warning_notice unless logged_in?
    @recipe = Recipe.find(params[:id])

    if logged_in?
      warning_notice unless valid_user?(@recipe.user)
    end
  end

  def destroy
    warning_notice unless logged_in?

    recipe = Recipe.find(params[:id])

    if valid_user?(recipe.user)
      recipe.destroy
      redirect_to root_path
    else
      warning_notice
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :instructions,)
  end
end
