require_relative '../domain/orcamento.rb'
require_relative '../domain/item_orcamento.rb'

module Geo
	module Service
		class Orcamento
			def self.novo
				return Geo::Domain::Orcamento.new
			end

			#FIXME fazer tratamento de errors
			def self.salvar(params)
				begin
					orcamento = Geo::Domain::Orcamento.new params
					raise orcamento.errors unless orcamento.valid? 
					orcamento.save
					orcamento.itens= Array.new
					orcamento.itens.push criar_itens params[:itens_attributes]
					return orcamento
				rescue Exception => e
					raise e
				end					
			end

			def self.todos
				return Geo::Domain::Orcamento.all
			end

			def self.por_id id
				return Geo::Domain::Orcamento.find id
			end


			private
				def self.criar_itens(param)
					return if !param
					itens = Array.new
					param.each do |chave, valor|
						item = Geo::Domain::ItemOrcamento.new valor
						itens.push item if item.valid?
					end
					return itens
				end
		end
	end
end



