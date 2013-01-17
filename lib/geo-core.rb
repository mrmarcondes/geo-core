require 'mongoid'
current_path = File.expand_path File.dirname(__FILE__) 
Mongoid.load!(current_path << "/mongoid.yml", :development)
Dir['./lib/domain/*.rb'].each {|file| require file }
Dir['./lib/service/*.rb'].each {|file| require file }
Dir['./lib/*.rb'].each {|file| require file }