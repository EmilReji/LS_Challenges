=begin
Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word
For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

PEDAC:
Understanding the problem:
Input: a string for the original word and an array of string(s) to match to
Output: an array of string(s)
Mental Model 1:
Given word, iterate over array and find the strings that are anagrams to the word
then return a new array with those that match
Mental Model 2:
Given word, generate all possible anagrams as an array of strings
Then iterate over given array and check which string exists in the array of anagrams
Then return those that matched in an array

Examples/Test Cases:
if inputted word and array of strings doesn't all have strings, then raise StandardError "Inputs must all be strings."
if no matches found, return empty array
the array returned must have strings in alphabetical order; use Array#sort

Data Structure:
Array is inputted and outputted
Hash can be generated with letter as key and count as value
This hash can be generate on each string and sorted
Anagrams will have same hash since letter and relevant count will equal

Algorithm (mental model 1):
If none of params are strings, raise StandardError "Inputs must all be strings."
Call hash method on @word and generate hash
Then iterate over given arr; use select
- run hash method on current word
- select criteria is that the @word hash is equal to the current_word hash
Return selected array of words
Hash method:
- generate a hash with all default values set to 0
- iterate over string
- on each char, update relevant key value pair by one in hash
- once done iterating, return hash data structure; represents count for words

Missed:
Idential word is not an anagram
Anagram's are case insensitive

=end

class Anagram
  def initialize(str)
    @word = str
  end
  
  def match(arr)
    unless @word.is_a?(String) && arr.all? { |w| w.is_a?(String) } 
      raise StandardError "Inputs must all be strings."
    end
    
    word_count = hash_ds(@word.downcase)
    
    arr.select do |str|
      hash_ds(str.downcase) == word_count && str.downcase != @word.downcase
    end
  end
  
  def hash_ds(word)
    hash = Hash.new(0)
    word.chars.each do |char|
      hash[char] += 1
    end
    hash.sort.to_h
  end
end