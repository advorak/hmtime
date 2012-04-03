# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "hmtime"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Dvorak"]
  s.date = "2012-04-03"
  s.description = "A simple HMTime object for representing and performing math on hours and minutes. HHH:MM"
  s.email = "advorak@gmail.com"
  s.extra_rdoc_files = ["README.rdoc", "lib/hmtime.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/hmtime.rb", "Manifest", "hmtime.gemspec"]
  s.homepage = "http://github.com/advorak/hmtime"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Hmtime", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "hmtime"
  s.rubygems_version = "1.8.11"
  s.summary = "A simple HMTime object for representing and performing math on hours and minutes. HHH:MM"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
