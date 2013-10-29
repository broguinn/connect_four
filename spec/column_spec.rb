require 'rspec'
require 'token'
require 'player'
require 'column'

describe Column do 
  it "is initialized with a position argument and a max height argument" do
    column = Column.new(1, 7)
    column.should be_an_instance_of Column
  end

  it "has a position" do
    column = Column.new(7, 7)
    column.position.should eq 7
  end

  it "has a max height" do 
    column = Column.new(7, 6)
    column.max_height.should eq 6
  end

  it "has a a collection of slots" do
    column = Column.new(2, 5)
    column.slots.should eq []
  end

  describe 'add_token' do 
    it "adds a token to slots" do 
      column = Column.new(2, 5)
      column.add_token("&")
      column.slots.first.should be_an_instance_of Token
    end

    it "adds a token to the end of slots" do 
      column = Column.new(2, 5)
      column.add_token("&")
      column.add_token("$")
      column.slots.last.symbol.should eq "$"
    end
  end

  describe 'full?' do 
    it 'is false if slots has not reached the max height' do 
      column = Column.new(2, 5)
      column.full?.should eq false
    end

    it 'is true if the slots has reached the maximum' do
      column = Column.new(2, 2)
      column.add_token("&")
      column.add_token("$")
      column.full?.should eq true
    end
  end
end