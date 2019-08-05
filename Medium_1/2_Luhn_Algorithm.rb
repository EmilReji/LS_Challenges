=begin
Formula used to verify a number against its check digit
On the right end of the number
For full num to be valid following formula must return 0
Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
For any digits that thus become 10 or more, subtract 9 from the result.
1111 becomes 2121.
8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
Add all these digits together.
1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6
8763 becomes 7733, and 7+7+3+3 is 20.
So 8763 is valid since 20 % 10 == 0; sum ends in 0
So 1111 is not valid since 6 % 10 != 0; sum doesn't end in 0

=end

class Luhn
  def initialize(num)
    @num = num.to_i
    @arr_int = @num.to_s.chars.map(&:to_i)
  end
  
  def checksum
    # calculate sum of addends returned array (every 2nd digit from right doubled)
    addends.sum
  end
  
  def addends
    # given @num, make an array of integers, then double every 2nd value from the right and return array
    index = 0
    @arr_int = @arr_int.reverse.map do |num|
      num *= 2 if index % 2 == 1
      num -= 9 if num >= 10
      index += 1
      num
    end.reverse
    
    @arr_int
  end

  def self.create(num)
    # given num, add a check digit so its checksum is valid
    # then return new num
    new_num = num.to_i.to_s + '0'
    checksum = Luhn.new(new_num).checksum
    remainder = checksum % 10
    return new_num.to_i if remainder == 0
    
    new_last_digit = 10 - remainder 
    (new_num.chop + new_last_digit.to_s).to_i
  end
  
  def valid? 
    # use checksum method and verify it's return ends with 0
    # return a boolean based on this
    checksum % 10 == 0
  end
end

=begin
self.create(num)

algorithm:
given num, convert to string, then add 0 to end of it
add a zero to end of it, then generate instance of Luhn
and use instance methods to find its checksum % 10
the new digit to replace the 0 with is 10 - remainder
if remainder is 0, then return original num
=end