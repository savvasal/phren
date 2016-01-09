module Phren

  class Layer

    attr_reader :id, :neurons, :length
    
    def initialize(length, id)
      @length = length
      @id = id # num of layer starting from 0. if it's negative neurons are bias
      @neurons = Array.new(@length) { |i|
        Neuron.new(@id < 0 ? 1 : 0,[@id, i])
      }
    end
    
  end
  
end
