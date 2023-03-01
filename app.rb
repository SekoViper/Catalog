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
<<<<<<< HEAD
      '7': method(:add_book)
=======
      '7': method(:add_book),
>>>>>>> 5d3d71db752a375159c0fb7f30f3e5e34a8ff136
      # '8': method(:add_music_album),
      # '9': method(:add_music_game)
    }
  end

  def ask_question(question)
    print question
    gets.chomp
  end

end
