require_relative './module/book_module'
require_relative './module/label_module'
require_relative './module/genres_module'
require_relative './module/music_album_module'
require_relative './module/games_module'
require_relative './module/authors_module'

class App
  attr_reader :options

  include BookModule
  include LabelModule
  include GenresModule
  include MusicAlbumModule
  include GamesModule
  include AuthorModule

  def initialize
    @options = {
      '1': method(:list_all_books),
      '2': method(:list_all_music_albums),
      '3': method(:list_all_games),
      '4': method(:list_all_genres),
      '5': method(:list_all_labels),
      '6': method(:list_all_authors),
      '7': method(:add_book),
      '8': method(:add_music_album),
      '9': method(:add_game)
    }
  end

  def ask_question(question)
    print question
    gets.chomp
  end
end
