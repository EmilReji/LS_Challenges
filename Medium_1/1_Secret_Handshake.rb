=begin
Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump
10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

The program should consider strings specifying an invalid binary as the value 0.

Setup a hash mapping binary number to command
Initialize takes the decimal number and converts it to binary equivilant (use Integer#to_s(2))
Create an empty array for commands
Reverse and iterate over the string binary num
- If current num is one, take that from MAPPING and add to array of commands

=end

class SecretHandshake
  MAPPING = {
    0 => 'wink',
    1 => 'double blink',
    2 => 'close your eyes',
    3 => 'jump'
    }

  def initialize(dec_num)
    @orig_num = dec_num.to_i
    @bin_str = @orig_num.to_s(2)
  end
  
  def commands
    return [] if @orig_num > 31 || @orig_num < 0
    arr = []
    @bin_str.reverse.chars.each_with_index do |digit, index|
      arr << MAPPING[index] if digit == '1' && index != 4
    end
    arr.reverse! if @bin_str.start_with?('1') && @bin_str.size == 5
    arr
  end
  
end