class MoviesController < ApplicationController
  has_scope :by_year_range, using: %i[min_year max_year], type: :hash
  has_scope :by_keyword
  def index
    @movies = apply_scopes(Movie).all
  end
end
