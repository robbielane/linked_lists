# gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_lists'

class NodeTest < Minitest::Test
  def test_if_node_stores_data
    node = Node.new("apple")

    assert_equal 'apple', node.data
  end

  def test_if_node_stores_link
    node1 = Node.new("apple")
    node2 = Node.new('orange')
    node1.link = node2

    assert_equal node2, node1.link
  end

  def test_new_node_instance_data_is_nil
    node = Node.new

    assert_equal nil, node.data
  end

  def test_new_node_instance_link_is_nil
    node = Node.new

    assert_equal nil, node.link
  end
end
