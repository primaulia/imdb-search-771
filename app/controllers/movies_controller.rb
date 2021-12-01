class MoviesController < ApplicationController
  def index
    # check if params[:query]

    if params[:query].present?
      # SELECT * FROM movies WHERE title="superman"
      @movies = Movie.by_keyword(params[:query])
    else
      @movies = Movie.all
    end

  end
end
