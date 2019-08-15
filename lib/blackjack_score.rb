# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  face_cards = ["King", "Queen", "Jack"]
  number_cards = [ 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
  base_score = 0
  aces = 0
  
  if hand.length < 2 || hand.length > 5
    raise ArgumentError.new("You don't have the right number of cards.")
  end
  
  hand.each do |card|
    if face_cards.include?(card)
      base_score += 10
    elsif number_cards.include?(card)
      base_score += card
    elsif card == "Ace"
      aces += 1
    else 
      raise ArgumentError.new("#{card} is not a valid card.")
    end
  end
  
  total_score = base_score
  
  aces.times do
    if total_score + 11 <= 21
      total_score += 11
    else
      total_score += 1
    end
  end
  
  if total_score > 21
    if aces > 0
      total_score = base_score + aces
    end
  end
  
  if total_score > 21
    raise ArgumentError.new("Sorry, you busted!")
  end
  
  return total_score
end
