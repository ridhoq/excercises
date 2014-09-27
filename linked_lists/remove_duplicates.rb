#!/usr/bin/ruby
# Write code to remove duplicates from an unsorted linked list

require_relative "node"
require "test/unit"

def remove_duplicates(start)
  seen = []
  n = start
  prev = nil
  puts
  while n
    if seen.include?(n.data)
      prev.next = n.next
      n = n.next
    else
      seen.push(n.data)
      prev = n
      n = n.next
    end
  end
  return start
end

class TestRemoveDuplicates < Test::Unit::TestCase
  def test_remove_duplicates_1()
    # Test this linked list
    test = Node.new(1)
    test.append_to_tail(2)
    test.append_to_tail(2)
    test.append_to_tail(3)
    test.append_to_tail(1)

    # Expect this linked list
    expected = Node.new(1)
    expected.append_to_tail(2)
    expected.append_to_tail(3)

    n = remove_duplicates(test)
    while n
      assert_equal(expected.data, n.data)
      n = n.next
      expected = expected.next
    end
  end

  def test_remove_duplicates_2()
    # Test this linked list
    test = Node.new(1)
    test.append_to_tail(1)
    test.append_to_tail(1)
    test.append_to_tail(1)
    test.append_to_tail(1)

    # Expect this linked list
    expected = Node.new(1)

    n = remove_duplicates(test)
    while n
      assert_equal(expected.data, n.data)
      n = n.next
      expected = expected.next
    end
  end

  def test_remove_duplicates_3()
    # Test this linked list
    test = Node.new(1)
    test.append_to_tail(2)
    test.append_to_tail(3)
    test.append_to_tail(4)
    test.append_to_tail(5)

    # Expect this linked list
    expected = Node.new(1)
    expected.append_to_tail(2)
    expected.append_to_tail(3)
    expected.append_to_tail(4)
    expected.append_to_tail(5)

    n = remove_duplicates(test)
    while n
      assert_equal(expected.data, n.data)
      n = n.next
      expected = expected.next
    end
  end
end


