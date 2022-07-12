require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# ask user for the two numbers
# ask the user for the operation
# perform the operation on the two numbers
# output the results


def prompt(message)
  Kernel.puts("=>#{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
  num.to_i/num.to_i == 1
end 

def valid_number2?(num)
  num.to_i !=0
end

def operation_to_message(op)
 word = case op
        when '1' then 'Adding'
        when '2' then 'Subtracting'
        when '3' then 'Multiplying'
        when '4' then 'Dividing'
        end
  "random code"
  word
end

prompt(MESSAGES['welcome'])

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['hello'] + " " + "#{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number2?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_choice'])
    end
  end

  prompt("#{operation_to_message(operator)}" + " " + MESSAGES['two_numbers'])

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt(MESSAGES['result'] + " " + "#{result}")

  prompt(MESSAGES['another_calc'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
