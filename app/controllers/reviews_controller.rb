class ReviewsController < ApplicationController

  before_action :set_movie
  before_action :set_review, only: [:edit, :update]

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    if @review.save
      flash[:notice] = 'Review created successfully'
      redirect_to movie_reviews_path(@movie)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review updated successfully'
      redirect_to movie_reviews_path(@movie)
    else
      render :edit
    end
  end

  private

  def set_movie
    @movie = Movie.find params[:movie_id]
  end

  def review_params
    params.require(:review).permit(:content)
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end
end
