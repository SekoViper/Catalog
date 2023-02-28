require './app'

def main
  puts 'Welcome to our Catalag'
  app = App.new

  loop do
    puts ['Choose an Option by entering a Number',
          '1. List all Books', '2. List all Music Albums',
          '3. List all Games', '4. List all Genres', '5. List all labels',
          '6. List all Authors', '7. Add a Book', '8. Add a Music Album',
          '9. Add a Game', '10. Exit']

    num = gets.chomp
    if num == '10'
      puts 'Thank you for using out app'
      break
    elsif (1...10).include?(num.to_i)
      app.options[:"#{num}"].call
    else
      puts 'Please Enter a valid Input: Hint 1-10'
    end
  end
end

main
