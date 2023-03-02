require 'date'
class Game
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    parent_result = super
    date_now = Date.today
    last_played_at = Date.parse(@last_played_at)
    parent_result && ((date_now - last_played_at) / 365).floor > 2
  end
end
