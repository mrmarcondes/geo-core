require 'spec_integration_helper'

describe Geo::Service::Orcamento do

  describe "salvando orcamentos" do
    let(:orcamento_valido) do
      {
        descricao: "minha_descricao", cliente: "meu_cliente", 
        itens_attributes: {
                            "0" => {codigo_material: "1.1", quantidade: "1"}, 
                            "1" => {codigo_material: "2.2", quantidade: "2"}
                          }
      }
    end

    let(:orcamento_valido_sem_itens) {{descricao: "minha_descricao", cliente: "meu_cliente"}}

    let(:orcamento_invalido) do
      {
        descricao: nil, cliente: "meu_cliente", 
        itens_attributes: {
                            "0" => {codigo_material: "1.1", quantidade: "1"}, 
                            "1" => {codigo_material: "2.2", quantidade: "2"}
                          }
      }
    end

    it "deve criar uma instancia vazia de orcamento e itens" do
      orcamento= Geo::Service::Orcamento.novo
      orcamento.should_not be_nil
      orcamento.should have(0).itens
    end

    it "deve salvar um orcamento valido" do
      orcamento = Geo::Service::Orcamento.salvar orcamento_valido
      orcamento.should be_valid
      orcamento.descricao.should be_equal(orcamento_valido[:descricao])
      orcamento.cliente.should be_equal(orcamento_valido[:cliente])

      orcamento.itens.should have(2).itens
    end

    it "deve salvar um orcamento valido sem itens" do
      orcamento = Geo::Service::Orcamento.salvar orcamento_valido_sem_itens
      orcamento.should be_valid
      orcamento.descricao.should be_equal(orcamento_valido_sem_itens[:descricao])
      orcamento.cliente.should be_equal(orcamento_valido_sem_itens[:cliente])
    end

    it "deve rejeitar um orcamento invalido" do
      expect {orcamento = Geo::Service::Orcamento.salvar orcamento_invalido}.to raise_error()
    end

  end

  describe "lista de orcamentos" do
    let(:orcamento_1){orcamento_1 = {descricao: "descricao_1", cliente: "cliente_1"}}
    let(:orcamento_2){orcamento_2 = {descricao: "descricao_2", cliente: "cliente_2"}}
    let(:orcamento_3){orcamento_3 = {descricao: "descricao_3", cliente: "cliente_3"}}

    before(:each) do
      Geo::Service::Orcamento.salvar orcamento_1
      Geo::Service::Orcamento.salvar orcamento_2
      Geo::Service::Orcamento.salvar orcamento_3
    end

    it "deve encontrar 3 orcamentos" do
      orcamentos= Geo::Service::Orcamento.todos
      orcamentos.should have(3).orcamento
    end

  end

  describe "finders" do
    let(:orcamento_1){orcamento_1 = {descricao: "descricao_1", cliente: "cliente_1"}}

    it "deve encontrar um orcamento especifico para uma chave valida" do
      novo_orcamento = Geo::Service::Orcamento.salvar orcamento_1

      orcamento= Geo::Service::Orcamento.por_id novo_orcamento.id
      orcamento.id.should eql(novo_orcamento.id)
      orcamento.descricao.should eql(novo_orcamento.descricao)
    end

    it "deve retornar nil quando nao encontrar um orcamento" do
      orcamento= Geo::Service::Orcamento.por_id "chave_invalida"
      orcamento.should be_nil
    end

  end

end
