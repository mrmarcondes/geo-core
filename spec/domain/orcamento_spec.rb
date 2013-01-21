require_relative '../spec_helper.rb'

describe Geo::Domain::Orcamento do
  describe "criacao" do
    it "deve criar passando parametros validos" do
      orcamento = Geo::Domain::Orcamento.new(cliente: "Cliente", descricao: "descricao")
      orcamento.cliente.should eq("Cliente")
      orcamento.descricao.should eq("descricao")
    end

    it "nao deve criar passando parametros invalidos" do
      orcamento = Geo::Domain::Orcamento.new(cliente: nil, descricao: nil)
      orcamento.should_not be_valid
    end    
  end
end
