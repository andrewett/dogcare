class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
    authorize! :create, @post
  end

  def edit
    authorize! :update, @post
  end

  def create
    @post = Post.create(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post successfully added.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
