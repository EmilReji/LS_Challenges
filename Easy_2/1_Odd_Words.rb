=begin
Consider a character set consisting of letters, a space, and a point.
Words consist of one or more, but at most 20 letters.
An input text consists of one or more words separated from each
other by one or more spaces and terminated by 0 or more spaces
followed by a point. Input should be read from, and including, the
first letter of the first word, up to and including the terminating
point. The output text is to be produced such that successive words
are separated by a single space with the last word bing terminated by
a single point. Odd words are copied in reverse order while even words
are merely echoed. For example, the input string
"whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS POINTS: the characters must be read and printed one at a time

PEDAC:
Input: string
- Assume input is a string
- Words seperated by one or more spaces
- String ends with 0 or more spaces then a point (.)
Output: string
- Words seperated by one space
- String ends with word, zero spaces, and a point (.)
- Odd words copied in reverse order; even words direclty echoed

Edge Cases/Questions:
How to handle case? maintain case
How to handle punctuation other than .? maintain for now
Should output string be same as input string; for now no can be different
Leading spaces?

Algorithm:
Extract the final point along with the zero or more spaces between it and the last word
- Reverse given string so point is first
- Then us sub to replace first pattern where a point and zero or more spaces exist; replace with empty string
Then reverse string so its back to nomral except without final spaces and point
Then run split on stirng for 1 or more spaces /[ ]+/ to generate an array of words
iterate over it using each_with_index; where index is odd and run reverse
then run join(' ') on the array to generate final string; then concatenate point onto end of it and return
=end

def odd_words(str)
  raise StandardError("Your input must contain a period.") unless str.match(/[.]/)
  
  str = str.reverse.sub(/[.][ ]*/, '').reverse
  arr = str.split(/[ ]+/)
  arr.delete('')
  
  arr.each_with_index do |word, index|
    raise StandardError("Words can't be longer than 20 characters.") if word.size > 20
    arr[index] = word.reverse if index % 2 == 1
  end
  
  arr.join(' ') + '.'
end