require_relative '../domain/orcamento.rb'
require_relative '../domain/item_orcamento.rb'

module Geo
	module Service
		class Orcamento
			def self.novo
				return Geo::Core::Orcamento.new
			end

			#FIXME fazer tratamento de errors
			def self.salvar(params)
				begin
					orcamento = Geo::Core::Orcamento.new params
					raise orcamento.errors unless orcamento.valid? 
					orcamento.save
					criar_itens_para orcamento, params[:itens_attributes]
					return orcamento
				rescue
					raise ""
				end
			end

			private
				def self.criar_itens_para(orcamento, param)
					itens = Array.new
					param.each do |chave, valor|
						item = Geo::Core::ItemOrcamento.new valor
						itens.push item if item.valid?
					end
					orcamento.itens.push itens
				end
		end
	end
end



