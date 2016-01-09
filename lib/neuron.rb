module Phren
  
  class Neuron
    
    attr_accessor :value, :error_signal
    attr_reader :id
    # @param [Float] value for neuron
    # @param [Array] [layer id,index]
    def initialize(value, id)
      @value = value
      @id = id
      @error_signal = 0
    end
    
  end
  
end
