# frozen_string_literal: true

# Module with the two possible jobs in the game
# The CodeCreator and the CodeBreaker
module Jobs
  # Job with all the logic of CodeCreator

  # Give feed back regarding the input of CodeBreaker
  def check_code; end

  # Return an array
  def create_code
    if creator.is_human
      puts 'lets prompt for the code'
    else
      # not a human create random code following all the rules
      random_code_generator
    end
  end

  private

  def random_code_generator
    if is_repeatable
      Array.new(number_of_slots) { colors_in_use.sample }
    else
      colors_in_use.sample(number_of_slots)
    end
  end
end
