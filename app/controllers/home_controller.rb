class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @dogs = Dog.all.sort_by(&:name).select(&:active?)
  end

  def toggle_dog
    dog = Dog.find(params[:id])
    dog.active? ? dog.update(active: false) : dog.update(active: true)
    dog.save
    redirect_to root_path
  end

  def toggle_all
    dogs = Dog.all
    dogs.each do |dog|
      dog.update(active: false)
      dog.save
    end
    redirect_to dogs_path
  end
end
