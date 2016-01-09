Gem::Specification.new do |s|
  s.name               = "phren"
  s.version            = "0.0.0"
  s.licenses           = ['GPL-3.0']
 # s.default_executable = "phren"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Savvas Alexandrou"]
  s.date = %q{2016-01-06}
  s.description = %q{A simple neural network gem}
  s.email = %q{salexa@member.fsf.org}
  s.files = ["Rakefile", "lib/layer.rb", "lib/moldmaker.rb",
             "lib/network.rb", "lib/neuron.rb",
             "lib/synapse.rb"]
  s.test_files = ["spec/network_spec.rb"]
  s.homepage = %q{https://github.com/Savinos90/phren}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{An Artificial Neural Network gem}
  s.post_install_message = "Thanks for installing!"
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

