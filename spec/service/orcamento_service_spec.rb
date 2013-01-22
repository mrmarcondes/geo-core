require 'spec_helper'

describe Geo::Service::Orcamento do

  describe "criando orcamento" do
    let(:orcamento_valido) do
      orcamento_valido = {descricao: "minha_descricao", cliente: "meu_cliente", 
                itens_attributes: {
                              "0" => {codigo_material: "1.1", quantidade: "1"}, 
                              "1" => {codigo_material: "2.2", quantidade: "2"}
                            }
                }
    end

    let(:orcamento_valido_sem_itens) do
      orcamento_valido = {descricao: "minha_descricao", cliente: "meu_cliente"}
    end

    let(:orcamento_invalido) do
      orcamento_invalido = {descricao: nil, cliente: "meu_cliente", 
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
      lambda {orcamento = Geo::Service::Orcamento.salvar orcamento_invalido}.should raise_error()
    end
  end

end
