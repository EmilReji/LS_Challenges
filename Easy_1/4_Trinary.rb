=begin
Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).
Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.
The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.

PEDAC:
Understanding the Problem:
Input: string representing trinary number
Output: integer representing decimal number
Mental model:
Take the trinary number as a string. Validate it only has 0, 1, or 2. Otherwise convert to 0. Then convert to equivilant decimal value.
Edge cases:
Input is not string; return StandardError
Input is not a trinary number; contains anything other than 0, 1, or 2; return 0
Examples/Test Cases: Given
Data Structre: string input; convert to array of digits
Algorithm:
Check if input is a string; otherwise raise StandardError "Input must be a string."
Split input string into array of chars
Check if any of the values are not '0', '1', or '2'; if true, then return 0
If false, then map that array to equivilant integers
Initialize a decimal variable
Then reverse it and iterate over it
- Take current digit * (3^index) and add to decimal
Return decimal
=end

class Trinary
  def initialize(str)
    @trinary = str
    raise StandardError "Input must be a string." unless is_str
  end
  
  def to_decimal
    digits = @trinary.chars
    
    return 0 if @trinary.match(/[^0-2]/)
    
    decimal = 0
    
    digits.map(&:to_i).reverse.each_with_index do |digit, index|
      decimal += (digit * (3 ** index))
    end
    
    decimal
  end
  
  def is_str
    @trinary.is_a?(String)
  end 
end