class CoffeesController < ApplicationController
  def index
    @coffees = Coffee.all
  end

  def show
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.save

    redirect_to coffees_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :origin, :strength, :rating, :description)
  end
end
