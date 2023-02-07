require "./lib/jungle_beat"
require "./lib/linked_list"
require "./lib/node"

RSpec.describe JungleBeat do
  it 'exists' do
    jb = JungleBeat.new

    expect(jb).to be_instance_of(JungleBeat)
    expect(jb.list).to be_a(LinkedList)
    expect(jb.list.head).to eq(nil)
  end

  it 'can append' do
    jb = JungleBeat.new

    jb.append("deep")
    expect(jb.list.head).to be_a(Node)
    expect(jb.list.head.data).to eq("deep")
    expect(jb.list.count).to eq(1)
    jb.append("doop boop")
    expect(jb.list.to_string).to eq("deep doop boop")
    expect(jb.list.count).to eq(3)
    jb.append("meep moop loop stoop")
    expect(jb.list.to_string).to eq("deep doop boop meep moop loop stoop")
    expect(jb.list.count).to eq(7)
  end

  it 'can play' do
    jb = JungleBeat.new

    jb.append("deep, doop, meep, moop")
    jb.play
  end
end