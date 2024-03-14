# HMTime

A simple HMTime object for representing and performing simple math on hours and minutes. HHH:MM

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hmtime

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hmtime

## Usage

```ruby
require 'hmtime'

HMTime.new #=> 0:00
HMTime.new('') #=> 0:00
HMTime.new(0) #=> 0:00
HMTime.new('123:35') #=> 123:35
HMTime.new(61) #=> 1:01
HMTime.new(-61) #=> -1:01
'1:33'.to_hmtime #=> 1:33
'-1:33'.to_hmtime #=> -1:33
HMTime.new(61) + 1 #=> 1:02
HMTime.new('-2:01') + '2:00' #=> -0:01
HMTime.new(61) == '1:01'.to_hmtime  #=> true
HMTime.new(-61) == '1:01'.to_hmtime #=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/advorak/hmtime.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
