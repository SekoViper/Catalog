require_relative '../music_album'
require_relative '../item'
require 'json'

module MusicAlbumModule
  def fetch_music_albums
    music_albums_json = File.read('./saved/music_albums.json')
    JSON.parse(music_albums_json)
  end

  def add_music_album
    title = ask_question('Title: ')
    artist = ask_question('Artist: ')
    year = ask_question('Year: ')
    genre = ask_question('Genre: ')

    album = { 'title' => title, 'artist' => artist, 'year' => year, 'genre' => genre }
    add_label(MusicAlbum.new(album))
    store_music_album(album)
    add_genre(genre)
  end

  def store_music_album(album)
    albums = fetch_music_albums
    unless albums.find { |obj| obj['title'] == album['title'] }
      albums << album
      File.write('./saved/music_albums.json', JSON.generate(albums), mode: 'w')
      puts 'Music Album saved successfully'
      return
    end
    puts 'Music Album already exists'
  end

  def list_all_music_albums
    albums = fetch_music_albums
    return puts 'There are no Music albums stored' if albums.empty?

    albums.each do |album|
      puts "Title:#{album['title']} Artist:'#{album['artist']}' Year:'#{album['year']}' Genre:'#{album['genre']}'"
    end
  end
end
