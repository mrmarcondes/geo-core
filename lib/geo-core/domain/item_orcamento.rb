require_relative '../../geo-core.rb'
module Geo
	module Core
		class ItemOrcamento
			include Mongoid::Document
			store_in collection: "itens_orcamento"

			belongs_to :orcamento, class_name: "Geo::Core::Orcamento"

			field :codigo_material
			field :quantidade

			validates :codigo_material, :quantidade, presence: true
			validates :quantidade, :numericality => true

		end
	end
end