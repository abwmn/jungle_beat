require './lib/node'

class LinkedList
  attr_accessor :head, :next_node 

  def initialize
    @head = nil
  end

  def last(node)
    return node if node.next_node.nil?
    node = last(node.next_node)
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      last(@head).next_node = Node.new(data)
    end
    data
  end

  def count
    node = @head
    return 0 if node.nil?
    count = 1
    while node.next_node != nil
      count += 1
      node = node.next_node
    end
    count
  end

  def to_array
    a = []
    node = @head
    while node != nil
      a << node.data
      node = node.next_node
    end
    a
  end
  
  def to_string
    self.to_array.join(' ')
  end

  def prepend(data)
    swap = @head
    @head = Node.new(data)
    @head.next_node = swap
  end

  def insert(pos, data)
    if self.count <= pos 
      self.append(data)
    else
      node = @head
      last_node = nil
      (0...pos).each do 
        last_node = node
        node = node.next_node
      end
      last_node.next_node = Node.new(data)
      last_node.next_node.next_node = node
    end
  end

  def find(pos, qty)
    a = self.to_array
    b = []
    return "bad position, try again" if a[pos].nil?
    return "bad quantity, try again" if qty > self.count || qty <  0
    (pos...(pos+qty)).each do |i|
      b << a[i]
    end
    b.join(' ')
  end

  def includes?(data)
    if self.to_array.include?(data) || self.to_string.include?(data)
      true
    else
      false
    end
  end

  def pop 
    node = @head
    last_node = nil
    if node.nil?
      nil
    elsif node.next_node.nil?
      deleted = node.data
      @head = nil
      return deleted
    else
      until node.next_node.nil?
        last_node = node
        node = node.next_node
      end
      last_node.next_node = nil
      return node.data
    end
  end

end