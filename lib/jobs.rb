# frozen_string_literal: true

# Module with the two possible jobs in the game
# The CodeCreator and the CodeBreaker
module Jobs
  def valid_input?(input)
    # wrong input size
    return false if input.size != number_of_slots
    # repeates values when it shouldn't
    return false if !is_repeatable && input.size > input.uniq.size
    # uses values outside of the codes in use
    return false if input.select { |element| codes_in_use.include?(element) }.size != input.size

    true
  end

  def create_code
    if creator.is_human
      player_code_generator
    else
      random_code_generator
    end
  end

  def check_code(code)
    white_hash = white_number_check_code(code)
    black_number = black_number_check_code(white_hash[:code_clone], white_hash[:secret_code_clone])

    display_round_feedback(code, white_hash[:white_number], black_number)

    code == secret_code
  end

  private

  def player_code_generator
    display_coder_input_prompt
    player_input = ''
    loop do
      player_input = gets.chomp.split('')
      break if valid_input?(player_input)

      display_input_not_valid
    end
    player_input
  end

  # return a hash with needed information for white square

  def white_number_check_code(code)
    code_clone = code.dup
    secret_code_clone = secret_code.dup
    index_list = []
    # identify all indexes that the elemente is equal to the secret key element
    secret_code.each_with_index do |element, index|
      index_list << index if element == code_clone[index]
    end

    { white_number: index_list.size,
      code_clone: reject_indexes(code_clone, index_list),
      secret_code_clone: reject_indexes(secret_code_clone, index_list) }
  end

  def black_number_check_code(code_after_white, secret_code_after_white)
    secret_code_clone = secret_code_after_white.dup
    correct_color = 0

    code_after_white.each do |element|
      first_ocurrence = secret_code_clone.find_index(element)
      unless first_ocurrence.nil?
        correct_color += 1
        secret_code_clone.delete_at(first_ocurrence)
      end
    end
    correct_color
  end

  def reject_indexes(initial_array, list_of_index)
    initial_array.reject.with_index { |_, i| list_of_index.include? i }
  end

  def random_code_generator
    if is_repeatable
      Array.new(number_of_slots) { codes_in_use.sample }
    else
      codes_in_use.sample(number_of_slots)
    end
  end
end
