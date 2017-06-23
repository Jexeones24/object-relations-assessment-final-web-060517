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
