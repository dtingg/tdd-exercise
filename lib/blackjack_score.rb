# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  face_cards = ["King", "Queen", "Jack"]
  number_cards = [ 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
  total = 0
  
  hand.each do |card|
    if face_cards.include?(card)
      total += 10
    elsif number_cards.include?(card)
      total += card
    elsif card == "Ace"
      if total + 11 <= 21
        total += 11
      else
        total += 1
      end
    else raise ArgumentError.new("#{card} is not a valid card.")
    end
  end
  
  if total > 21
    raise ArgumentError.new("Sorry, you busted!")
  end
  
  return total
  
end
