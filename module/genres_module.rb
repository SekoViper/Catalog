require_relative '../genre'
require_relative '../item'
require 'json'

module GenresModule
  def fetch_genres
    genres_json = File.read('./saved/genres.json')
    JSON.parse(genres_json)
  end

  def add_genre(name)
    genre = { 'name' => name }
    add_label(Genre.new(genre['name']))
    store_genre(genre)
  end

  def store_genre(genre)
    genres = fetch_genres
    new_genre = { 'id' => 1, 'name' => genre['name'] }

    unless genres.empty?
      last_genre = genres.last
      new_genre['id'] = last_genre['id'] + 1 if last_genre['id']
    end

    genres << new_genre
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
