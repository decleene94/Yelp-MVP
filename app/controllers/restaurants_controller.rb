class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  # def create
  #   if restaurant_params.valid?
  #     @restaurant = Restaurant.new(restaurant_params)
  #     @restaurant.save
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     @restaurant = find(params[:id])
  #     redirect_to new_restaurant_path(@restaurant)
  #   end
  # end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
