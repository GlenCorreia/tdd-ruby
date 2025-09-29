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
end