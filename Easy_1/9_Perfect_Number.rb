=begin
The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.

Perfect: Sum of factors = number
Abundant: Sum of factors > number
Deficient: Sum of factors < number
Examples:

6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
Write a program that can tell if a number is perfect, abundant or deficient.

PEDAC:

Understanding the problem:
Input: positive integer
Output: string; 'perfect', 'abundant' or 'deficient'
Mental model:
Given the number find a list of its divisors exluding itself (and no repeats from squares)
then take the sum of this list and compare to given number and return result

Examples/Test Cases: Given

DS: Array to hold list of divisors

Algorithm:
Given integer, find its square root; if not a integer, round down
Then iterate from 1 to this square root (inclusive)
- If integer%curr_num == 0, then add integer/curr_num and curr_num to array
- If curr_num and integer/curr_num are equal, only add once to array
Compute array.sum and compare to integer and reutnr string
=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError unless num > 0
    
    root = Math.sqrt(num).to_i # truncates extra so don't need to round down
    divisors = []
    
    1.upto(root) do |div1|
      div2 = num/div1
      next if  num%div1 != 0
      divisors << div1 if div1 != div2
      divisors << div2 if div2 != num
    end
    
    sum = divisors.sum
    case
    when sum > num
      then 'abundant'
    when sum < num
      then 'deficient'
    else
      'perfect'
    end
  end
end