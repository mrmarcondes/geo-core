Dir['./lib/domain/*.rb'].each {|file| require file }
Dir['./lib/service/*.rb'].each {|file| require file }

require 'rspec'
require 'rspec/autorun'