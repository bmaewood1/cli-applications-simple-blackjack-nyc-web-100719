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
  
end

describe "#runner" do
  before(:each) do
    def get_user_input
      "h"
    end 
  end

  it "calls on the #welcome method, 
  then on the #initial_round method, 
  then calls #hit? and #display_card_total methods
  -until- the card sum is greater than 21,
  then calls on the #end_game method" do

    expect(self).to receive(:deal_card).at_least(3).times.and_return(10)
    expect(self).to receive(:get_user_input).and_return("h")

    expect($stdout).to receive(:puts).with("Welcome to the Blackjack Table")
    expect($stdout).to receive(:puts).with("Your cards add up to 20")
    expect($stdout).to receive(:puts).with("Type 'h' to hit or 's' to stay")
    expect($stdout).to receive(:puts).with("Your cards add up to 30")
    expect($stdout).to receive(:puts).with("Sorry, you hit 30. Thanks for playing!")
    runner
  end
end

    
