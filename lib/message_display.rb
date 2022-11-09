# Module with all Message send by the game
module MessageDisplay
  def display_intro
    puts "Let's play a simple Mastermind game in the console! \n\n"
  end

  def display_name_prompt
    puts 'If left blank computer will play for this player'
    puts "What should be the name of the #{job}?"
  end

  def display_job_prompt
    puts "What should be the job of the player #{name}?"
  end

  def display_created_player_greting
    puts "Player #{name} created, he will play has #{job}\n\n"
  end
end
