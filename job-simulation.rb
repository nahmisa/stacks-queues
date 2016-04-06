require './Stack.rb' #roll dice and fire off the stack (Last hired, first fired, and they go to the end of the waiting queue)
require './Queue.rb' #waiting queue of people to hire (6)

class CrazyCompany

  attr_reader :people_needed
  # didn't want to make attr_accessor for waiting and employees beacuse people shouldn't be able to edit the list and move themselves in line... will have to use instance variables within methods

  def initialize
    @people_needed = 6 #start out needing 6 people because there are no employees
    @waiting = fill_queue #private method to fill queue
    @employees = Stack.new #starts empty.  we need to fill with employees when we hire

  end

  def hire_fire_cycle
    hire
    roll_fire_dice
    fire
    puts self.inspect #not sure what we want to return! but this lets you see how the people are shifting and the method returns nil.
  end

  def hire
    people_needed.times do
      @employees.push(@waiting.dequeue)
    end
  end

  def roll_fire_dice
    @people_needed = rand(1..6)
  end

  def fire
    people_needed.times do
      @waiting.enqueue(@employees.pop)
    end
  end


  ########PRIVATE
  private

  def fill_queue
    #start with 10 people on the waiting list
    waiting = Queue.new
    number = 1
    @waiting = 10.times do
      waiting.enqueue(number)
      number += 1
    end
    return waiting
  end

end
