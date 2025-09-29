require 'string_calculator.rb'

describe 'String Calculator: ' do 
  it 'returns 0 for an empty string' do 
    expect(add('')).to eq(0)
    expect(add('   ')).to eq(0)
  end

  it 'returns the single number as is' do 
    expect(add('3')).to eq(3)
    expect(add('4')).to eq(4)
    expect(add('   5      ')).to eq(5)
  end

  it 'adds comma seperated numbers' do 
    expect(add('1,2,3,4')).to eq(10)
    expect(add('4,4,4 ')).to eq(12)
    # Check if sum of numbers from 1 to 100 is equal to 5050
    hundred_nos = (1..100).to_a.join(',')
    expect(add(hundred_nos)).to eq(5050)
  end

  it 'allows to handle new line between numbers' do 
    expect(add("1\n2,3")).to eq(6)
    expect(add("1,2\n3,4\n5,6\n7,8")).to eq(36)
  end
end