require_relative './module/book_module'
require_relative './module/label_module'
class App
  attr_reader :options

  include BookModule
  include LabelModule

  def initialize
    @options = {
      '1': method(:list_all_books),
      # '2': method(:list_all_music_albums),
      # '3': method(:list_all_games),
      # '4': method(:list_all_genres),
      '5': method(:list_all_labels),
      # '6': method(:list_all_authors),
      '7': method(:add_book)
      # '8': method(:add_music_album),
      # '9': method(:add_music_game)
    }
  end

  def ask_question(question)
    print question
    gets.chomp
  end
end
