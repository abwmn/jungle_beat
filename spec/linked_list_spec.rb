require './lib/linked_list'
require './lib/node'


RSpec.describe LinkedList do
  it 'exists' do
    list = LinkedList.new

    expect(list).to be_instance_of(LinkedList)
    expect(list.head).to eq(nil)
  end

  it 'can append' do
    list = LinkedList.new

    expect(list.append("doop")).to eq("doop")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node).to eq(nil)
    list.append("deep")
    expect(list.head.next_node).to be_a Node
    expect(list.head.next_node.data).to eq("deep")
    expect(list.head.next_node.next_node).to eq(nil)
    list.append("boop")
    expect(list.head.next_node.next_node.data).to eq("boop")
  end

  it 'can count' do
    list = LinkedList.new

    expect(list.count).to eq(0)
    list.append("deep")
    expect(list.count).to eq(1)
    list.append("doop")
    expect(list.count).to eq(2)
    list.append("boop")
    expect(list.count).to eq(3)
  end

  it 'converts to string' do
    list = LinkedList.new

    expect(list.to_string).to eq("")
    list.append("deep")
    expect(list.to_string).to eq("deep")
    list.append("doop")
    expect(list.to_string).to eq("deep doop")
    list.append("boop")
    expect(list.to_string).to eq("deep doop boop")
  end

  it 'can prepend' do
    list = LinkedList.new

    list.append("doop")
    list.append("boop")
    list.prepend("deep")
    expect(list.head.data).to eq("deep")
    expect(list.to_string).to eq("deep doop boop")
  end

  it 'can insert' do
    list = LinkedList.new

    list.append("deep")
    list.append("boop")
    list.insert(3, "doop")
    expect(list.to_string).to eq("deep boop doop")

    list.append("meep")
    list.append("moop")
    list.insert(3, "loop")
    expect(list.to_string).to eq("deep boop doop loop meep moop")
    list.prepend("hype")
    list.insert(8, "type")
    expect(list.to_string).to eq("hype deep boop doop loop meep moop type")
    list.insert(5, "stoop")
    expect(list.to_string).to eq("hype deep boop doop loop stoop meep moop type")
    list.insert(8, "swipe")
    expect(list.to_string).to eq("hype deep boop doop loop stoop meep moop swipe type")
    list.insert(11, "gripe")
    expect(list.to_string).to eq("hype deep boop doop loop stoop meep moop swipe type gripe")

    list = LinkedList.new
    list.insert(5, "hope")
    expect(list.to_string).to eq("hope")
    list.insert(-1, "pray")
    expect(list.to_string).to eq("pray hope")
    list.insert(-100, "plead")
    expect(list.to_string).to eq("plead pray hope")
  end

  it 'can find' do
    list = LinkedList.new

    list.append("deep")
    list.append("doop")
    list.append("boop")
    list.append("loop")
    list.append("meep")
    list.append("moop")

    expect(list.find(1, 2)).to eq("doop boop")
    expect(list.find(2, 4)).to eq("boop loop meep moop")
    expect(list.find(0, 6)).to eq("deep doop boop loop meep moop")
    expect(list.find(0, 7)).to eq("bad quantity, try again")
    expect(list.find(-4, -1)).to eq("bad quantity, try again")
    expect(list.find(-4, 1)).to eq("boop")
    expect(list.find(-4,2)).to eq("boop loop")
    expect(list.find(-100,90)).to eq("bad position, try again")
    expect(list.find(-4, 500000000000000000)).to eq("bad quantity, try again")
  end

  it 'is inclusive' do
    list = LinkedList.new

    list.append("deep")
    list.append("doop")
    list.append("meep")
    expect(list.includes?("deep")).to eq(true)
    expect(list.includes?("dep")).to eq(false)
    expect(list.includes?("deep doop")).to eq(true)
    expect(list.includes?("deep doop me")).to eq(true)
    
    list = LinkedList.new
    list.append(1)
    list.append(17)
    expect(list.includes?(1)).to eq(true)
    expect(list.includes?("1")).to eq(true)
    expect(list.includes?("1 1")).to eq(true)
  end

  it 'can pop' do
    list = LinkedList.new

    expect(list.pop).to eq(nil)

    list.append("Deep")
    expect(list.pop).to eq("Deep")
    expect(list.head).to eq(nil)
    expect(list.to_string).to eq('')

    list.append("deep")
    list.append("doop")
    list.append("boop")
    list.append("meep")
    
    expect(list.pop).to eq("meep")
    expect(list.to_string).to eq("deep doop boop")
    list.pop
    expect(list.to_string).to eq("deep doop")
  end
end