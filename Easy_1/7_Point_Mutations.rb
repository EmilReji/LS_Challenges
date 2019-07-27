=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the 'Hamming distance'
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

PEDAC:
Understanding the problem:
Input: two strings representing two strands of DNA
Output: integer representing hamming distance amount
Mental Model:
Iterate over the shorter DNA strand and compare each eqivilant char on the other DNA strand; when they
differ, increment the hamming distance; after iteration, return distance
Edge cases:
non string; assume all strings
string containing letter that isn't any of the 4 DNA options: ATGC? 
don't need to consider since we aren't checking validity of strand; just difference
case sensitive? same as above so don't need to consider

Examples/Test Cases: Given

Data Structure: Given a string; could use array but not needed

Algorithm:
Create a h_distance var to be returnd by the method
If @original > strand, then use strand.length; otherwise use @original.length for iteration (shorter distance)
Then iterate that amount of times over both strands at the same time
- Compare values from both strands at the same index; if different, increment h_distance
Return h_distance
=end

class DNA
  def initialize(original)
    @original = original  
  end
  
  def hamming_distance(strand)
    h_dist = 0
    
    iterations = @original.length > strand.length ? strand.length : @original.length
    
    iterations.times do |index|
      h_dist += 1 if strand[index] != @original[index]
    end
    
    h_dist
  end
end