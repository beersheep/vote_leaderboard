class VoteLeaderboardController < ApplicationController
  
  SECTORS = ["t1", "t2"]

  def show
    @sectors = SECTORS.each_with_object([]) do |sector_name, arr|
      arr << Sector.new(sector_name)
    end
  end
end
