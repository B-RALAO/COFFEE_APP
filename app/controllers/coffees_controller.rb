class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[show edit update destroy]

  def index
    @coffees = Coffee.all
  end

  def show
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @user = current_user
    @coffee = Coffee.new(coffee_params)
    @coffee.user = @user
    @coffee.save
    if @coffee.save
      redirect_to coffees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @coffee.update(coffee_params)

    redirect_to coffee_path(@coffee)
  end

  def destroy
    @coffee.destroy

    redirect_to coffees_path
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def coffee_params
    params.require(:coffee).permit(:name, :origin, :strength, :rating, :description, :user_id)
  end
end
