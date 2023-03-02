class Game
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    date_now = Date.today
    pub_date = Date.parse(@publish_date)
    ((date_now - pub_date) / 365).floor > 10
  end
end
