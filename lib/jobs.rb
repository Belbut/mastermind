# frozen_string_literal: true

# Module with the two possible jobs in the game
# The CodeCreator and the CodeBreaker
module Jobs
  # Job with all the logic of CodeCreator

  # Give feed back regarding the input of CodeBreaker
  def check_code(code)
    code_clone = code.dup
    secret_code_clone = secret_code.dup # needed in case we accept duplicates

    correct_color_and_position = 0
    correct_color = 0

    secret_code.each_with_index do |element, index|
      next unless element == code_clone[index]

      correct_color_and_position += 1
      code_clone.delete_at(index)
      secret_code_clone.delete_at(index)
    end

    code_clone.each do  |element|
      first_ocurrence = secret_code_clone.find_index(element)
      unless first_ocurrence.nil?
        correct_color += 1
        secret_code_clone.delete_at(first_ocurrence)
      end
    end
    display_round_feedback(code, correct_color_and_position, correct_color)
  end

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
      Array.new(number_of_slots) { codes_in_use.sample }
    else
      codes_in_use.sample(number_of_slots)
    end
  end
end
