puts "It's time for Blackjack. I am your host. Please enter your name."

name = gets.chomp.capitalize

puts "Hello #{name}! Welcome to Blackjack. Let's get started."

def player_total(cards)
 arr = cards.map{|e| e[1]}
 total = 0

 arr.each do |value|
  if value.to_i == 0
    total += 10
  elsif value == "A"
    total += 11
  else
    total += value.to_i 
  end
 
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

 total 
end

suits =["hearts", "spades", "diamonds", "clubs"]
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
deck = suits.product(cards) 

deck.shuffle!

player_cards=[]
dealer_cards=[]


player_cards << deck.pop 
player_cards << deck.pop
dealer_cards << deck.pop
dealer_cards << deck.pop


dealer_total=player_total(dealer_cards)
player_total=player_total(player_cards)


puts "You now have #{player_cards[0]} and #{player_cards[1]}."
puts "The dealer shows a card of #{dealer_cards[0]}."


while player_total < 21 
 puts 'Please type hit or stay.'
 answer = gets.chomp.downcase 
 if answer == 'stay'
   puts "You will stay."
 break
 end

 if answer == 'hit'
     new_card = deck.pop
     player_cards << new_card
   puts "You have just been dealt #{new_card}."
     player_total = player_total(player_cards)
   puts "Your total is now #{player_total}."
     if player_total > 21
       puts "Sorry, you busted, your total is over 21."
       puts "Come back and try again."
       exit
     elsif player_total == 21
       puts "Congratulations, you have won! Your total is 21!"
       exit
     end
  end
end


while dealer_total < 17
   new_card = deck.pop
   dealer_cards << new_card
   dealer_total=player_total(dealer_cards) 
    puts "The dealer total is #{dealer_total}, after receiving a #{new_card}."
  
  if dealer_total == 21
    puts "The dealer has hit blackjack with #{dealer_cards[0]}, #{dealer_cards[1]}, #{dealer_cards[2]} for a total of #{dealer_total}."
    puts "Thanks for playing Blackjack. Come back and play again."
    exit
  elsif dealer_total > 21
    puts 'The dealer is over 21, you win!'
    puts "Thanks for playing Blackjack. Come back and play again."
    exit
  end
end

while dealer_total && player_total <=21
  if dealer_total > player_total && dealer_total < 22
      puts "Dealer's total is #{dealer_total} and your total is #{player_total}. The dealer wins."
      break
  elsif player_total > dealer_total && player_total < 22
      puts "Your total is #{player_total} and the dealer's total is #{dealer_total}. You're a winner!"
      break
  else player_total == dealer_total
      puts "Your total is #{player_total} and the dealer total is #{dealer_total}. It's a tie."
      puts "Thanks for playing Blackjack. Come back and play again."
      exit
  end
end

