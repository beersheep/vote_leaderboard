class VoteLeaderboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vote_leaderboard_channel"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def count(data)
    ActionCable.server.broadcast "vote_leaderboard_channel", message: data["message"]
  end
end
