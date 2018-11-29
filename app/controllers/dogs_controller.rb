class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @dogs = Dog.all.sort_by(&:name)
  end

  def show
  end

  def new
    @dog = Dog.new
    authorize! :create, @dog
  end

  def edit
    authorize! :update, @dog
  end

  def create
    @dog = Dog.create(dog_params)
    respond_to do |format|
      if @dog.save
        format.html { redirect_to root_path, notice: 'Dog successfully added.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to dogs_path, notice: 'Dog successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :temperament, :friends, :housing, :active, :avatar, :gender, :owner)
  end
end
