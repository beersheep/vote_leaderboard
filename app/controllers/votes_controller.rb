class VotesController < ApplicationController

  def create
    # parmas[:vote_count] nad params[name] are considered arrays
    
    params[:name].each_with_index do |name, idx|
      REDIS.zincrby("POLL:#{params[:sector]}", params[:vote_count][idx].to_i, name)
    end

    VoteCountingJob.perform_later(params[:sector])
  end
end
