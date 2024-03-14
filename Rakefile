require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('hmtime','0.1.2') do |p|
  p.description     = "A simple HMTime object for representing and performing math on hours and minutes. HHH:MM"
  p.url             = "http://github.com/advorak/hmtime"
  p.author          = "Andrew Dvorak"
  p.email           = "advorak@gmail.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
