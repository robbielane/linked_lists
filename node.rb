require 'pry'
class Node
  attr_accessor :data, :link

  def initialize(data = nil, next_node = nil)
    @data = data
    @link = link
  end
end
