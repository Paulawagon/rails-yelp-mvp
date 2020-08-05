class RestaurantsController < ApplicationController
  
before_action :set_restaurant, only: [:show, :edit, :update]

  
  def index
    @restaurants = Restaurant.all
  end
  
  def new
    @restaurant = Restaurant.new
  end 

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end
  def update
    if @restaurants.update(restaurants_params)
      redirect_to restaurants_path
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end 


  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
