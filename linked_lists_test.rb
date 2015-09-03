# gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_lists'

class LinkedListsTest < Minitest::Test
  def test_if_empty_head_returns_nil
    expected = LinkedList.new

    assert_equal nil, expected.head
  end

  def test_prepend_adds_node_to_nil_head
    list = LinkedList.new
    node1 = Node.new('value1')
    list.prepend(node1)

    assert_equal node1, list.head
  end

  def test_prepend_adds_node_to_head_which_has_node
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.prepend(node1)
    list.prepend(node2)

    assert_equal node2, list.head
  end

  def test_tail_returns_tail_node_with_1_node
    list = LinkedList.new
    node = Node.new('value1')
    list.prepend(node)

    assert_equal list.end_node, node
  end

  def test_tail_returns_tail_node_with_2_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.prepend(node1)
    list.prepend(node2)

    assert_equal list.end_node, node1
  end

  def test_append_adds_node_to_head_if_empty
    list = LinkedList.new
    node = Node.new('value')
    list.appened(node)

    assert_equal list.head, node
  end

  def test_append_adds_node_to_tail_with_2_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.appened(node1)
    list.appened(node2)

    assert_equal list.end_node, node2
  end

  def test_append_adds_node_to_tail_with_3_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)

    assert_equal list.end_node, node3
  end

  def test_include_returns_true_with_3_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    included = list.include?('value2')

    assert included
  end

  def test_include_returns_false_with_no_nodes
    list = LinkedList.new
    included = list.include?('value2')

    refute included
  end

  def test_count_with_3_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    count = list.count

    assert_equal 3, count
  end

  def test_count_with_5_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    node4 = Node.new('value4')
    node5 = Node.new('value5')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    list.appened(node4)
    list.appened(node5)
    count = list.count

    assert_equal 5, count
  end

  def test_pop_removes_last_node
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    popped = list.pop

    assert_equal node3, popped
    assert_equal 2, list.count
  end

  def test_that_first_returns_value_of_head
    list = LinkedList.new
    node1 = Node.new('value1')
    list.appened(node1)

    assert_equal 'value1', list.first
  end

  def test_that_tail_returns_value_of_tail
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    list.appened(node2)

    assert_equal 'value2', list.tail
  end

  def test_find_by_index_with_3_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    result = list.find_by_index?(1)

    assert_equal 'value2', result
  end

  def test_find_by_index_with_6_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    node4 = Node.new('value4')
    node5 = Node.new('value5')
    node6 = Node.new('value6')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    list.appened(node4)
    list.appened(node5)
    list.appened(node6)
    result = list.find_by_index?(4)

    assert_equal 'value5', result
  end

  def test_find_by_index_returns_nil_if_head_nil
    list = LinkedList.new
    result = list.find_by_index?(3)

    assert_equal nil, result
  end

  def test_find_by_index_returns_nil_if_index_position_greater_than
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    result = list.find_by_index?(5)

    assert_equal nil, result
  end

  def test_find_by_value_with_3_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    result = list.find_by_value?('value2')

    assert_equal 1, result
  end

  def test_find_by_value_with_3_nodes_at_head
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    result = list.find_by_value?('value1')

    assert_equal 0, result
  end

  def test_find_by_value_with_6_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    node4 = Node.new('value4')
    node5 = Node.new('value5')
    node6 = Node.new('value6')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    list.appened(node4)
    list.appened(node5)
    list.appened(node6)
    result = list.find_by_value?('value6')

    assert_equal 5, result
  end

  def test_remove_by_index_with_3_nodes
    list = LinkedList.new
    node1 = Node.new('value1')
    node2 = Node.new('value2')
    node3 = Node.new('value3')
    list.appened(node1)
    list.appened(node2)
    list.appened(node3)
    removed = list.remove_by_index(1)

    assert_equal node2, removed
    assert_equal 2, list.count
  end

    def test_remove_by_index_with_6_nodes
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      node4 = Node.new('value4')
      node5 = Node.new('value5')
      node6 = Node.new('value6')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      list.appened(node4)
      list.appened(node5)
      list.appened(node6)
      removed = list.remove_by_index(4)

      assert_equal 5, list.count
      assert_equal node5, removed
    end

    def test_remove_by_index_returns_nil_at_head_if_empty
      list = LinkedList.new
      removed = list.remove_by_index(0)

      assert_equal nil, removed
    end

    def test_remove_by_index_when_index_does_not_exist
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      removed = list.remove_by_index(5)

      assert_equal nil, removed
    end

    def test_remove_by_value_with_3_nodes
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      removed = list.remove_by_value('value3')

      assert_equal 2, list.count
      assert_equal node3, removed
    end

    def test_remove_by_value_when_value_does_not_exist
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      removed = list.remove_by_value('value5')

      assert_equal nil, removed
    end

    def test_insert_with_four_nodes
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      node4 = Node.new('value4')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      list.insert(1, node4)

      assert_equal node1.link, node4
      assert_equal 4, list.count
    end

    def test_insert_when_index_position_does_not_exist
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      node4 = Node.new('value4')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      result = list.insert(6, node4)

      assert_equal nil, result
    end

    def test_distance_with_6_nodes
      list = LinkedList.new
      node1 = Node.new('value1')
      node2 = Node.new('value2')
      node3 = Node.new('value3')
      node4 = Node.new('value4')
      node5 = Node.new('value5')
      node6 = Node.new('value6')
      list.appened(node1)
      list.appened(node2)
      list.appened(node3)
      list.appened(node4)
      list.appened(node5)
      list.appened(node6)
      distance_between = list.distance(node2, node5)

      assert_equal 3, distance_between
    end
end
