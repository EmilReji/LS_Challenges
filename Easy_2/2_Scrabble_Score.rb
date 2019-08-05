=begin
Write a program that, given a word, computes the scrabble score for that word.

Examples
"cabbage" should be scored as worth 14 points:

3 points for C
1 point for A, twice
3 points for B, twice
2 points for G
1 point for E
And to total:

3 + 2*1 + 2*3 + 2 + 1
= 3 + 2 + 6 + 3
= 5 + 9
= 14

PEDAC:
Input: String
Output: integer for scrabble score

Test Cases/Examples:
If input is non string (ex. nil), then return 0
If input doesn't have any letters (and may have spaces, punctuation, etc.), then return 0
Can expect inputted strings not to have extra spaces
Algorithm:
Have hash constant mapping each letter to score
Verify input is a string; otherwise throw error
Verify input string only has [A-Za-z]
Downcase entire string
Generate character array from string
Iterate over it and increment final_score var by adding MAPPING[current_char]
return final_scoare
=end

class Scrabble
  MAPPING = {
    'a' => 1,
    'b' => 3,
    'c' => 3,
    'd' => 2,
    'e' => 1,
    'f' => 4,
    'g' => 2,
    'h' => 4,
    'i' => 1,
    'j' => 8,
    'k' => 5,
    'l' => 1,
    'm' => 3,
    'n' => 1,
    'o' => 1,
    'p' => 3,
    'q' => 10,
    'r' => 1,
    's' => 1,
    't' => 1,
    'u' => 1,
    'v' => 4,
    'w' => 4,
    'x' => 8,
    'y' => 4,
    'z' => 10,
    }
  
  def initialize(str)
    @str = str
  end
  
  def score
    self.class.score(@str)
  end
  
  def self.score(str)
    return 0 unless str.is_a?(String)
    return 0 if str.match(/[^A-Za-z]+/)
    final_score = 0
    
    str.downcase.chars.each do |curr_char|
      final_score += MAPPING[curr_char]
    end
    
    final_score
  end
end

=begin
  
  def score
    return 0 unless @str.is_a?(String)
    return 0 if @str.match(/[^A-Za-z]+/)
    final_score = 0
    
    @str.downcase.chars.each do |curr_char|
      final_score += MAPPING[curr_char]
    end
    
    final_score
  end
=end