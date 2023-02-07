require "./lib/linked_list"
require "./lib/node"

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    a = data.split(' ')
    (0...(a.length)).each do |i| 
      self.list.append(a[i])
    end
    a.join(' ')
  end

  def count
    self.list.count
  end

  def play
    `say -r 250 -v Boing #{self.list.to_string}`
  end

end