class MoviesController < ApplicationController
  def index
    # check if params[:query]

    if params[:query].present?
      # SELECT * FROM movies WHERE title="superman"
      if params[:min_year].blank?
        @movies = Movie.by_keyword(params[:query])
      else
        @movies = Movie.by_keyword(params[:query]).by_year_range(params[:min_year], params[:max_year])
      end
    else
      @movies = Movie.all
    end

  end
end
