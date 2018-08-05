class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to meals_path, notice: 'This ingredient was added to your meal'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to meals_path
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy

    redirect_to meals_path, notice: 'This ingredient was destroyed'
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit!
  end
end
