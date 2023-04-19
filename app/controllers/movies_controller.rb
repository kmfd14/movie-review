class MoviesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(post_params)
    if @movie.save
      flash[:notice] = 'Movie created successfully'
      redirect_to movies_path
    else
      flash.now[:alert] = 'Movie create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(post_params)
      flash[:notice] = 'Movie updated successfully'
      redirect_to movies_path
    else
      flash.now[:alert] = 'Movie update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = 'Movie destroyed successfully'
    redirect_to movies_path
  end

  private

  def set_post
    @movie = Movie.find(params[:id])
  end

  def post_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_origin,:showing_start, :showing_end)
  end
end
