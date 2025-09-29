def add(number_str)
  if number_str.strip == ''
    0
  else
    number_str.to_i
  end
end