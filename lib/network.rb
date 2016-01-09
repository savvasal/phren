module Phren
  
  class Network

    attr_reader :synapses, :layers, :num_of_layers
    attr_reader :num_of_inputs, :num_of_outputs
    # @param [Array] architecture of network
    # @opts options
    def initialize(architecture, opts = {})
      
      @synapses = {}
      @layers = {}

      @num_of_inputs = architecture.first
      @num_of_outputs = architecture.last
      
      @num_of_layers = architecture.length

      # TODO try to implemet it with map
      @layers[0] = Layer.new(architecture.first, 0)       
      1.upto(@num_of_layers-1) { |i| # create layers
        @layers[-i] = Layer.new(1, -i) # bias layer
        @layers[i] = Layer.new(architecture[i], i)
      }
      
      @layers.keys.each { |k|  # connect layers
        if( k < 0) # is bias
          connect_layers(@layers[k], @layers[-k])
        elsif( k > 0) # is hidden or output layer
          connect_layers(@layers[k-1], @layers[k])
        end
      }

    end

    # According to dontveter.com/bpr/basics.html is faster for xor problem 
    def connect_input_to_output_layer
      connect_layers(@layers[0], @layers[@num_of_layers-1])
    end
    
    def connect_layers(from, to)
      @synapses[[from.id, to.id]] = Array.new(from.length * to.length){ |index|
        Synapse.new(from.neurons[index % from.length], to.neurons[index % to.length], 0) # 0 could be replace with random
      }
    end

  end
end
