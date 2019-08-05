=begin
PEDAC:
Understanding the problem:
For verse
Input: 1st parameter of an integer (0 to 99); represents line to be printed
2nd is optional and represents lower end of range of lines (with first representing higher end of range)
***Incorret; verses and verse differ***
lyric method will call verse (99, 0)


Algorithm:
have a seperate method setup to take in a parameter of the current line and return string needed
- input a number
- if number is not one, make sure to have plural; if one, use non plural
- if zero, then don't use number, use different string
- return string

have loop from start_line to end_line

=end

class BeerSong
  def verse(line_num)
    string(line_num)
  end
  
  def verses(start_line, end_line)
    verses = []
    start_line.downto(end_line) do |line_num|
      verses << string(line_num)
    end
    verses.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
  
  def string(num)
    if num > 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    elsif num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end  
  end
end