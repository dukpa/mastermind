require './game'

puts "Welcome to Mastermind."
puts "Guess the 4 digit code."
puts "Each number is only used once."
puts "* indicates the correct number int he correct place."
puts "_ indicates the correct number in the wrong place."
puts ""
puts "Options:"
puts "1 - Human player"
puts "2 - Computer player"

option = gets.chomp

if option == "1"
  puts "You will be the player."
  Game.start(true)
elsif option == "2"
  puts "You will be the mastermind."
  Game.start(false)
else
  puts "Enter a valid option."
end