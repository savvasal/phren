module Phren
  class Moldmaker

    # @option opts [Float] :molding_rate
    # @option opts [Float] :momentum
    # @option opts [Integer] :max_iterations
    def initialize(opts = {})
      @molding_rate = opts[:molding_rate]
      @momentum = opts[:momentum]
      @max_iterations = opts[:max_iterations]
      end

    # @param [Phren::Network] an architecture of network
    # @param [Array] with elements array of inputs
    # @param [Array] with elements array of outputs
    def mold(network, stimulus, expected_responses)
      @network = network

      1.upto(@max_iterations) { |iter|
        stimulus.each_index { |i|
          self.irritate(stimulus[i])
          self.learn(expected_responses[i])
        }
      }
      
    end
    
    def irritate(stimuli)
      
      0.upto(@network.num_of_inputs-1) { |i|
        @network.layers[0].neurons[i].value = stimuli[i]
      }
      
      
      
      1.upto(@network.num_of_layers-1) { |l|
        @network.layers[l].neurons.each { |n|
          n.value = net_input(n)
          n.value = sig(n.value)
        }
      }
      
    end
    
    def test(inputs)
      outputs = []
      irritate(inputs)
      @network.layers[@network.num_of_layers-1].neurons.each { |n|
        outputs << n.value
      }

      return outputs
      
    end


    def learn(expected_response)

      @network.layers[@network.num_of_layers-1].neurons.each_with_index { |n, i|
        expected_value = expected_response[i]
        n.error_signal = n.value * (1 - n.value) * (n.value - expected_value)
      }

      # compute deltas - error_signal
      
      
      (@network.num_of_layers-2).downto(0) { |l|
        @network.layers[l].neurons.each { |n|
          n.error_signal = n.value * (1 - n.value) * net_output(n)
        }
      }

      # TODO reduce it to one forloop
      1.upto(@network.num_of_layers-1) { |l|
        @network.layers[l].neurons.each { |n|
          @network.synapses.keys.each { |k|
            if k[1] == n.id[0]
              @network.synapses[k].each { |s|
                if (s.to == n)
                  w = s.weight
                  s.weight = s.weight - (@molding_rate * n.error_signal * s.from.value)
                  #puts "Just updated synapse from Neuron(Layer:#{s.from.id[0]},#{s.from.id[1]} to Neuron(Layer:#{s.to.id[0]},#{s.to.id[1]}) !!"
                #  puts "From #{w} became #{s.weight} with error signal #{n.error_signal} \n"
                #  puts "\n\n"
                end
              }
            end
          }
        }
      }
      
    end

    def sig(x)
      return (1 / (1 + Math.exp(-x)))
    end

    
    def net_input(neuron)
      net_j = 0
      @network.synapses.keys.each { |k|
        if k[1] == neuron.id[0]
          @network.synapses[k].each { |s|
            if (s.to == neuron)
              # from_synapses << s
              net_j += (s.from.value * s.weight)
            end
          }
        end
      }
      return net_j
    end

    # να καλείται ως προς το δίκτυο
    def net_output(neuron)
      net_o = 0
      @network.synapses.keys.each { |k|
        if k[0] == neuron.id[0]
          @network.synapses[k].each { |s|
            if (s.from == neuron)
              net_o += (s.to.error_signal * s.weight)
            end
          }
        end
      }
      return net_o
    end
    
    
  end
end
