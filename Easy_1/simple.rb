=begin
Suppose you have an arbitrary natural number (the target) and 
a set of one or more additional natural numbers (the factors). 
Write a program that computes the sum of all numbers from 1 up
to the target number that are also multiples of one of the factors. 
For instance, if the target is 20, and the factors are 3 and 5, that 
gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of 
these multiples is 78. If no factors are given, use 3 and 5 as the default factors.

PEDAC:

Understanding the Problem:
Input: target (one integer), factors (one more natural numbers - positive integers)
Output: sum (one integer)
Mental Model: Takes the sum from 1 up to target and iterates up based on the factors

Edge Cases:
0 factors given? throw error if array is empty or if any values are not natural numbers
or if target is not a natural number (positive integer)
if multiple factors given and some overlap (ex 3 and 5 overlap at 15)
In that case, include it once in sum
If factor includes target? Dont nclude target.
Ex. if 21 is target and 3 is multiple, 20 will be last value added to sum
What if target is less than any factor(s) given? Return 0
Examples and Test cases: see test_simple.rb

Data Structure:
Array since array is given and sum can be easily computed using it

Algorithm:
Error handling
Create a sum variable set to 0factors.any? { |factor| is_natural_num(factor)
Create an array from 1 to target - 1
Iterate over it (by 1)
- Check if val is evenly divisible by any of the factors
- If true, add value to sum
Once done iterating, return sum

Code:
=end

def is_natural_num(num)
  num > 0 and num.to_s == num.to_i.to_s
end

def simple(target, factors)
  raise StandardError unless is_natural_num(target)
  if factors.empty? || factors.any? { |factor| !is_natural_num(factor) }
    raise StandardError 
  end
  
  arr = (1..target-1).to_a
  
  arr.select do |curr_val|
    factors.any? do |factor|
      curr_val % factor == 0
    end
  end.sum
end