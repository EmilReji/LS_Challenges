=begin
Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number
If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.
Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

PEDAC:
Understanding the problem:
input: a target integer and a list of integers for multiples
output: integer representing sum
mental model:
take a target integer; it no list of integers given, use [3, 5]; use list to iterate
from 1 to target and compute sum where current val is a multiple of one of the nums in the list
Examples/Test Cases: given
Data Structure: array given; create new array from range from 1 to target - 1
Algorithm:
in method def, have list set to [3, 5] by default if none given
verify given target is an integer; otherwise raise StandardError 'The target number must be an integer.'
verify list only contains integers; otherwise raise StandardError 'All given multiples must be an integer.'
then create a range from 1 to target - 1; and convert to an array
iterate over array
- if curr_num is evenly divisible by any value in the array of multiples, add to sum
- otherwise next
return sum
=end

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples

  end
  
  def to(target)
    self.class.to(target, @multiples)
  end
  
  def self.to(target, multiples = [3, 5])
    unless target.is_a?(Integer)
      raise StandardError 'The target number must be an integer.' 
    end
    
    unless multiples.all? { |mult| mult.is_a?(Integer) }
      raise StandardError 'All given multiples must be an integer.'
    end
    
    (1...target).to_a.select do |num|
      multiples.any? { |mult| num % mult == 0 }
    end.sum
  end
end