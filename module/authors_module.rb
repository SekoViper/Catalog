require_relative '../author'
require_relative '../item'
require 'json'

module AuthorModule
  def fetch_authors
    author_json = File.read('./saved/authors.json')
    JSON.parse(author_json)
  end

  def add_author(author)
    store_author(author)
  end

  def store_author(author)
    authors = fetch_authors
    puts 'authors' if authors.empty?
    unless authors.find { |obj| obj.first_name == author.first_name && obj.last_name == author.last_name }
      authors << author
      File.write('./saved/authors.json', JSON.generate(authors), mode: 'w')
      puts 'Author saved successfuly'
      return
    end
    puts 'Author already exists'
  end

  def list_all_authors
    authors = fetch_authors
    return puts 'There are no Authors saved' if authors.empty?

    authors.each do |author|
      puts "First Name: #{author['first_name']}, Last Name: #{author['last_name']}"
    end
  end
end
