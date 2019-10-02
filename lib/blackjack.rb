def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1...11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  input = gets.chomp
end

def end_game(num)
  puts "Sorry, you hit #{num}. Thanks for playing!"
end

def invalid_command
  puts "Please enter a valid command"
end

def initial_round
  card1 = deal_card
  card2 = deal_card
  sum = card1 + card2
  display_card_total(sum)
  return sum
end

def hit?(current_card_tot)
  prompt_user
  input = get_user_input
  if input == 's'
    return current_card_tot
  elsif input == 'h'
    new_card = deal_card
    return current_card_tot + new_card
  else
    invalid_command
    prompt_user
    input = get_user_input
  end
end



#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  initial_round
  hit?
  display_card_total
    until num > 21
      runner
    end
  end_game
end

