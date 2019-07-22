=begin
Write a program that will take a string of digits and 
give you all the possible consecutive number series of 
length n in that string.

For example, the string "01234" has the following 3-digit series:
- 012
- 123
- 234

PEDAC:

Understanding the Problem:
Input: a string containing only positive integers, a positive integer for size of slices
Output: an array of array; each subarray contains each individual digit of the num
edge cases:
if the size for slices given is larger than the original string length, raise ArgumentError
note that the series have to be consecutive; so 01234 with 3 won't ever return [2, 4, 5]
what do I do with leading zeros? include in result so 01234 with 3 will return [0, 1, 2]
- to ensure this, take input string, and convert to array of characters, then make each individual
element a number; if to_i is applied to orignial string, loses leading zeros

Examples/Test Cases: Given

Data Structure: Array

Algorithm:
initialize method takes in string
a private method is run on the string to convert to array of integers for an instance var
- run split('') on str to get array of chars; then run map(:&to_s) on it to return array of int
when slice is called, takes one positive integer representing slice size
if slice size is greater than @digits.size, raise ArgumentError
create final result array which is empty
find number of possible slices: total_iterations = @digits.size - size + 1
start_index = 0
on each iteration
- create a new array from start_index to start_index + size - 1
- add this array to final result array
- increment start_index by 1
=end

class Series
  def initialize(str)
    @digits = convert(str)
  end
  
  def slices(size)
    raise ArgumentError if size > @digits.size
    
    result = []
    iterations = @digits.size - size + 1
    
    iterations.times do |start_index|
      result += [@digits[start_index..(start_index + size - 1)]]
    end
    
    result
  end
  
  private
  
  def convert(str)
    str.split('').map(&:to_i)
  end
end

