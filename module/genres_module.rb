require_relative '../genre'
require_relative '../item'
require 'json'

module GenresModule
  def fetch_genres
    books_json = File.read('./saved/genres.json')
    JSON.parse(books_json)
  end

  def add_genre(name)
    genre = { 'name' => name }
    add_label(Genre.new(genre['name']))
    store_genre(genre)
  end

  def store_genre(genre)
    genres = fetch_genres
    return if genres.find { |genre| genre.name == genre }

    genres << genre
    File.write('./saved/genres.json', JSON.generate(genres), mode: 'w')
    nil
  end

  def list_all_genres
    genres = fetch_genres
    return puts 'There are no genres stored' if genres.empty?

    genres.each do |genre|
      puts "ID:#{genre['id']} Name:'#{genre['name']}'"
    end
  end
end
