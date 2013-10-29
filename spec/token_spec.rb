require 'rspec'
require 'token'
require 'column'
require 'player'

describe Token do
  it 'is an instance of the Token class' do
    token = Token.new
    token.should be_an_instance_of Token
  end

  it 'has an x coordinate' do
    token = Token.new(2)
    token.column_number.should eq 2
  end

  it 'has a row number' do 
    token = Token.new(2, 1)
    token.row_number.should eq 1
  end

  it 'has a symbol' do
    token = Token.new(1, 1, "&")
    token.symbol.should eq "&"
  end
end