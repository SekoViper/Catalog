require_relative '../game'
require 'json'

module GamesModule
  def fetch_games
    games_json = File.read('./saved/games.json')
    JSON.parse(games_json)
  end

  def list_all_games
    games = fetch_games
    return puts 'There are no games stored' if games.empty?

    games.each do |game|
      puts "Type:#{game['multiplayer']}  LastPlayed:'#{game['last_played_at']}'"
    end
  end

  def store_game(game)
    games = fetch_games
    games << game
    File.write('./saved/games.json', JSON.generate(games), mode: 'w')
    puts 'Game saved successfuly'
  end

  def add_game
    first_name = ask_question('first_name: ')
    last_name = ask_question('last_name: ')
    multiplayer = ask_question('Multiplayer: ')
    last_played_at = ask_question('Last played at(yyyy/dd/mm): ')
    game = { 'multiplayer' => multiplayer, 'last_played_at' => last_played_at }
    author = { 'first_name' => first_name, 'last_name' => last_name }
    add_author(author)
    store_game(game)
    puts 'Game created successfully'
  end
end
