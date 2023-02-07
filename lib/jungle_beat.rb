require "./lib/linked_list"
require "./lib/node"

class JungleBeat
  attr_reader :list, :data
  
  def initialize(data=nil)
    @list = LinkedList.new
    @list.append(data) if data != nil
  end

  def append(data)
    a = data.split(' ')
    valid = ["tee", "dee", "deep", "bop", "boop", "la", "na"]
    beats_added = 0
    (0...(a.length)).each do |i|
      beat = a[i].gsub(/[^a-z]/i, '')
      if valid.include?(beat)
        self.list.append(beat) 
        beats_added +=1
      end 
    end
    beats_added
  end

  def prepend(data)
    a = data.split(' ')
    valid = ["tee", "dee", "deep", "bop", "boop", "la", "na"]
    beats_added = 0
    (0...(a.length)).each do |i|
      beat = a[i].gsub(/[^a-z]/i, '')
      if valid.include?(beat)
        self.list.prepend(beat) 
        beats_added +=1
      end 
    end
    beats_added
  end

  def count
    self.list.count
  end

  def all
    self.list.to_string
  end

  def play
    `say -r 250 -v Boing #{self.list.to_string}`
  end

end