def __p(file)
  File.join(File.dirname(__FILE__), file.to_s)
end

module Phren
  autoload :Neuron, __p(:neuron)
  autoload :Synapse, __p(:synapse)
  autoload :Layer, __p(:layer)
  autoload :Network, __p(:network)
  autoload :Moldmaker, __p(:moldmaker)
end

def debug(*msg)
  puts(*msg) if $DEBUG
end

undef __p
