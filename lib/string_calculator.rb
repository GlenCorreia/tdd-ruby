# frozen_string_literal: true

def add(number_str)
  if number_str.strip == ''
    0
  elsif number_str[0, 2] == '//'
    numbers_with_delimiter = number_str.split("\n")
    delimiter = numbers_with_delimiter[0][-1]
    string_of_numbers = numbers_with_delimiter[1]
    process_numbers(string_of_numbers, delimiter)
  elsif number_str.include?(',')
    process_numbers(number_str, /,|\n/)
  else
    number_str.to_i
  end
end

def process_numbers(string_of_numbers, delimiter = ',')
  numbers_array_of_strings = string_of_numbers.split(delimiter)
  numbers_array_of_integers = numbers_array_of_strings.map(&:to_i)
  numbers_array = numbers_array_of_integers.select { |number| number < 1001 } # return array of number under 1001
  negative_numbers = []
  numbers_array.each do |num|
    negative_numbers << num if num.negative?
  end
  if negative_numbers.length.positive?
    error_message = ''
    if negative_numbers.length == 1
      error_message += "negatives not allowed: #{negative_numbers.first}"
    elsif negative_numbers.length > 1
      error_message += "negatives not allowed: #{negative_numbers}"
    end

    raise error_message
  end
  numbers_array.sum
end
