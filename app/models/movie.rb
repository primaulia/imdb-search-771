class Movie < ApplicationRecord
  belongs_to :director

  def director_full_name
    "#{director.first_name} #{director.last_name}"
  end

  scope :by_keyword, -> (given_keyword) do
    sql_query = " \
      movies.title ILIKE ? \
      OR movies.synopsis ILIKE ? \
      OR directors.first_name ILIKE ? \
      OR directors.last_name ILIKE ? \
    "

    joins(:director).where(sql_query, "%#{given_keyword}%", "%#{given_keyword}%", "%#{given_keyword}%", "%#{given_keyword}%")
  end
end
