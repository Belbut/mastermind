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

  def display_repeting_colors_prompt
    puts "Do you wan't to enable the possibility to repeate the colors?"
  end

  def display_sequence_prompt
    puts 'Chose your sequence'
  end

  def display_blank_prompt
    puts "Do you wan't to enable the possibility to use blank spaces?"
  end

  def display_reset
    system('cls') || system('clear')
  end

  def display_heading_of_game
    display_reset
    puts " ____________Mastermind made by Belbut____________ \n\n"
    puts "Code Creator is: #{creator.name}"
    puts "Code Breaker is: #{breaker.name}"
    puts "Colors available: #{code_to_color_display(codes_in_use)}"
    puts is_repeatable ? 'The colors CAN repeat' : 'The colors can NOT repeat'
    puts "The code has #{number_of_slots} slots"
    puts 'Feedbak means: ■ - Correct color and position   □ - Correct color'
    p secret_code
  end

  def display_breaker_input_prompt
    puts " #{breaker.name} what code sequence do you want to try?"
  end

  def display_in_line(codes_array)
    message = ''
    codes_array.each { |color| message << color }
    message
  end

  def display_round_count
    puts '__________________________________________'
    puts "Round number #{game_round}/#{max_number_of_rounds}"
  end

  def display_computer_guess(computer_guess)
    print "Computer guess: #{display_in_line(computer_guess)}\n"
  end

  def display_round_feedback(code_tested, white_squares, black_squares)
    puts "#{code_to_color_display(code_tested)} #{'■ ' * white_squares} #{'□ ' * black_squares}"
  end

  def display_input_not_valid
    puts 'Invalid input please follow the requirements presented on the beginning of the terminal'
  end

  def display_winning_message(round)
    puts "Congratulations you craked the code in #{round} round"
  end

  def display_lossing_message
    puts "Sorry, you failed in cracking the code. The code was: #{secret_code.join}"
  end

  def display_coder_input_prompt
    puts "#{creator.name} please enter the desired code:"
  end

  private

  def code_to_color_display(code_array)
    display_in_line(code_array.map { |code| Game::VALID_COLORS[code.to_i - 1] })
  end
end
