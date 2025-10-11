# frozen_string_literal: true

def add(number_str)
  if number_str.strip == ''                                       # If an empty string
    0
  elsif number_str[0, 2] == '//'                                  # If an explicit delimiter is present
    ext_delimiter = extract_delimiter(number_str)
    process_numbers(ext_delimiter[0], ext_delimiter[1])
  elsif number_str.include?(',')                                  # If a general delimiter or a newline character is present
    process_numbers(number_str, /,|\n/)
  else                                                            # If a single number is present
    number_str.to_i
  end
end

# Method to process numbers having delimiters
def process_numbers(string_of_numbers, delimiter = ',')
  numbers_array_of_strings = string_of_numbers.split(delimiter)
  numbers_array_of_integers = numbers_array_of_strings.map(&:to_i)

  numbers_array = numbers_array_of_integers.select do |number|    # Return array of number under 1001
    number < 1001
  end 

  negative_numbers = []
  numbers_array.each do |num|                                     # Check for negative numbers
    negative_numbers << num if num.negative?
  end

  if negative_numbers.length.positive?
    error_message = 'negatives not allowed: '
    if negative_numbers.length == 1
      error_message += negative_numbers.first.to_s
    elsif negative_numbers.length > 1
      error_message += negative_numbers.to_s
    end
    raise error_message
  end
  
  # Return the sum of all the numbers of the array
  delimiter == "*" ? numbers_array.inject(1) { |result, element| result * element } : numbers_array.sum
end

# Method to extract delimiter
def extract_delimiter(number_str)
  full_string = number_str.split("\n")
  delimiter = full_string[0][-1]
  string_of_numbers = full_string[1]
  [string_of_numbers, delimiter]
end