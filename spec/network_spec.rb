require 'spec_helper'

describe Phren, "#network" do
  context "with parameters" do
    it "the network is initialized" do
      inputs = [[0,0],[0,1],[1,0],[1,1]]
      outputs = [0,1,1,0]
      
      net = Network.new()
      net.forward
      expect(net.my_variable).to eq true 
    end
  end
end
