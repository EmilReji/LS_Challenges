=begin
PEDAC:
input: string containing 1 more words; seperated by 1 space
output: similar string

examples/test cases:
1st and 2nd ones begin with a vowel; just add ay to end
3rd and 4th ones begin with simple consonant; 1 letter;
just take that 1 consonant from front, add to back, and add
ay
5th one has two consonates at front then vowel; must take
2 cononants from front, add to back, and add ay
6th has consonat and then a vowel; must take both since they are part of same syllable; then add to back and add ay
7th is similar but has 2 consonants; similar answer
8th, 9th, and 10th have 2 and 3 consonants then a vowel; remove 2 - 3 consonants from front (without vowel) and add to back with ay
11th has multiple words split by a single space; must apply algorithm to all individual words and return single string with spaces
12th y is treated as a constonant here; since it is followed by a vowel, take y of front and add to back with ay
13th y is treated as a vowel here; thus keep word as is and add ay to end
14th x is treated as a consontant here; since it is followed by a vowel, take x of front and add to back with ay
15th x is treated like a vowel here; thus keep word as is and add ay to end

basic algorithm:
given string, determine if it starts with vowel or consonant
if vowel, then add ay to end and return
if consonant, then find consonant part of string, remove from front, add to back, and add ay and return new string

sub-method: is_vowel(str)
if it begins with a, e, i, o, or u, then return true
if it begins with x or y then may be a vowel sound
 if second character is not a standard vowel, then, return true
otherwise return false

sub-method: consonant(str)


=end

class String
  ADDON = 'ay'
  
  def is_vowel
    str = self
    return true if str[0].match(/[aeiou]/)
    return true if str[0].match(/[xy]/) && str[1].match(/[^aeiou]/)
    false
  end

  def consonant_and_rest
    str = self
    first_vowel_idx = str.chars.find_index do |char|
      char.match(/[aeiou]/)
    end
    first_vowel_idx += 1 if str[first_vowel_idx - 1] == 'q' && str[first_vowel_idx] == 'u'
    con = str[0...first_vowel_idx]
    rest = str[first_vowel_idx..-1]
    [con, rest]
  end

=begin
algorithm:
take consonants until hits a vowel; take only consonants and remvoe and add; works for 3, 4, 5, 8, 9, and 10
6 - 7: if the consoant is a q and followed by  u, then u taken with q and preceding consonans


3rd and 4th ones begin with simple consonant; 1 letter;
just take that 1 consonant from front, add to back, and add
ay
5th one has two consonates at front then vowel; must take
2 consonants from front, add to back, and add ay
6th has consonat and then a vowel; must take both since they are part of same syllable; then add to back and add ay
7th is similar but has 2 consonants; similar answer
8th, 9th, and 10th have 2 and 3 consonants then a vowel; remove 2 - 3 consonants from front (without vowel) and add to back with ay
=end

  def word_translate
    str = self
    return str + ADDON if str.is_vowel
    con, rest = str.consonant_and_rest
    # puts 
    # puts "rest: #{rest}"
    # puts "con: #{con}"
    # [rest, con, 'ay']
    rest + con + 'ay'
  end
end

class PigLatin
  def self.translate(str)
    str.split.map do |word|
      word.word_translate
    end.join(' ')
  end
end

  # def self.translate(str)
  #   return str + ADDON if str[0].match(/[aeiou]/)
  #   cons_end_idx = 0
    
  #   str.chars.each_with_index do |char, idx|
  #     cons_end_idx = idx
  #     break if char.match(/[aeiou]/)
  #   end
    
  #   str[cons_end_idx..-1] + str[0...cons_end_idx] + 'ay'
  # end