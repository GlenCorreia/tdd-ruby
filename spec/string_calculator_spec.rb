require 'string_calculator.rb'

describe 'String Calculator: ' do 
  it 'returns 0 for an empty string' do 
    expect(add('')).to eq(0)
  end
end