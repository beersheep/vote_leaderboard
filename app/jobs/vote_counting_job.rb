class VoteCountingJob < ApplicationJob
  queue_as :default

  def perform(sector)
    ActionCable.server.broadcast("vote_leaderboard_channel", template: render_html(sector), sector_name: sector)
  end

  private

  def render_html(sector)
    ApplicationController.render(
      partial: 'vote_leaderboard/sector_vote_count',
      locals: { sector: Sector.new(sector) }
    )
  end
end

