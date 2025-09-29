def add(number_str)
  if number_str.strip == ''
    0
  elsif number_str.include? (',')
    numbers_array_of_strings = number_str.split(',')
    numbers_array_of_integers = numbers_array_of_strings.map(&:to_i)
    total = numbers_array_of_integers.sum
  else
    number_str.to_i
  end
end