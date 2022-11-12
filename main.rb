require_relative './lib/game'

loop do
  Game.new.play

  puts 'Wanna play again? [Y/N]'
  break if gets.chomp != 'Y'
end
