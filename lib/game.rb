# frozen_string_literal: true

require_relative 'player'

# Template for a new Game Object
class Game
  attr_reader :breaker, :creator

  JOBS = ['Code Breaker', 'Code Creator'].freeze

  def initialize
    @breaker = Player.new(JOBS[0])
    @creator = Player.new(JOBS[1])
  end
end
