=begin
The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).
 1  => I
10  => X
 7  => VII
There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

http://www.novaroma.org/via_romana/numbers.html

PEDAC:
Understanding the problem:
Input: integer from 1 to 3000
Output: string containing following characters I, V, X, L, C, D, M

Test Cases/Examples:


Algorithm:
Have a hash setup mapping each number to corresponding value
Then pull out array of keys (numbers) [1, 5, 10, 50, 100, 500, 1000]
Find biggest number that is less than or equal to given num; subtract and 
Ex 27; 10 is bigget number less than it; subtract it from 27 to get 17
take corresponding value and add to string; string = 'X'
repeat process until num is 0
17 - 10 = 7   'XX'
7 - 5 = 2     'XXV'
2 - 1 = 1     'XXVI'
1 - 1 = 0     'XXVII'

Ex. 93
93 - 50 = 43  'L'
43 - 10 = 33  'LX'
33 - 10 = 23  'LXX'
23 - 10 = 13  'LXXX'
13 - 10 = 3   'LXXXX'
at this point when 4th repeated char is added, know its wrong
take character 2 above; C is two above X; have smaller before larger; XC is now string
13 - 10 = 3   'XC'
3 - 1 = 2     'XCI'
2 - 1 = 1     'XCII'
1 - 1 = 0     'XCIII'

Ex. 911
911 - 500 = 411 'D'
411 - 100 = 311 'DC'
311 - 100 = 211 'DCC'
211 - 100 = 111 'DCC'
111 - 100 = 11  'DCCC'
at this point when 4th repeated char is added, know its wrong
take character 2 above; M is two above C; have smaller before larger; CM is now string
111 - 100 = 11  'CM'
11 - 10 = 1     'CMX'
1 - 1 = 0     'CMXI'
=end

# class Integer
  
#   MAPPING = {
#       1 => 'I',
#       5 => 'V',
#       10 => 'X',
#       50 => 'L',
#       100 => 'C',
#       500 => 'D',
#       1000 => 'M'
#   }
    
#   def to_roman
#     num = self
#     roman_str = ''
#     nums = MAPPING.keys
    
#     until num <= 0
#       to_sub = largest_val_under(num)
#       roman_str += MAPPING[to_sub]
#       if roman_str.length >= 4 && four_same(roman_str)
#         roman_str = MAPPING[to_sub] + MAPPING[to_sub * 10]
#       end
#       num -= to_sub
#     end
    
#     roman_str2
#   end
  
#   def largest_val_under(num)
#     nums = MAPPING.keys.reverse
#     nums.find { |curr_num| num >= curr_num}
#   end
  
#   def four_same(str)
#     str.chars[-4..-2].all? { |char| char == str[-1] }
#   end
# end

=begin
algorithm:
convert number to string then split into array of chars then array of integer digits
iterate over this left to right
set exponent to arr.size - 1
on each iteration, compute roman str for that digit * 10 ^ (exponent); decrement exponent each time
then append this roman str to final roman str to return

computing individual roman str 
- find largest number in hash keys under current num
- subtract
=end

class Integer
  
  MAPPING = {
      1 => 'I',
      5 => 'V',
      10 => 'X',
      50 => 'L',
      100 => 'C',
      500 => 'D',
      1000 => 'M'
  }
    
  def to_roman
    num_arr = self.to_s.chars.map(&:to_i)
    roman_str = ''
    nums = MAPPING.keys
    exponent = num_arr.size - 1
    num_arr.each do |digit|
      roman_str += sub_to_roman(digit * (10**exponent))
      exponent -= 1
    end
    roman_str
  end
  
  def sub_to_roman(num)
    roman_str = ''
    nums = MAPPING.keys
    
    until num <= 0
      to_sub = largest_val_under(num)
      roman_str += MAPPING[to_sub]
      if roman_str.length >= 4 && four_same(roman_str)
        roman_str = MAPPING[to_sub] + MAPPING[to_sub * 5] # how to decide between 10 or 5
      end
      num -= to_sub
    end
    
    roman_str
  end
  
  def largest_val_under(num)
    nums = MAPPING.keys.reverse
    nums.find { |curr_num| num >= curr_num}
  end
  
  def four_same(str)
    str.chars[-4..-2].all? { |char| char == str[-1] }
  end
end