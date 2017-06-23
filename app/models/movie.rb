class Movie
  attr_accessor :title

  def initialize(title)
    self.title = title
  end

  def self.all
    Rating.all.map { |rating| rating.movie }.uniq
  end

  def self.find_by_title(title)
    self.all.map { |rating| rating.movie}.find { |movie| movie.title == title }
  end

  def ratings
    self.all.select { |rating| rating.movie == self }
  end

  def viewers
    self.all.select { |rating| rating.movie == self }.map { |rating|
    rating.viewer }.uniq
  end


  def average_rating
    ratings = Rating.all.select { |rating| rating.movie == self }
    ratings.map { |rating| rating.score }.reduce(:+)/ratings.size
  end

end
