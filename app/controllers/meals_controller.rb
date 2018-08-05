class MealsController < ApplicationController

  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meals_params)
    if @meal.save
      redirect_to meals_path, notice: 'Your meal was created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meals_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: 'This meal was destroyed'
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meals_params
    params.require(:meal).permit!
  end
end

