require 'string_calculator.rb'

describe 'String Calculator: ' do 
  it 'returns 0 for an empty string' do 
    expect(add('')).to eq(0)
    expect(add('   ')).to eq(0)
  end

  it 'returns the single number as is' do 
    expect(add('1')).to eq(1)
    expect(add('4')).to eq(4)
    expect(add('   5      ')).to eq(5)
  end

  it 'adds comma seperated numbers' do 
    expect(add('1,5')).to eq(6)
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

  it 'supports different delimiters' do 
    expect(add("//;\n1;2;3;4")).to eq(10)
    expect(add("//-\n9-9-9")).to eq(27)
    expect(add("//>\n100>200")).to eq(300)
  end

  it 'raises exception when negative number is passed' do 
    expect{add('-1,3,4')}.to raise_error(RuntimeError, "negatives not allowed: -1")
    expect{add('45,-67,9')}.to raise_error(RuntimeError, "negatives not allowed: -67")
    expect{add('-1,2,-33,5')}.to raise_error(RuntimeError, "negatives not allowed: [-1, -33]")
    expect{add('-1,99,-999,-9999')}.to raise_error(RuntimeError, "negatives not allowed: [-1, -999, -9999]")
  end
end