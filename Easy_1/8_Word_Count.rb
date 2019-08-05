=begin
Write a program that given a phrase can count the occurrences of each word in that phrase.
For example, if we count the words for the input "olly olly in come free", we should get:
olly: 2
in: 1
come: 1
free: 1

PEDAC:

Understand the Problem:
Input: a string
Output: a hash with one word strings as key and integer as value

Examples/Test Cases:
punctuation is ignored both as a standalone word and as part of a word
words aren't just split by spaces; also can be split by punctuation, \n
however numbers are not ignored; can act as standalone words
are numbers part of a word? yes for now
case insenitive; means go and Go are the same and count will increase for go
apostrophes are exception to rule and are part of the word; however still not standalone word
are "don't" and "dont" the same? no
quotations are ignored in final result; means "'large'" and "large" 
are the same and count increases for "large"

Data Structure: takes in a string; outputs a hash
will need array to hold words from string and to do processing for rules
then can generate hash from the array

Algorithm:
Given a string, split it on any whitespace character /\s/
Will generate an array of words; will include punctuation as part of word and as seperate word
Create a hash ds with default value of 0
Iterate over the array
- If it is one or more only punctuation chars /[^A-Za-z0-9]+/, go to next iteration
- If it has any form of punctuation (other then apostrophes) /[A-Za-z0-9]*[^A-Za-z0-9]+[A-Za-z0-9]*/, remove them from the word
- use gsub to replace all
- Then increment count for that word in hash ds
Return hash
=end

# class Phrase
#   def initialize(str)
#     @str = str
#   end
  
#   def word_count
#     arr = @str.split(/\s+/)
#     hash = Hash.new(0)
#     arr.each do |word|
#       next if word.match(/[^A-Za-z0-9]+/)
      
#     end
#   end

# end

class Phrase
  def initialize(str)
    @str = str
  end
  
  def word_count
    arr = @str.downcase.gsub(/\W+'|'\W+/, ' ').split(/[^A-Za-z0-9']+/)
    generate_hash(arr)
  end
  
  def generate_hash(arr)
    hash = Hash.new(0)
    arr.each do |word|
      hash[word] += 1
    end
    hash
  end

end