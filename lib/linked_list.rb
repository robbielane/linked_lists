require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def prepend(node)
    if @head == nil
      @head = node
    else
      node.link = @head
      @head = node
    end
  end

  def appened(node)
    cursor = @head
    if @head == nil
      @head = node
    else
      cursor = cursor.link until cursor.link == nil
      cursor.link = node
    end
  end

  def end_node
    cursor=@head
    if cursor.link == nil
      cursor
    elsif cursor.link
      cursor = cursor.link until cursor.link == nil
      cursor
    end
  end

  def include?(value)
    cursor=@head
    if cursor == nil
      false
    else
      while cursor.link != nil
        cursor = cursor.link
        return true if cursor.data == value
      end
    end
  end

  def count
    cursor=@head
    counter = 0
    if cursor == nil
      counter
    else
      counter = 1
      while cursor.link != nil
        cursor = cursor.link
        counter += 1
        break if cursor.link == nil
      end
    end
    counter
  end

  def pop
    cursor=@head
    popped = nil
    if cursor == nil
      nil
    else
      while cursor.link.link !=nil do
        cursor = cursor.link
      end
      popped = cursor.link
      cursor.link = nil
    end
    popped
  end

  def first(cursor=@head)
    cursor.data
  end

  def tail(cursor=@head)
   cursor = cursor.link until cursor.link == nil
   cursor.data
  end

  def find_by_index?(index_position)
    cursor=@head
    counter = 0
    return nil if index_position > count-1
    if cursor == nil
      nil
    elsif counter == index_position
      cursor.data
    else
      until counter == index_position do
        cursor = cursor.link
        counter += 1
      end
      cursor.data
    end
  end

  def find_by_value?(value)
    cursor=@head
    counter = 0
    if cursor == nil
      nil
    elsif cursor.data == value
      counter
    else
      until cursor.data == value do
        cursor = cursor.link
        counter += 1
      end
      counter
    end
  end

  def remove_by_index(index_position)
    cursor=@head
    counter = 0
    return nil if index_position > (count - 1)
    if cursor == nil
      nil
    else
      counter += 1
      until counter == index_position do
        cursor = cursor.link
        counter += 1
      end
      temp_node = cursor.link
      cursor.link = temp_node.link
      temp_node
    end
  end

  def remove_by_value(value)
    cursor=@head
    counter = 0
    if cursor.data == value
      temp_node = cursor
      @head = cursor.link
      temp_node
    else
      count.times do
        if cursor.link.data == value
          break
        else
          cursor = cursor.link
          counter += 1
          return nil if counter == count-1
        end
      end
      temp_node = cursor.link
      cursor.link = temp_node.link
      temp_node
    end
  end

  def insert(index_position, node)
    cursor = @head
    return nil if index_position+1 > count
    (index_position - 1).times { cursor = cursor.link }
    temp_node = cursor.link
    cursor.link = node
    cursor.link.link = temp_node
  end

  def distance(node1, node2)
    counter = 0
    while node1.link != node2 do
      node1 = node1.link
      counter += 1
    end
    counter + 1
  end


end
