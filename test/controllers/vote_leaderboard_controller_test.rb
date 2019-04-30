require 'test_helper'

class VoteLeaderboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get vote_leaderboard_show_url
    assert_response :success
  end

end
