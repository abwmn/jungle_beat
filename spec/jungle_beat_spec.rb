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
    jb = JungleBeat.new("deep")

    expect(jb.list.head).to be_a(Node)
    expect(jb.list.head.data).to eq("deep")
    expect(jb.list.count).to eq(1)
    expect(jb.append("doop boop la")).to eq(2)
    expect(jb.list.to_string).to eq("deep boop la")
    expect(jb.list.count).to eq(3)
    expect(jb.append("Mississippi")).to eq(0)
    expect(jb.append("234098deep{}{@#(*)}")).to eq(1)
    expect(jb.list.to_string).to eq("deep boop la deep")
    expect(jb.append("tee, Dee")).to eq(2)
    expect(jb.list.to_string).to eq("deep boop la deep tee dee")
  end

  it 'can play' do
    jb = JungleBeat.new

    jb.append("deep, boop, la merp   na +MIssissiPPPPi")
    expect(jb.all).to eq("deep boop la na")
    expect(jb.rate).to eq(500)
    expect(jb.voice).to eq("Boing")
    jb.play
    #expect computer to say "deep boop la na"
    jb.rate = 100
    jb.voice = "Kathy"
    jb.play
    #expect computer to repeat the phrase slow in Kathy's voice
    jb.reset_rate
    jb.reset_voice
    jb.play
    #expect computer to repeat the phrase fast in Boing voice
  end
end