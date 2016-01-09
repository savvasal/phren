#####################################################################################
#    Phren is an Artificial Neural Network ruby gem.                                #
#    Copyright (C) 2016 Savvas Alexandrou and Contributors. See LICENSE for details #  
#                                                                                   #
#    This program is free software: you can redistribute it and/or modify           #
#    it under the terms of the GNU General Public License as published by           #
#    the Free Software Foundation, either version 3 of the License, or              #
#    (at your option) any later version.                                            #
#                                                                                   #
#    This program is distributed in the hope that it will be useful,                #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of                 #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                  #
#    GNU General Public License for more details.                                   #
#                                                                                   #
#    You should have received a copy of the GNU General Public License              #
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.          #
#####################################################################################


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
