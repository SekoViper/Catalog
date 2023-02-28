require 'date'
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    date_now = Date.today
    pub_date = Date.parse(@publish_date)
    ((date_now - pub_date) / 365).floor > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
