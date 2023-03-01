require_relative 'item'
class Genre < Item
  attr_accessor :id, :name, :items

  def initialize(name)
    super(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def list_all_genres
    puts 'No Genres added!' if @items.empty?
    @items.each { |item| puts (item['genre']).to_s }
    puts ''
  end
end
