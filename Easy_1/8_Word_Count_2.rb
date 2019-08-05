=begin
Write a program that given a phrase can count the occurrences of each word in that phrase.
For example, if we count the words for the input "olly olly in come free", we should get:

olly: 2
in: 1
come: 1
free: 1

PEDAC:

Understanding the problem:
Input: string
Output: hash with key as unique words and value as the count of it

Examples and Test Cases:
Word can be seperated by spaces, punctuation; any number; any combo
Inlcudes just punctuation like comma
Punctuation is not part of the word; exception are apostrophes in a word
words are case insensitve so go and Go will output go => 2

Algorithm:
split on anything that isn't a letter or an apostrophe
then iterate over each word in the array and remove any apostrophe
that isn't surrounded by two letters; also downcase every word
then compute hash from array
=end

class Phrase
  def initialize(str)
    @str = str
  end
  
  def word_count
    arr = @str.split(/[^A-Za-z0-9']/)

    hash = Hash.new(0)
    arr.each do |word|
      new_word = word.downcase.gsub(/(\B')|('\B)/, '') # /(\B')|('\B)/
      hash[new_word] += 1 unless new_word.empty? 
    end
    
    hash
  end
end