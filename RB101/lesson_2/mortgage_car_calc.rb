# Build a mortgage Calculator
# Take in Loan Amount, APR and Duration
# Calculate Monthly Interest, Loan Duration in Months, Monthly Payment
require 'yaml'
MESSAGES = YAML.load_file('mortgage_car_calc.yml')

def prompt(message)
  puts("=>#{message}")
end

def valid_loan_amount(amount)
  if amount.start_with?('$')
    amount.delete_prefix!('$')
  end
  amount.to_i.to_s == amount
end

def valid_duration(duration)
  duration.to_i.to_s == duration
end

def valid_apr(apr)
  if apr.end_with?('%')
    apr.delete_suffix!('%')
  end
  (apr.to_f.to_s == apr) && ((apr.to_f < 1.to_i) || (apr.to_f < 10.to_i))
end

system 'clear'

prompt(MESSAGES['welcome'])

name = ''

loop do
  prompt(MESSAGES['name'])
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt("Welcome #{name}, let's get started.")

loop do # main
  loan_amount = ''
  loop do
    prompt(MESSAGES['amount_prompt'])
    loan_amount = gets.chomp()

    if valid_loan_amount(loan_amount)
      break
    else
      prompt(MESSAGES['invalid_amount'])
    end
  end

  duration = ''
  loop do
    prompt(MESSAGES['duration'])
    duration = gets.chomp

    if valid_duration(duration)
      break
    else
      prompt(MESSAGES['invalid_duration'])
    end
  end

  apr = ''
  loop do
    prompt(MESSAGES['apr'])
    prompt(MESSAGES['apr_example'])
    apr = gets.chomp

    if valid_apr(apr)
      break
    else
      prompt(MESSAGES['invalid_apr'])
    end
  end

  interest = ''

  if apr.to_f < 10
    interest = apr.to_f / 100
  elsif apr.to_f < 1
    interest = apr.to_f
  end

  monthly_int = interest / 12
  principle = loan_amount.to_f
  months = duration.to_f

  if monthly_int > 0
    monthly_payment = principle * (monthly_int / 
                    (1 - (1 + monthly_int)**(-months)))
  elsif 
    monthly_payment = principle / months
  end

  system 'clear'

  prompt("Your monthly payment will be $#{monthly_payment.round(2)}")

  prompt(MESSAGES['another_scenario'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

  system 'clear'
end

prompt(MESSAGES['thank_you'])