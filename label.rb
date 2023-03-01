require_relative 'item'
class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    # super(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
