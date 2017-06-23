# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end


  def self.all
    Rating.all.map { |rating| rating.viewer }.uniq
  end

  def self.find_by_name(full_name)
    self.all.map { |rating|
      rating.viewer}.find { |viewer|
      viewer.full_name == full_name }
  end

  def create_rating(movie, score, viewer)
    rating = Rating.new(movie, score, self)
    rating
  end
end


class Rating
  attr_accessor :score, :viewer, :movie

  @@all = []

  def initialize(movie, score, viewer)
    @movie = movie
    @score = score
    @viewer = viewer
    @@all << self
  end


  def self.all
    @@all
  end

end




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
    Rating.all.select { |rating| rating.movie == self }
  end

  def viewers
    Rating.all.select { |rating| rating.movie == self }.map { |rating|
    rating.viewer }.uniq
  end


  def average_rating
    ratings = Rating.all.select { |rating| rating.movie == self }
    ratings.map { |rating| rating.score }.reduce(:+)/ratings.size
  end

end
