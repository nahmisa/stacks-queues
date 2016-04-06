class Stack
  #LIFO
  def initialize
    @store = Array.new
  end

  def pop
    @store.pop
  end

  def push(element)
    #push into the stack - should go at the "top"
    @store << element
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

end
