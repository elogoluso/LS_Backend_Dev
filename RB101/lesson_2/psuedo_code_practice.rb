# method that returns sum of two intergers
START
# given intergers called "number1" and "number2"
SET result = number1 + number2
PRINT result
END

# method that takes an array of strings and returns a string that is all strings concatenated together

START
# given array called "strings"

WHILE strings <= length of strings
  SET sentence = word + " "
PRINT sentence
END

# a method that take an array of intergers, and returns a new array with every 
# other element from the original array, starting with first element

START
# given array called numbers
SET everyother = []

WHILE numbers <= length of elements
IF index of element is divisable by 2
  everyother << element
ELSE 
  next

PRINT everyother
END

# a method that determines the index of the 3rd occurrence of a given character
# in a string. If the given character does not occurn at least 3 times, return 
# nil. 
START
# given string called "string"
SET occurence = 1
WHILE string <= length of elements
  IF element == "character"
    occurence += 1
  IF occurence == 3
    PRINT index
  ELSE
    return NIL


