require 'minitest/autorun'
#require_relative '../music_album'
require_relative '../genre'

class GenreTest < Minitest::Test
  def setup
    @genre = Genre.new('Rock')
    #@music_album = MusicAlbum.new(true)
  end

  def test_genre_add_item_adds_item_to_collection_of_items
    #@genre.add_item(@music_album)
    #assert_equal [@music_album], @genre.items
  end

  def test_genre_add_item_sets_genre_property_of_item
   # @genre.add_item(@music_album)
    #assert_equal @genre, @music_album.genre
  end
end
