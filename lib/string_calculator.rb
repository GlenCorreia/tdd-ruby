def add(number_str)
  if number_str.strip == ''
    0
  elsif number_str[0,2] == "//"
    numbers_with_delimiter = number_str.split("\n")
    delimiter = numbers_with_delimiter[0][-1]
    array = numbers_with_delimiter[1]
    numbers_array_of_strings = number_str.split(delimiter)
    numbers_array_of_integers = numbers_array_of_strings.map(&:to_i)
    total = numbers_array_of_integers.sum
  elsif number_str.include? (',')
    numbers_array_of_strings = number_str.split(/,|\n/)
    numbers_array_of_integers = numbers_array_of_strings.map(&:to_i)
    total = numbers_array_of_integers.sum
  else
    number_str.to_i
  end
end