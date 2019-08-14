require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    
    # Arrange
    hand = [3, 4]
    
    # Act
    score = blackjack_score(hand)
    
    # Assert <-  You do this part!
    expect(score).must_equal 7
    
  end
  
  it 'facecards have values calculated correctly' do
    
    # Arrange
    hand = ["King", 5]
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 15
    
  end
  
  it 'calculates aces as 11 where it does not go over 21' do
    
    # Arrange
    hand = ["King", "Ace"]
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 21
    
  end
  
  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Arrange
    hand = ["King", 5, "Ace"]
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 16
    
  end
  
  it 'raises an ArgumentError for invalid cards' do
    expect {blackjack_score(["Joker", 6])}.must_raise ArgumentError
  end
  
  it 'raises an ArgumentError for scores over 21' do
    expect {blackjack_score(["Queen", 10, 5])}.must_raise ArgumentError
  end
  
  it "raises an ArgumentError for hands less than 2 cards" do
    expect {blackjack_score(["Queen"])}.must_raise ArgumentError
  end
  
  it "raises an ArgumentError for hands more than 5 cards" do
    expect {blackjack_score([3, 10, 5, 2, 4, 6])}.must_raise ArgumentError
  end
  
  it "will change Aces to one in order to prevent a bust" do
    # Arrange
    hand = ["Ace", 5, 4, "Ace", "Ace"]
    
    # Act
    score = blackjack_score(hand)
    
    # Assert
    expect(score).must_equal 12
  end
  
end
