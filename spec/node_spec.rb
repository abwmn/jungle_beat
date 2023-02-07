require './lib/node'

RSpec.describe Node do
  it 'exists' do 
    data = "plop"
    node = Node.new(data)

    expect(node).to be_instance_of(Node)
    expect(node.data).to eq("plop")
    expect(node.next_node).to eq(nil)
  end
end