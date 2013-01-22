require 'spec_integration_helper'

describe Geo::Service::Orcamento do

  describe "salvando orcamentos" do
    it "deve salvar orcamento"
  end

  describe "listando orcamentos previamente cadastrados" do
    let(:orcamento_1){orcamento_1 = {descricao: "descricao_1", cliente: "cliente_1"}}
    let(:orcamento_2){orcamento_2 = {descricao: "descricao_2", cliente: "cliente_2"}}
    let(:orcamento_3){orcamento_3 = {descricao: "descricao_3", cliente: "cliente_3"}}

    before(:each) do
      Geo::Service::Orcamento.salvar orcamento_1
      Geo::Service::Orcamento.salvar orcamento_2
      Geo::Service::Orcamento.salvar orcamento_3
    end

    it "deve listar 3 orcamentos" do
      orcamentos= Geo::Service::Orcamento.todos
      orcamentos.should have(3).orcamento
    end
  end
end
