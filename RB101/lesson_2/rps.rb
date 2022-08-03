# rock paper scissors game against computer
require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)

ABREVIATION = { "r" => "rock",
                "p" => "paper",
                "sc" => "scissors",
                "sp" => "spock",
                "l" => "lizard" }

WINNING_MOVES = { "rock" => ["scissors", "lizard"],
                  "paper" => ["spock", "rock"],
                  "scissors" => ["lizard", "paper"],
                  "lizard" => ["paper", "spock"],
                  "spock" => ["scissors", "rock"] }

def new_line
  puts "\n"
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player_choice, computer_choice)
  WINNING_MOVES[player_choice].include?(computer_choice)
end

def display_results(player_choice, computer_choice)
  if player_choice == computer_choice
    prompt("It's a tie!")
  elsif win?(player_choice, computer_choice)
    prompt("You won!")
  else
    prompt("Computer won!")
  end
end

scores = { player_wins: 0,
           computer_wins: 0,
           ties: 0 }

def game_board(player, computer, tie)
  if player == 3
    prompt("Player has won #{player}, so they are the winner!")
  elsif computer == 3
    prompt("Computer has won #{computer}, so they are the winner!")
  else
    prompt("Player Wins:#{player}, Computer Wins: #{computer}, Ties: #{tie}")
  end
end

prompt(MESSAGES['welcome'])
new_line
prompt(MESSAGES['rules'])
new_line
sleep(4)
prompt(MESSAGES['video'])
sleep(4)

system 'clear'

prompt(MESSAGES['time_to_play'])
new_line

loop do
  loop do
    player_choice = ' '
    loop do
      prompt(MESSAGES['choose'])
      player_choice = Kernel.gets.chomp.strip.downcase

      if VALID_CHOICES.include?(player_choice)
        break
      elsif ABREVIATION.key?(player_choice)
        player_choice = ABREVIATION[player_choice]
        break
      elsif player_choice.length == 1 && player_choice.include?("s")
        prompt(MESSAGES['which_one'])
      else
        prompt(MESSAGES['not_valid'])
      end
    end

    computer_choice = VALID_CHOICES.sample
    puts("You chose #{player_choice}; Computer chose: #{computer_choice}")

    display_results(player_choice, computer_choice)
    sleep(1.5)

    if player_choice == computer_choice
      scores[:ties] += 1
    elsif win?(player_choice, computer_choice)
      scores[:player_wins] += 1
    else
      scores[:computer_wins] += 1
    end

    system 'clear'

    game_board(scores[:player_wins], scores[:computer_wins], scores[:ties])

    break if scores[:player_wins] == 3 || scores[:computer_wins] == 3
  end

  sleep(1)
  prompt(MESSAGES['play_again?'])
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?("y")

  scores = { player_wins: 0,
             computer_wins: 0,
             ties: 0 }
end

prompt(MESSAGES['thank_you'])
