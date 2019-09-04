class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = []
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = {}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.fetch(:recipe, {})
    end
end
