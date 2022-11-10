# frozen_string_literal: true

require_relative 'message_display'
require_relative 'jobs'

# Creates Mastermind players
# The player can either be the guesser or the guard
class Player
  include MessageDisplay
  include Jobs

  attr_reader :name, :job, :is_human

  def initialize(job)
    @job = job
    @is_human = human?
    display_created_player_greting

  end

  private

  def human?
    display_name_prompt
    input = gets.chomp
    if input.empty?
      @name = 'Computer'
      false
    else
      @name = input
      true
    end
  end
end
