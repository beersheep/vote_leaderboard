class VoteLeaderboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vote_leaderboard_channel"
  end
end
