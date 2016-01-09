module Phren
  
  class Synapse
    
    attr_accessor :weight
    attr_reader :from, :to

    # @param [Phren::Neuron] where synapse starting
    # @param [Phren::Neuron] where synapse is ending
    # @param [Phren::Neuron] synapse wheight
    def initialize(from, to, weight)
      @from = from
      @to = to
      @weight = weight
    end

  end

end
