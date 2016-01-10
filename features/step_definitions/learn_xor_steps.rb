Given(/^a neural network with architecture$/) do |table|
  @architecture = table.raw[0].map {|i| i.to_i}
  @my_brain = Phren::Network.new(@architecture)
end

Given(/^the input layer is connected to the output layer$/) do

  @my_brain.connect_input_to_output_layer
end

Given(/^the training set of xor:$/) do |table|
  @stimulus = []
  @expected_responses = []
  table.raw.each { |line|
    @stimulus << line.take(@architecture.first).map {|i| i.to_i} 
    @expected_responses << line.last(@architecture.last).map { |i| i.to_i}
  }
end

When(/^the phren pass a training of (\d+) iterations and molding rate "([^"]*)"$/) do |max_iterations, learning_rate|
  @molder = Phren::Moldmaker.new(:molding_rate => learning_rate.to_f, :max_iterations => max_iterations.to_i)
  @molder.mold(@my_brain, @stimulus, @expected_responses)
  @inputs = []
end

=begin
Then(/^the phren should answer correct answers$/) do |table|
  table.raw.each { |line|
    inputs = line.take(@architecture.first).map {|i| i.to_i}
    output = line.last(@architecture.last).map {|i| i.to_i}
    answer = @molder.test([inputs[0],inputs[1]])[0] < 0.5 ? 0 : 1
    answer.should == output[0]
  }

end
=end

When(/^i give to phren (\d+)$/) do |a|
  @inputs << a.to_i
  puts @inputs
end

When(/^i ask the phren for the correct answer$/) do
  @answer = @molder.test([@inputs[0],@inputs[1]])[0] < 0.5 ? 0 : 1
end

Then(/^the phren should answer (\d+)$/) do |c|
  @answer.should == c.to_i
end
