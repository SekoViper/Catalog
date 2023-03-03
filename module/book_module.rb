require_relative '../book'
require_relative '../item'
require 'json'

module BookModule
  def fetch_books
    books_json = File.read('./saved/books.json')
    JSON.parse(books_json)
  end

  def add_book
    publisher = ask_question('Name of the publisher: ')
    cover_state = ask_question('Cover_state(hint: bad/good): ') until %w[bad good].include?(cover_state)
    publish_date = ask_question('Publish_date(yyyy/dd/mm): ')
    book = { 'publisher' => publisher, 'cover_state' => cover_state, 'publish_date' => publish_date }
    add_label(Book.new(book['publisher'], book['cover_state'], book['publish_date']))
    store_book(book)
    puts 'Books created successfully'
  end

  def store_book(book)
    books = fetch_books

    books << book

    File.write('./saved/books.json', JSON.generate(books), mode: 'w')
  end

  def list_all_books
    books = fetch_books

    return puts 'There are no books stores' if books.empty?

    books.each do |book|
      puts "Publisher: #{book['publisher']}, Cover_state: #{book['cover_state']}, Publish_date: #{book['publish_date']}"
    end
  end
end
