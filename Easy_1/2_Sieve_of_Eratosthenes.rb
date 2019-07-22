=begin
PEDAC:

Understanding the problem:
input: one positive integer representing max
output: array of prime numbers
mental model:
start with 2 as curr_num, mark it as a prime, and mark all multiples of 2 from 2^2 (4) up to max as composite
move to 3 and repeat
note that if curr_num you select is already marked as composite, go to next val
continue process until curr_num^2 > max
edge cases:
what if input is not a positive integer? assume input is correct

Examples/Test Cases: Given

Data Structure:
Use hash to keep track of values and their marks; key is num; val is mark type
Or Use array with index representing num and element as marks - my choice

Algorithm
Initialize method takes in max_val which will become an instance variable
Then primes method is run
Generates an array max_val + 1 long (since index represents value) and populate it with -1 to represent unmarked
Set curr_num = 2
Start from curr_num and iterate until curr_num ^ 2 > max_val
On each iteration
- Set arr[curr_num] = true if arr[curr_num] == -1
- Go to next iteration if arr[curr_num] != -1
- Then iterate from curr_num ^ 2 to max (increment by curr_num)
    - Set arr[curr_num] = false
Once complete, iterate over array using each_with_index and generate
and array of indexes where element is true
=end

class Sieve
  def initialize(max)
    @max = max
  end
  
  def primes
    arr = Array.new(@max + 1, :unmarked)
    curr_num = 2
    
    while curr_num ** 2 <= @max
      if arr[curr_num] == :unmarked
        arr[curr_num] = true
      else
        curr_num += 1
        next
      end
      
      start = curr_num ** 2
      
      loop do
        break if start > @max
        arr[start] = false 
        start += curr_num
      end

      curr_num += 1
    end
    
    primes = []
    
    arr.each_with_index do |mark, index|
      primes << index if mark && index >= 2
    end
    
    primes
  end
end

puts $LOADED_FEATURES