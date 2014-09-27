#!/usr/bin/ruby
# Singly linked list

class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end

  def append_to_tail(data)
    last = Node.new(data)
    n = self
    while n.next
      n = n.next
    end
    n.next = last
  end
end
