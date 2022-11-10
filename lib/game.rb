# frozen_string_literal: true

require_relative 'player'
require_relative 'jobs'
require_relative 'message_display'

# Template for a new Game Object
class Game
  include Jobs
  include MessageDisplay

  attr_reader :breaker, :creator, :is_repeatable, :number_of_slots,
              :number_of_rounds, :secret_code, :colors_in_use

  JOBS = ['Code Breaker', 'Code Creator'].freeze
  VALID_COLORS = %w[RED GREEN YELLOW BLUE PURPLE PINK BROWN BLACK].freeze


  def initialize
    @breaker = Player.new(JOBS[0])
    @creator = Player.new(JOBS[1])

    define_rules_of_the_game

    @secret_code = create_code
  end

  private

  def define_rules_of_the_game
    # display_repeting_colors_prompt
    @is_repeatable = false
    # display_number_of_slots_prompt
    @number_of_slots = 4
    # display_number_of_colors_prompt
    number_of_colors = 6
    @colors_in_use = VALID_COLORS[1..number_of_colors]
    # display_number_of_rounds_prompt
    @number_of_rounds = 12
  end

  public

  def play_game; end
end
