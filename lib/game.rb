# frozen_string_literal: true

require_relative 'player'
require_relative 'jobs'
require_relative 'message_display'
require_relative 'string'

# Template for a new Game Object
class Game
  include Jobs
  include MessageDisplay

  attr_reader :breaker, :creator, :is_repeatable, :number_of_slots,
              :max_number_of_rounds, :secret_code, :codes_in_use, :game_round

  JOBS = ['Code Breaker', 'Code Creator'].freeze

  VALID_COLORS = ['1'.bg_red, '2'.bg_green, '3'.bg_blue, '4'.bg_brown, '5'.bg_magenta,
                  '6'.bg_cyan].freeze

  def initialize
    @game_round = 0
    @breaker = Player.new(JOBS[0])
    @creator = Player.new(JOBS[1])

    define_rules_of_the_game

    @secret_code = create_code
  end

  def play
    display_heading_of_game
    until game_round == 12
      @game_round += 1
      display_round_count

      guess = breaker.is_human ? human_play : computer_play
      won = check_code(guess)
      break if won
    end
    won ? display_winning_message(game_round) : display_lossing_message
  end

  private

  def human_play
    # It's human let's prompt
    player_input = ''
    loop do
      display_breaker_input_prompt
      player_input = gets.chomp.split('')
      break if valid_guess_input?(player_input)

      display_input_not_valid
    end
    player_input
  end

  def computer_play
    computer_guess = random_code_generator
    display_computer_guess(computer_guess)
    sleep(1)
    computer_guess
  end

  def define_rules_of_the_game
    # display_repeting_colors_prompt
    @is_repeatable = false
    # display_number_of_slots_prompt
    @number_of_slots = 4
    # display_number_of_colors_prompt
    number_of_colors = 6
    @codes_in_use = VALID_COLORS[0, number_of_colors].map(&:decolorize)
    # display_max_number_of_rounds_prompt
    @max_number_of_rounds = 12
  end
end
