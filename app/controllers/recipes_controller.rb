class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new

  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      render 'new'
    end
  end

  def edit

  end

  def destroy

  end

  def update

  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :instructions)
  end
end
