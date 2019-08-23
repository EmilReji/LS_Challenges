class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = Array.new(@size, nil)
    @current = (@size - 1)/2
    @oldest = @current - 1
  end
  
  def write(val)
    return if val.nil?
    raise BufferFullException.new "Buffer is Full" if isFull
    @buffer[@current] = val
    @current = increment(@current)
    @buffer[@current]
  end
  
  def write!(val)
    return if val.nil?
    if isFull
      @oldest = increment(@oldest)
      @buffer[@oldest] = val
    else
      write(val)
    end
  end
  
  def read
    raise BufferEmptyException.new "Buffer is Empty" if isEmpty
    @oldest = increment(@oldest)
    read_val = @buffer[@oldest]
    @buffer[@oldest] = nil
    read_val
  end
  
  def clear
    @buffer = Array.new(@size, nil)
    @current = (@size - 1)/2
    @oldest = @current - 1
  end
  
  def info
    puts "_" * 50
    puts "Current Info:"
    puts "Buffer: #{@buffer}"
    puts "Oldest index: #{@oldest} Current index: #{@current}"
    puts "_" * 50
  end
  
  private
  
  def increment(val)
    val += 1
    val = 0 if val >= @size
    val
  end
  
  def isFull
    @buffer.count(nil) == 0
  end
  
  def isEmpty
    @buffer.count(nil) == @size
  end
  
  attr_reader :buffer, :current, :oldest
end

class CircularBuffer::BufferEmptyException < StandardError; end

class CircularBuffer::BufferFullException < StandardError; end
  
# buffer = CircularBuffer.new(3)
# buffer.info
# buffer.write 'blah1'
# buffer.info
# buffer.write 'blah2'
# buffer.info
# p buffer.read # blah1
# buffer.info
# buffer.write 'blah3'
# buffer.info
# p buffer.read # blah2
# buffer.info

buffer = CircularBuffer.new(2)
buffer.info
buffer.write '1'
buffer.info
buffer.write '2'
buffer.info
buffer.write! 'A'
buffer.info
p buffer.read # 2
buffer.info
p buffer.read # A
buffer.info