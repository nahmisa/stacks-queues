class Queue
  #FIFO
  def initialize
    @store = []
  end

  def dequeue
    @store.shift
  end

  def enqueue(element)
    @store << element
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

end
