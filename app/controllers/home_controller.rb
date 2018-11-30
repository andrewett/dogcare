class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @post = Post.new
    @posts = Post.all.sort_by(&:updated_at).reverse
    @dogs = Dog.all.sort_by(&:name).select { |dog| dog.active? || dog.boarding? }
    @daycare_count = Dog.all.select { |dog| dog.active? && !dog.boarding? }.count
    @boarding_count = Dog.all.select(&:boarding?).count
  end

  def toggle_daycare
    dog = Dog.find(params[:id])
    dog.active? ? dog.update(active: false) : dog.update(active: true)
    dog.save
    redirect_back(fallback_location: root_path)
  end

  def toggle_all_daycare
    dogs = Dog.all
    dogs.each do |dog|
      dog.update(active: false)
      dog.save
    end
    redirect_to dogs_path
  end

  def toggle_boarding
    dog = Dog.find(params[:id])
    dog.boarding? ? dog.update(boarding: false) : dog.update(boarding: true)
    dog.update(active: false)
    dog.save
    redirect_back(fallback_location: root_path)
  end

  def delete_post
    post = Post.find(params[:id])
    post.destroy
    redirect_back(fallback_location: root_path)
  end
end
