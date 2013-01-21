require 'mongoid'
require 'geo-core/domain/orcamento'
require 'geo-core/domain/item_orcamento'
require 'geo-core/service/orcamento_service'

current_path = File.expand_path File.dirname(__FILE__) 
Mongoid.load!(current_path << "/mongoid.yml", :development)
#Dir['./lib/geo-core/domain/*.rb'].each {|file| require file }
#Dir['./lib/geo-core/service/*.rb'].each {|file| require file }
#Dir['./lib/*.rb'].each {|file| require file }