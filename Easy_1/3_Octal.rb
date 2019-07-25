=begin
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.
Note:
Implement the conversion yourself. Do not use something else to perform the conversion for you. Treat invalid input as octal 0.
About Octal (Base-8):
Decimal is a base-10 system.
A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next number gets multiplied by 101 = 10
...
The n*th number gets multiplied by 10n-1*.
All these values are summed.
So:

  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal is similar, but uses powers of 8 rather than powers of 10. So:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

PEDAC:
Understanding the Problem:
Input: String
Output: String or Integer representing decimal? Number per test cases
Mental Model:
Take the input string and convert it to a decimal output myself
Edge cases:
Input isn't a string? throw an error
Input is a string with non-numeric values?
Get to to_s.to_i value and compare; if true then fine; otherwise return 0
Input contains 8 or 9?
Iterate over array of digits and check; if contains 9, return 0; otherwise fine
Input contains leading 0's?
Fine; should have no effect if handled like any other number
Examples/Test Cases: See test case
Data Structure: Array to store digits and convert; string to generate final number
Algorithm:
Check if input is a string; if it isn't, throw a StandardError "Input must be a string representation of your octal number"
Split the string into an array of chars
Iterate over it
If at any point a digit is a non numeric (dig != dig.to_s.to_i) or digit is a 8 or a 9, return 0 by default
Once iteratio is done, convert the array of chars to an array of integers
Initialize a decmial variable to hold decimal number (not a String)
Initialize a index var to represent exponent; set to value of arr.length - 1
Iterate over array of integers
- Take current digit * 8 ^ (index)
- Add to decimal var
- Decrement index var
Once iteration is done, return decimal
=end

class Octal
  def initialize(input)
    @o_str = input
    is_str
  end
  
  def is_str
    msg = "Input must be a string representation of your octal number."
    throw StandardError msg unless @o_str.is_a? String
  end
  
  def to_decimal
    @chars = @o_str.chars
    return 0 unless is_numeric_octal
    
    decimal = 0
    exponent = @chars.size - 1

    @chars.map(&:to_i).each do |digit|
      decimal += (digit * (8**exponent))
      exponent -= 1
    end
    
    decimal
  end
  
  def is_numeric_octal
    valid_nums = ('0'..'7')
    @chars.all? do |char|
      valid_nums.include?(char)
    end
  end
end