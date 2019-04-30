class Sector
  attr_reader :name

  def initialize(name)
    @name = name 
  end

  def get_votes
    @votes = REDIS.zrange("POLL:#{@name}", 0, -1, with_scores: true).reverse
  end
end
