require "./lib/linked_list"
require "./lib/node"

class JungleBeat
  attr_accessor :list, :data, :rate, :voice, :valid

  def initialize(data=nil, rate=500, voice="Boing")
    @list = LinkedList.new
    @rate = rate
    @voice = voice
    @valid = ["tee", "dee", "deep", "bop", "boop", "la", "na", "dop"]
    self.append(data) if data != nil
  end

  def append(data)
    a = data.split(' ')
    beats_added = 0
    (0...(a.length)).each do |i|
      beat = a[i].gsub(/[^a-z]/i, '').downcase
      if @valid.include?(beat)
        self.list.append(beat) 
        beats_added +=1
      end 
    end
    beats_added
  end

  def prepend(data)
    a = data.split(' ')
    beats_added = 0
    (0...(a.length)).each do |i|
      beat = a[i].gsub(/[^a-z]/i, '').downcase
      if @valid.include?(beat)
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
    `say -r #{rate} -v #{voice} #{self.list.to_string}`
    return self.count
  end

  def reset_rate
    self.rate = 500
  end

  def reset_voice
    self.voice = "Boing"
  end
end