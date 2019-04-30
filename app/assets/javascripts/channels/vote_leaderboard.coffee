App.vote_leaderboard = App.cable.subscriptions.create "VoteLeaderboardChannel",
  received: (data) ->
    sector_table = $("##{data["sector_name"]}")

    sector_table.html(data["template"])
