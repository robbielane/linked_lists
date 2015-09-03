# gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'linked_lists'

class NodeTest < Minitest::Test
  def test_if_node_stores_data
    node = Node.new("apple")

    assert_equal 'apple', node.data
  end
end
